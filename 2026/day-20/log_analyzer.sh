#!/bin/bash


if [ $# -eq 0 ]
then
	echo "Usage: ./log_analyzer.sh <path of log file>"
	exit 1
fi

if [ ! -f  "$1" ]
then 
	echo "File doesnot exist,"
	exit 1

fi

ARC_PATH=/opt/archives
LOG_PATH="$1"
File=log_report_$(date +%Y-%m-%d).txt
error_count() {

	total=$(($(grep -c "ERROR" "$LOG_PATH") + $(grep -ic "failed" "$LOG_PATH")))
	echo "The total no of lines containing Keyword ERROR or failed:"$total"" | tee -a "$File"

}

critical_events() {

	echo "-------------CRITICAL EVENTS-----------------------" | tee -a "$File"
	grep -n "CRITICAL" "$LOG_PATH" | tee -a "$File"


}

top_error_messages() {

	echo "--------------Top 5 Error Messages---------------------"|tee -a "$File"
	grep "ERROR" "$LOG_PATH" | awk '{print $4,$5,$6}'|sort | uniq -c | sort -rn | head -5 | tee -a "$File"


}

total_lines_processed() {
	echo "Total Lines processed:"| tee -a "$File";wc /opt/logs/sample.log | awk '{print $1}'|tee -a "$File"


}

archiving_logs() {
	
	if [ ! -d "$ARC_PATH" ]
	then
		echo "Creating Archive Directory,as Directory doesnot exist" |tee -a "$File"; mkdir -p "$ARC_PATH"
	fi

	mv "$LOG_PATH" "$ARC_PATH"
	echo "Log archived" | tee -a "$File"


}


summary_report() {
	touch "$File"
	echo "-------------------------------------------------------------------" | tee -a "$File"
	echo "Date of Analysis :"| tee -a "$File";date +%Y-%m-%d | tee -a "$File"
	echo "-------------------------------------------------------------------" | tee -a "$File"
	echo "Log Filename:"$LOG_PATH"" | tee -a "$File"
	echo "-------------------------------------------------------------------" | tee -a "$File"
	total_lines_processed
	echo "-------------------------------------------------------------------" | tee -a "$File"
	error_count
	echo "-------------------------------------------------------------------" | tee -a "$File"
	top_error_messages
	echo "-------------------------------------------------------------------" | tee -a "$File"
	critical_events
	echo "-------------------------------------------------------------------" | tee -a "$File"
	archiving_logs
	echo "END OF REPORT" | tee -a "$File"

}

summary_report
