docker-containers:
  lookup:
    nginx-proxy:
      image: "jwilder/nginx-proxy"
      runoptions:
        - "-p 80:80"
        - "-p 443:443"
        - "-v conf:/etc/nginx/conf.d"
        - "-v vhost:/etc/nginx/vhost.d"
        - "-v html:/usr/share/nginx/html"
        - "-v dhparam:/etc/nginx/dhparam"
        - "-v certs:/etc/nginx/certs:ro"
        - "-v var/run/docker.sock:/tmp/docker.sock:ro"
        - "--network=bridge"
        - "--rm"
#    myapp:
#      image: "myregistry.com:5000/training/app:3.0"
#      args:
#        - "https://someargument_as_an_url"
#        - "--port 5500"
#      cmd:  python app.py
#      runoptions:
#        - "--log-driver=syslog"
#        - "-v /mnt/myapp:/myapp"
#        - "-p 80:80"
#        - "--rm"
#      stopoptions:
#        - -t 60
