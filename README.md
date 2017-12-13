MC Forge Server
===============

Launch minecraft server with :

`java -Xms6G -Xmx7G -jar forge-1.12.2-14.23.0.2545-universal.jar nogui`

In Production use start.sh script

add in crontab (gonna restart each midday)

`0 12 * * * /home/minecraft/mc-forge-server/start.sh`