| Topic           | Key Syntax              | Example                                       |
| --------------- | ----------------------- | --------------------------------------------- |
| Make Executable | `chmod +x file.sh`      | `chmod +x script.sh`                          |
| Run Script      | `./file.sh`             | `./script.sh`                                 |
| Comment         | `# comment`             | `echo "Hi" # inline comment`                  |
| Variable        | `VAR="value"`           | `NAME="DevOps"`                               |
| Use Variable    | `$VAR`                  | `echo $NAME`                                  |
| Read Input      | `read VAR`              | `read USER`                                   |
| Arguments       | `$1 $2 $# $@ $?`        | `./script.sh arg1`                            |
| String Compare  | `[ "$a" = "$b" ]`       | `[ "$name" = "India" ]`                       |
| Integer Compare | `[ $a -gt 10 ]`         | `[ $num -eq 11 ]`                             |
| File Test       | `[ -f file ]`           | `[ -f <filename> ]`                           |
| If Condition    | `if [ cond ]; then`     | `if [ -f file ]; then echo file exists; fi`   |
| Case Statement  | `case $v in ... esac`   | `case $1 in start) echo run ;; esac`          |
|  AND            | `cmd1 && cmd2`          | `mkdir test && cd test`                       |
|   OR            | `cmd1 \|\| cmd2`        | `cd dir \|\| pwd`                             |
| For Loop        | `for i in list; do`     | `for i in 1 2 3; do echo $i; done`            |
| C-Style For     | `for ((i=1;i<=3;i++))`  | `for ((i=1;i<=3;i++)); do touch f$i; done`    |
| While Loop      | `while [ cond ]; do`    | `while [ $a -lt 5 ]; do echo $a; done`        |
| Until Loop      | `until [ cond ]; do`    | `until [ -f /tmp/ready.txt ]; do echo "File not found yet..."; sleep 1; done` |
| Break           | `break`                 | `if [ $i -eq 7 ]; then break; fi`             |
| Continue        | `continue`              | `if [ $i -eq 2 ]; then continue; fi`          |
| Function        | `name() { ... }`        | `greet(){ echo "Hi"; }`                       |
| Function Arg    | `$1 inside function`    | `add(){ echo $(($1+$2)); }`                   |
| Return Status   | `return 0`              | `return 1`                                    |
| Capture Output  | `result=$(func)`        | `val=$(date)`                                 |
| Local Variable  | `local var=value`       | `local count=10`                              |
| grep            | `grep pattern file`     | `grep -i "error" log.txt`                     |
| awk             | `awk '{print $1}' file` | `awk -F: '{print $1}' /etc/passwd`            |
| sed             | `sed 's/a/b/g' file`    | `sed -i 's/foo/bar/g' file.txt`               |
| cut             | `cut -d: -f1 file`      | `cut -d: -f1 /etc/passwd`                     |
| sort            | `sort file`             | `sort -n numbers.txt`                         |
| uniq            | `sort file \| uniq`     | `sort file \| uniq -c`                        |
| tr              | `tr 'a-z' 'A-Z'`        | `echo hi \| tr 'a-z' 'A-Z'`                   |
| wc              | `wc -l file`            | `wc -w file.txt`                              |
| head            | `head -n 5 file`        | `head -n 20 log.txt`                          |
| tail            | `tail -f file`          | `tail -100f app.log`                             |




# 🐚 Shell Scripting Cheatsheet

A comprehensive, single-page reference for Bash shell scripting.

---

## 🚀 1. Basics & Execution

### Shebang (`#!`)
The first line of any script. It defines the interpreter to be used.
* `#!/bin/bash` — Uses the Bash shell.
* `#!/bin/sh` — Uses the default system shell.

### Execution Commands
| Command | Description |
| :--- | :--- |
| `chmod +x script.sh` | Grants execute permissions to the file. |
| `./script.sh` | Runs the script in the current directory. |
| `bash script.sh` | Runs the script explicitly using the Bash interpreter. |

### Comments
* **Single Line:** `# This is a comment`
* **Heredoc (Multiline/Inline):**
    ```bash
    cat << EOF
    This block allows you to output
    multiple lines or comment out
    large sections of text.
    EOF
    ```

---

## 📦 2. Variables & Input

