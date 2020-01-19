# LSYNCD - FSSHARE

A docker with a master and a replica volume that are kept in sync (1-way).

Use case: resolve OSX slowness by mounting your application to the master,
and the replicated volumes to nginx, fpm etc.

* /mnt/master
* /mnt/replica

See docker-compose.example.yml for an example.

## Customization with env 

Following ENV vars can be specified (i.e. in docker-compose);
also see: https://axkibe.github.io/lsyncd/manual/config/layer4/ and
https://ss64.com/bash/rsync_options.html.


    DELAY               2       sync delay
    STATUS_INTERVAL     2       status interval update
    RSYNC_ARCHIVE       true    use rsync archive attr
    RSYNC_PERMS         true    enable rsync perms

## Excluding files and directories

In docker compose, you can mount an exclude list like this:

        volumes:
            - ./sync-exclude.txt:/exclude.txt:delegated
            
Example exclude list:

sync-exclude.txt:
```
/var/log/*/*
/var/cache/*/*
/mode_modules
```           
 