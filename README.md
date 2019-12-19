# UNISON - FSSHARE

A docker with a master and a replica volume that are kept in sync (1-way).

Use case: resolve OSX slowness by mounting your application to the master,
and the replicated volumes to nginx, fpm etc.

* /mnt/master
* /mnt/replica

See docker-compose.example.yml for an example.