
#!/bin/bash


LOG_PATH=/var/log/maintenance.log

if [ -f "$LOG_PATH" ]
then
	echo "Log file exists"
else 
	echo "Creating log file"
	touch $LOG_PATH

fi

log() {
	echo "$(date) :$1" | tee -a "$LOG_PATH"

}




log_rotate() {
	sudo bash log_rotate.sh /opt/logs
	log "executing log_rotate.sh"

	

}


backup() {
	sudo bash backup.sh /opt/logs /opt/backup
	log "executing backup.sh"


}
log "calling log_rotate()"
log_rotate
log "calling backup()"
backup

log "end of script"


