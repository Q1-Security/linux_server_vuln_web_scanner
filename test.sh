#!/bin/bash
CREATE_FILE="18501013_RGW_security.json"
echo "{" > $CREATE_FILE 2>&1
echo '  "system_info": "'$(uname -a)'",' >> $CREATE_FILE 2>&1
echo '  "ip_address": "'$(hostname -I | awk '{print $1}')'",' >> $CREATE_FILE 2>&1
echo '  "date_time": "'$(date +'%Y-%m-%d %H:%M:%S')'",' >> $CREATE_FILE 2>&1
echo '  "results": [' >> $CREATE_FILE 2>&1
echo '    {' >> $CREATE_FILE 2>&1
echo '      "title": "01.Default ID",' >> $CREATE_FILE 2>&1
echo '      "content": [' >> $CREATE_FILE 2>&1
if [ `cat /etc/passwd | egrep "lp:|uucp:|nuucp:" | wc -l` -eq 0 ]
	then
		echo '        "lp, uucp, nuucp not found"' >> $CREATE_FILE 2>&1
	else	
		echo '        "'$(cat /etc/passwd | egrep "lp:|uucp:|nuucp:")'"' >> $CREATE_FILE 2>&1
fi	
echo '      ]' >> $CREATE_FILE 2>&1
echo '    }' >> $CREATE_FILE 2>&1
echo '  ]' >> $CREATE_FILE 2>&1
echo '}' >> $CREATE_FILE 2>&1
curl -H "Content-Type: application/json" -X POST -d @$CREATE_FILE http://175.121.147.128:8486/1.php
