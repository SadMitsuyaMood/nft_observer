#!/bin/bash
# run only from 'melos run clean'

rmFiles()
{
	FILES="$1"
	MASK="$2"
	for f in $FILES
	do
		if [ -d "$f" ]; then
			rmFiles "$f/*" "$MASK"
		elif [[ "$f" == *"$MASK" ]]; then
			rm "$f"
			echo "Deleted $f"
		fi
	done
}

rmDirs()
{
	DIRS="$1"
	MASK="$2"
	for f in $DIRS
	do
		if [ -d "$f" ]; then
			if [[ "$f" == *"$MASK" ]]; then
				echo "rm -rf $f"
				rm -rf "$f"
			else
				rmDirs  "$f/*" "$MASK"
			fi
		fi
	done
}

rmDirs "./*" "Pods"
rmFiles "./*" "Podfile.lock"
rmFiles "./*" "pubspec.lock"
rmFiles "./*" ".g.dart"
rmFiles "./*" ".gr.dart"
