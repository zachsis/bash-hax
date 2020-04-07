#!/usr/bin/env bash


crontab -l > $1

echo "=====users=====" >> $1

for user in $(cat /etc/passwd | awk -F":" '{print $1}'); do
	crontab -u $user -l >> $1
done 

echo "=====daily=====" >> $1

for daily in $(ls -a /etc/cron.daily/); do 
	cat /etc/cron.daily/"$daily" >> $1;
done

echo "=====hourly=====" >> $1


for hourly in $(ls -a /etc/cron.hourly/); do
        cat /etc/cron.hourly/"$hourly" >> $1;
done

echo "=====weekly=====" >> $1

for weekly in $(ls -a /etc/cron.weekly/); do
        cat /etc/cron.weekly/"$weekly" >> $1;
done

echo "=====monthly=====" >> $1

for monthly in $(ls -a /etc/cron.monthly/); do
        cat /etc/cron.monthly/"$monthly" >> $1;
done

echo "=====.d=====" >> $1

for d in $(ls -a /etc/cron.d/); do
        cat /etc/cron.d/"$d" >> $1;
done

echo "=====crontab=====" >> $1

cat /etc/crontab >> $1;
