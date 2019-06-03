#!/bin/bash
find $1 -type f -print0 | grep -zFf /home/osmc/scripts/clean.up| xargs -0 rm

