#!/usr/bin/env bash

# NOT WORKING WITH CRONS NEED REWORK
SERVER_FOLDER=/home/minecraft/mc-forge-server

echo "[$(date)] Starting restart script [v0.1.0]" >> $SERVER_FOLDER/MCServerRestartLog.txt 2>&1

for SCREEN in $(screen -list MinecraftServer | grep -o '[0-9]\{3,\}\.\S*')
    do
        echo "[$(date)] MinecraftServer screen found $SCREEN" >> $SERVER_FOLDER/MCServerRestartLog.txt 2>&1
        screen -r MinecraftServer -p0 -X stuff "say Server is restarting in 1 minute.\015"
        sleep 30
        screen -r MinecraftServer -p0 -X stuff "say Server is restarting in 30 seconds.\015"
        sleep 20
        screen -r MinecraftServer -p0 -X stuff "say Server is restarting now.\015"
        sleep 5
        echo "[$(date)] Stopping $SCREEN server..." >> $SERVER_FOLDER/MCServerRestartLog.txt 2>&1
        screen -r MinecraftServer -p0 -X stuff "save-all\015"
        screen -r MinecraftServer -p0 -X stuff "stop\015"
    done

counter=0
while [ $(screen -list MinecraftServer | grep -c 'No Sockets found in') -lt 1 ]; do
    if [ $(( $counter % 10 )) -eq 0 ]; then
        echo "[$(date)] A previous server is in use. Waiting for 10 seconds before starting server..." >> $SERVER_FO$
    fi

    sleep 1
    counter=$((counter+1))
done

    # TODO backup world/ folder tar.gz
    result=$(screen -list MinecraftServer)
    echo "[$(date)] Server stopped" >> $SERVER_FOLDER/MCServerRestartLog.txt 2>&1

    echo "[$(date)] Starting server" >> $SERVER_FOLDER/MCServerRestartLog.txt 2>&1
    screen -dmS "MinecraftServer" java -Xmx6G -Xms6G -jar forge-1.12.2-14.23.1.2555-universal.jar

    echo "[$(date)] End restart script [v0.1.0]" >> $SERVER_FOLDER/MCServerRestartLog.txt 2>&1
