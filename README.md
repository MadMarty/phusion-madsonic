Madsonic phusion docker image 
=============================

Madsonic http://beta.madsonic.org

Latest Beta Release of Madsonic.

**Pull image**

```
docker pull madsonic/phusion-madsonic
```

**Run container**

```
docker run -d -p 4040:4040 -p 4050:4050 --name=<container name> -net=host -e SSL="no" -v <path for media files>:/media -v <path for config files>:/config -v /etc/localtime:/etc/localtime:ro madsonic/phusion-madsonic
```

Please replace all user variables in the above command defined by <> with the correct values.


**Access application**

```
http://<host ip>:4040
```

or if you have enabled SSL

```
https://<host ip>:4050
```