### Variable Handling
* **Declaration:** `VAR="Value"` (No spaces around `=`).
* **Usage:** `$VAR` or `${VAR}`.
* **Weak Quoting:** `"$VAR"` (Variables are expanded).
* **Strong Quoting:** `'$VAR'` (Literal string; no expansion).

### User Input
```bash
read -p "Enter your name: " username
echo "Hello, $username"
```
| Variable | Description |
| :--- | :--- |
| $0 |The first, second, and subsequent arguments. |
| $1, $2...| Runs the script in the current directory. |
| $# | Total no of arguments passed to the script. |
| $@ | All arguments passed as a list (space-separated). |
| $? | Exit status of the last executed command (0 = Success). |


## ⚖️ 3. Comparisons & Tests

### String Comparisons

* **= : True if strings are equal.**
* **!= : True if strings are not equal.**
* **-z "$str" : True if the string is empty.**
* **-n "$str" : True if the string is not empty.**

### Integer Comparison 

| Operator | Description |
| :--- | :--- |
| -eq | Equal to |
| -ne | Not equal to |
| -lt | less than to |
| -gt | greater than |
| -le | less than equal to |
| -ge | greater than equal to |

### File Test Operators

* **-e : True if file or directory exists.**
* **-f : True if file exists.**
* **-d : True if directpry exists.**
* **-s : True if file/directory size is greater than 0.**
* **-r,-w,-x : True if file has Read,Write,or Execute permissions.**

## For Directories
* **-r : True if the directory exists and the user can list the names of the files inside the directory.**
* **-w : True if you can create, delete, or rename files and subdirectories within that directory.**
* **-x : True if you can enter the directory (using cd) or access the metadata (like size or timestamps) of the files inside.**

### 🛠️ 4. Logic & Conditionals

## If-Else Syntax

```bash
if [[ condition ]]; then
    # commands
elif [[ condition ]]; then
    # commands
else
    # commands
fi
```

## Logical Operators

* **&& (AND): cmd1 && cmd2 — Runs cmd2 only if cmd1 succeeds.**
* **|| (OR): cmd1 || cmd2 — Runs cmd2 only if cmd1 fails.**
* **! (NOT): Inverts the result of a condition.**
```bash
[[ ! -f "config.sh" ]] #True if the file does not exist
! systemctl is-active --quiet service_name #True if the service is not running 
```
## Case Statements 

```bash
case "$variable" in
    "pattern1") 
        # Commands ;;
    "pattern2"|"pattern3") 
        # Commands ;;
    *) 
        # Default case (wildcard) ;;
esac

#Example:

status="404"
case "$status" in

    "200")

        echo "Success: OK"

        ;;

    "404"|"403")

        echo "Client Error: ${error_map[$status]}"

        ;;

    "5"*)

        echo "Server Error: Starts with 5"

        ;;

    *)

        echo "Unknown Status"

        ;;

esac

```

### 🔄 5. Loops & Control Flow

* **List based:**
  ```bash
  for i in apple banana; do echo $i; done
  ```
* **Range-based:**
  ```bash
  for i in {1..5}; do echo $i; done
  ```
* **C-Style:**
  ```bash
  for (( i=0; i<5; i++ )); do echo $i; done
  ```
* **Array-based:**
  ```bash
    fruits=("apple" "banana" "mango")
    for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
    done
  ```
## While & Until
* **while [ condition ]: Loops as long as the condition is true.**
* **until [ condition ]: Loops as long as the condition is false.**

## Loop Control
* **break: Exit the loop immediately.**
*  **continue: Skip the current iteration and move to the next.**
* **Looping Over files:**
  ``` bash
      for file in *.log; do echo $file; done**

  #while
      ls | while read line; do
    echo "File found: $line"
       done
  ```

### Functions

* **Defining a function**
  ```bash
  function_name() {
  #comands
  }
  #Example
  greet() {
      read -p "Enter your name" name
      echo "Hello,$name !"
  }
  ```
* **Calling a function**
  ``` bash
  function_name

  ex:
  greet
  ```
* **Passing Arguments to a function**
  ```bash
  add() {
	sum=$(($1 + $2))

	echo "Sum of two number is:$sum"

   }

   add 1 2 #passing arguments to the function
  ```
