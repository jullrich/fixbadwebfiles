#!/usr/bin/env bash

goodextfile=/etc/httpd/goodext.txt

echo '<Files ~ "^.*$">
   Order allow,deny
   Deny from all
</Files>
'

for b in `cat $goodextfile`; do
echo '
<Files ~ "\.('$b')$">
   Order allow,deny
   Allow from all
</Files>';

done
