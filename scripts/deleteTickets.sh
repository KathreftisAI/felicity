#!/bin/bash
psql -d otrs postgres -c 'SELECT max(id) FROM ticket' > /tmp/output.txt
input="/tmp/output.txt"
let count 0
let incr 1
while IFS= read -r var
do
  if [ "$count" == "2" ]
  then
        for i in `seq 1 $var`;
        do
                su -c "bin/otrs.Console.pl Maint::Ticket::Delete --ticket-id $i" -s /bin/bash otrs
                rm -f /tmp/output.txt
        done
  fi
  count=$((count+1))

done < "$input"
                