## Return values
* return (Exit Status)
The return keyword is used only for numeric exit statuses (0 to 255). It tells the script whether the function succeeded or failed.
  * Purpose: Status signaling (Success/Failure).
  * Capture Method: Check the $? variable immediately after calling the function.
```bash
is_directory() {
    if [[ -d "$1" ]]; then
        return 0 # Success
    else
        return 1 # Failure
    fi
}

is_directory "/etc"
if [ $? -eq 0 ]; then
    echo "It's a directory!"
fi
```
* echo (data output)
  To "return" actual data (like a string or a calculated number), you echo the result. The calling code then captures that output using Command Substitution.
  * Purpose: Data transfer.
  * Capture Method: Wrap the function call in $( ).
  ``` bash
  get_user_role() {
    # Logic here
    echo "admin" 
  }

  # Capture the echoed output into a variable
  role=$(get_user_role)
  echo "User role is $role"

  ```
## Local variables

The local Keyword
Using local ensures that a variable exists only within the function scope. This prevents "variable pollution" and bugs where a function accidentally changes a global variable.
* Global (Default): Accessible anywhere in the script.
* Local: Accessible only inside the function where it is declared.
  **Example**
  ``` bash
  var="I am Global"

  my_function() {
    local var="I am Local"
    echo "Inside function: $var"
  }

  my_function
  echo "Outside function: $var" 
  # Output will still be "I am Global" because of the 'local' keyword

   ```
### Text Processing Commands

* `grep` : **This command is used to search for patterns**
  * `-i` : **To ignore case**
  * `-r` : **Search recursive**
  * `-c` : **Count the no of occurrences of the pattern**
  * `-n` : **Show the matched pattern & its corresponding line number**
  * `-v` : **Return lines that doesnot match/contain the pattern**
  * `-E` : **Extended regex**
  **Examples**
    ```bash
    grep -i error /opt/logs/sample.log #searches for the word error irrespective of the case 
    grep  -r "nginx" /  #search for nginx in all the directories and sub-directories under the / directory 
    grep -c "CRITICAL" /optlogs/sample.log # returns the no of occurrences of the word CRITICAL in sample.log
    grep -n "CRITICAL" /optlogs/sample.log  #searches for the line number and the line containing CRITICAL
    grep -v "INFO" /opt/logs/sample.log #searches for line that doesnot contain INFO     
    grep -E "Error|Warning" logfile.txt # searches for error or warning in logfile.txt

    ```bash

* `awk` : Process and extract text from files or input,especially by columns/fields.
  * **Syntax**:
    ```bash
    awk 'pattern { action }' file
    ```
   **Example**:
    ```bash
    print columns: Extract and display specific columns from text.
    awk '{print $1, $2}' file
    awk '{print $1}' /etc/passwd
    ```
    ```bash
    field separator: Specify a custom delimiter instead of default spaces/tabs.
    awk -F":" '{print $1, $3}' file
    awk -F":" '{print $1, $3}' /etc/passwd
    ```
    ```bash
    patterns: Perform actions only on lines matching a pattern.
    awk '/pattern/ { action }' file
    awk '/root/ {print $1}' /etc/passwd
    ```
    ```bash
    BEGIN/END: Execute actions before or after processing the file
    awk 'BEGIN { ... } { ... } END { ... }' file
    awk 'BEGIN {print "Users list:"} {print $1} END {print "Done"}' /etc/passwd
    ```
    ```bash
    df -h | awk 'NR=2{print $6}' #prints value of 6 coloumn in second row
    ```
  * `sed` : To edit or transform text streams like replacing,deleting, or modifying lines.
    * **Syntax**:      
    ```bash
    sed [options] 'command' file
    ```
    **Example**:
    ```bash
    substitution: Substitute first match in a line & It prints the modified text to your terminal (stdout) but does not change the original file
    sed 's/pattern/replacement/' file
    sed 's/error/ERROR/' file.txt
    ```
    ```bash    
    delete lines: Delete line 2.
    sed 'Nd' file
    sed '2d' file.txt
    ```

    ```bash
    In-place edit: Modify the file directly at all the occurence of the pattern instead of just printing output.
    sed -i 's/pattern/replacement/g' file
    sed -i 's/error/ERROR/g' file.txt
    ```
  * `cut` : extract columns by delimiter
    **Syntax**:
    ```bash
    cut -d "delimiter" -f N file
    -d: specify the field delimiter
    -f specify the field/column number(s) to extract.
    ```
    **Example**:
    ```bash
    Extract first column (username) from /etc/passwd
    cut -d ":" -f1 /etc/passwd
    ```

