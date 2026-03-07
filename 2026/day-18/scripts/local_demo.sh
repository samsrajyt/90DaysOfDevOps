#!/bin/bash

var=20

scope() {

	local var=10
	echo "Printing the local variable:$var"
}

echo "Printing the global variable:$var"
scope

regular_scope() {
	var=30
	echo "Printing without local keyword:$var"
}

regular_scope
echo "Printing the global variable again:$var"


