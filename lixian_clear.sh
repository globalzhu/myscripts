#!/bin/bash

/store/yaourt/xunlei-lixian-git/xunlei-lixian/lixian_cli.py list | while read line
do
task_id=$(echo $line|awk '{print $1}')
echo "deleting $line ..."
/store/yaourt/xunlei-lixian-git/xunlei-lixian/lixian_cli.py delete $task_id
done

