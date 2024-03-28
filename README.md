# systemd

Написатþ сервис, которýй будет раз в 30 секунд мониторитþ лог на
предмет наличиā клĀчевого слова. Файл и слово должнý задаватþсā в
/etc/sysconfig

### Создадим файл 

/etc/sysconfig/watchlog

### Создадим файл лога 

/var/log/watchlog.log

### Создадим скрипт 

/opt/watchlog.sh

### добавляем права на запись для скрипта

chmod +x /opt/watchlog.sh

### Создадим юнит

[root@kernel-update vagrant]# mkdir /etc/systemd/system/watchlog

[root@kernel-update vagrant]# touch /etc/systemd/system/watchlog/watchlog.service

[root@kernel-update vagrant]# chmod +x /etc/systemd/system/watchlog/watchlog.service




