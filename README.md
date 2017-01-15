# fixbadwebfiles
Simple bash script to remove files with bad extensions and create an Apache "whitelist" for extensions. Also see 
https://isc.sans.edu/diary.html?storyid=21937

MAKE BACKUPS OF ALL FILES BEFORE RUNNING THESE SCRIPTS

cleanweb.sh and createapache.sh are configured by editing the first couple lines.

```
find /srv/www/html -type f | sort | sed 's/.*\.//' | sort -u > goodext.txt
```
edit goodext.txt and remove all the "bad" extensions you don't like
```
./cleanweb.sh
```
this script reads goodext.txt and removes all the files with extensions not lists
```
./createapache.sh
```
creates a configuration snippet to be included in your Apache 2.2 configuration (2.4: should be easy to adapt)

MAKE BACKUPS BEFORE RUNNING ANY OF THESE SCRIPTS



