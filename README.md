# systemd

## Написать сервис

Написать сервис, сервис будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаватьсā в:

```
/etc/sysconfig
```

### Создадим файл 

```
/etc/sysconfig/watchlog
```

### Создадим файл лога 

```
/var/log/watchlog.log
```

### Создадим скрипт 

```
/opt/watchlog.sh
```

### добавляем права на запись для скрипта

```
chmod +x /opt/watchlog.sh
```

### Создадим юнит

```
mkdir /etc/systemd/system/watchlog
```
```
 touch /etc/systemd/system/watchlog/watchlog.service
```
```
chmod +x /etc/systemd/system/watchlog/watchlog.service
```
```
touch /etc/systemd/system/watchlog/watchlog.timer
```
```
chmod +x /etc/systemd/system/watchlog/watchlog.timer
```

### Запустим юнит 

```
 systemctl start watchlog.timer
```

### Смотри историю шела в watchlog.log

## переписать init-скрипт

Устанавливаем spawn-fcgi и необходимые для него пакеты:

```
yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
```
### Init скрипт, который будем переписывать:
```
/etc/rc.d/init.d/spawn-fcgi 
```

### Необходимо раскомментировать строки с переменными

```
/etc/sysconfig/spawn-fcgi
```

### Смотри историю шела в spawn-fcgi.log

## Дополнить юнит файл

Дополнить юнит файл Apache httpd возможностью запустить несколько инстансов с разными конфигами.

Для запуска нескольких экземпляров сервиса будем использовать шаблон в конфигурации файла окружения (/usr/lib/systemd/system/httpd.service )

Файлы окружения:

```
/etc/sysconfig/httpd-first
```
```
OPTIONS=-f conf/first.conf
```
```
/etc/sysconfig/httpd-second
```
```
OPTIONS=-f conf/second.conf
```

### За основу возьмём существующую конфигурацию Apache
```
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/first.conf 
```

### Смотри историю шела в httpd.log