* `sort`:Arrange lines in a file alphabetically,numerically,reverse,or remove duplicates
   **Syntax**:
    ```bash
    sort [options] file
    -n: numeric sort
    -r: reverse order
    -u: remove duplicates (unique)
    ```
  **Example**:
    ```bash
    Alphabetical sort (default): sort file.txt
    Numeric sort: sort -n numbers.txt
    Reverse order: sort -r file.txt
    Unique lines only: sort -u file.txt
    ```


* `uniq`:
  Removes consecutive duplicate lines,also count occurrences. 
   **Syntax**:
    ```bash
    uniq [options] [input_file]
    ```
   **Example**
    ```bash
    # uniq works correctly for all duplicates only if input is sorted.
    sort file.txt | uniq          # remove all duplicates
    sort file.txt | uniq -c       # count occurrences
    uniq -u file.txt              # show only unique lines
    ```


* `tr`:
Translates/deletes characters from input.
  **Syntax**:
  ```bash
        tr [options] SET1 [SET2]
  ```
  **Example**:
    ```bash
        echo "hello"     | tr 'a-z' 'A-Z'   # convert to uppercase
        echo "hello 123" | tr -d '0-9'  # delete digits
    ```

* `wc`:
Provides counts for lines,words, or characters in a file
  **Syntax**
```bash
        wc [options] [file]
```
 **Example**
    ```bash
        wc -l file.txt    # line count
        wc -w file.txt    # word count
        wc -c file.txt    # character count
    ```
    
* `head/tail`:
  Display the first or last N lines of a file; tail -f follows live updates.
  **Syntax**:
    ```bash
        head/tail [options] filename
    ```

  **Example**:
    ```bash
        head -n 5 file.txt                  # first 5 lines
        tail -n 5 file.txt                  # last 5 lines
        tail -f /var/log/nginx/access.log   # live updates
    ```

### Useful Patterns and One-Liners

**Find and delete files older than N days**
```bash
find . -type f -mtime +N -exec rm -f {} \;
find /var/log -type f -name "*.log" -mtime +15 -exec rm -f {} \;
```
**Count lines in all `.log` files**
```bash
wc -l /opt/logs/*.log

```
**Replace a string across multiple files**
```bash
find . -type f -name "*.txt" -exec sed -i 's/old_text/new_text/g' {} +
sed -i 's/old_text/new_text/g' *.conf
```

**Check if a service is running**
```bash
sudo systemctl is-active --quiet nginx && echo "Running" || echo "Stopped"

```
**Monitor disk usage with alerts**
```bash
[ $(df / | awk 'NR==2 {print $5}' | sed 's/%//') -gt 80 ] && echo "Disk usage is critical on $(hostname)" | mail -s "Disk Space Alert" admin@example.com
```
**Parse CSV or JSON from command line**
```bash
awk -F',' '{print $1, $3}' data.csv  # Prints the 1st and 3rd column of data.csv
```
**Tail a log and filter for errors in real time**
```bash
tail -f /opt/logs/sample.log | grep -i error
tail -f /var/log/app.log | grep -E --line-buffered "ERROR|CRITICAL|FATAL"  # --line-buffered is crucial here. It forces grep to output lines immediately rather than waiting for a buffer to fill, which is essential for real-time viewing.

```



## 🛡️ 8. Error Handling & Debugging
* `$?` — Capture last exit code (0=success).
* `set -e` — Exit script on any command failure.
* `set -u` — Exit on undefined variables.
* `set -o pipefail` — Catch errors inside pipes.
* `set -x` — Print commands (Debug Mode).
* `trap 'cmd' EXIT` — Runs 'cmd' automatically on script exit.
* `exit 0` — Script ends successfully
* `exit 1` — Script ends with failure

## 📤 9. Redirection (Streams)
* `> file` — Overwrite stdout.
* `>> file` — Append stdout.
* `2> file` — Redirect stderr.
* `&> file` — Redirect both stdout and stderr.
* `/dev/null` — Discard output.
