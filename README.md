# UNISON - FSSHARE

A docker with a master and a replica volume that are kept in sync (1-way).

Use case: resolve OSX slowness by mounting your application to the master,
and the replicated volumes to nginx, fpm etc.

* /mnt/master
* /mnt/replica

See docker-compose.example.yml for an example.

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