#!/bin/sh
dir=`dirname $0`
oldpwd="$PWD"
failed=0
cd "$dir"
for i in tests/*.py; do
	testname=`basename $i .py`
	echo "$testname" | grep "^_" > /dev/null && continue
	echo "Running tests in $testname"
	python -m tests.$testname || failed=1
	echo
done
cd "$oldpwd"
[ $failed -eq 0 ] && echo "All tests pass" || echo "FAILURES DETECTED"
exit $failed
