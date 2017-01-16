#!/usr/bin/env bash

goodextfile=/etc/httpd/goodext.txt

echo 'deny from all
'

for b in `cat $goodextfile`; do
echo '
<Files ~ "\.('$b')$">
   Order allow,deny
   Allow from all
</Files>';

done
