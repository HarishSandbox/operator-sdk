#!/usr/bin/env bash
set -e
echo "hello world"
old_changes=$(git diff --name-only $TRAVIS_COMMIT_RANGE -- ./doc | wc -l)
new_changes=$(git diff --name-only $TRAVIS_COMMIT_RANGE -- ./website | wc -l)
if [ "$old_changes" -eq 0 ]; then
	  exit 0
fi
if [ "$old_changes" -ne "$new_changes" ]; then
	  echo "ERROR: Docs changes in ./doc not found in ./website"
	    echo ""
	      echo "**** ./doc changes: ****"
	        echo "$(git diff --name-only $TRAVIS_COMMIT_RANGE -- ./doc)"
		  echo ""
		    echo "**** ./website changes: ****"
		      echo "$(git diff --name-only $TRAVIS_COMMIT_RANGE -- ./website)"
		        exit 1
fi
