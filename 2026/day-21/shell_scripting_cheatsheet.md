Task 1: Basics
Document the following with short descriptions and examples:

Shebang (#!/bin/bash) — what it does and why it matters
Any script starts with shebang and its tell the interpreter which shell to use.

Running a script — chmod +x, ./script.sh, bash script.sh

Comments — single line (#) and inline (starts with <<< keyword and end keyword)

Variables — declaring, using, and quoting ($VAR, "$VAR", '$VAR')

Reading user input — read -p " ...Comments....  "

Command-line arguments — $0, $1, $#, $@, $?
$0 ---> refers to the name of the script
$1 ---> the first argument 
$# ---> no of arguments passed 
$@ ---> Total no of arguments passed 
$? ---> Exit code of the last command executed 



String comparisons — =, !=, -z, -n

= : checks if two strings are equal 
!= : checks if two strings are not equal 
-z : checks if the string is empty 
if [ -z "$my_string" ];then
    echo "The string is empty."
fi

-n : returns true if the string is not empty else false
if [ -n "$error_message" ]; then
    echo "An error occurred: $error_message"
fi
------------------------------------------------------
Integer comparisons — -eq, -ne, -lt, -gt, -le, -ge
-eq : true, if two integers are equal ,else false
-ne : true, if two integers are not equal , else false
-lt : true, if first integer is less than second integer, else false
-gt : true, if first integer is greater then second integer, else false
-le : true, if first integer is less than equal to second integer, else false
-ge : true, if first integer is greater than equal to second integer, else false
File test operators — -f, -d, -e, -r, -w, -x, -s
-f : true if file exists
-d : true if directory exists 
-e : returns true if file or directory exists
for files:
-r : returns true if file exists and the user running the script has read permissions
-w : returns true if file exists and the user running the script has write permissions
-x : returns true if file exists and the user running the script has execute permissions
for directories:
-r : returns true if the directory exists and the user can list the names of the files inside the directory
-w : True if you can create, delete, or rename files and subdirectories within that directory. 
-x : True if you can enter the directory (using cd) or access the metadata (like size or timestamps) of the files inside

-s : Returns true if the file/directory exits and its size is greater than 0.

if, elif, else syntax
if [ ]
then 
.....
elif [ ]
........
else 

fi
--------------------------------------------------------------------------------------
Logical operators — &&, ||, !
In Bash, these logical operators allow you to chain commands and evaluate multiple conditions within [[ ]] or (( )).
1. AND (&&)
The second command runs only if the first one succeeds (exit status 0).
In a test: [[ $a -eq 1 && $b -eq 2 ]] (True only if both are true).
As a shortcut: mkdir my_dir && cd my_dir (Only cd if the directory was successfully created).
2. OR (||)
The second command runs only if the first one fails (exit status non-zero).
In a test: [[ $status -eq 404 || $status -eq 500 ]] (True if either is true).
As a shortcut: grep "error" log.txt || echo "No errors found" (Only echo if grep finds nothing).
3. NOT (!)
Inverts the result of a condition or command.
In a test: [[ ! -f "config.sh" ]] (True if the file does not exist).
With commands: ! systemctl is-active --quiet service_name (True if the service is not running).
------------------------------------------------------------------------------------------------
Case statements — case ... esac
case "$variable" in
    pattern1)
        # Commands if variable matches pattern1
        ;;
    pattern2|pattern3)
        # Commands if variable matches pattern2 OR pattern3
        ;;
    *)
        # Default case (wildcard) if no other patterns match
        ;;
esac

Example:
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
---------------------------------------------------------------------------

Task 3: Loops
Document with examples:

1.for loop — list-based and C-style
list based:
for i in "apple banana mango";do
    echo $i
done
---------------------------------------
2.for i in {1..10}; do
    echo "Number $i"
done
-------------------------------------
3.fruits=("apple" "banana" "mango" "kiwi" "pineapple")

for fruit in ${fruits[@]};do
        echo $fruit
done

-------------------------------------
C-based
4.for (( i=0; i<5; i++ )); do
    echo "Counter: $i"
done

-------------------------------------
while loop


until loop
Loop control — break, continue
Looping over files — for file in *.log
Looping over command output — while read line



