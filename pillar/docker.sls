docker-containers:
  lookup:
    nginx-proxy:
      image: "jwilder/nginx-proxy"
      cmd:
      runoptions:
        - "-p 80:80"
        - "-p 443:443"
        - "-v conf:/etc/nginx/conf.d"
        - "-v vhost:/etc/nginx/vhost.d"
        - "-v html:/usr/share/nginx/html"
        - "-v dhparam:/etc/nginx/dhparam"
        - "-v certs:/etc/nginx/certs:ro"
        - "-v /var/run/docker.sock:/tmp/docker.sock:ro"
        - "--network=bridge"
        - "--rm"
    letsencrypt:
      image: "jrcs/letsencrypt-nginx-proxy-companion"
      cmd:
      runoptions:
        - "-v certs:/etc/nginx/certs:rw"
        - "-v /var/run/docker.sock:/var/run/docker.sock:ro"
        - "--volumes-from nginx-proxy"
        - "--network=bridge"
        - "--rm"
    www.jasonernst.com:
      image: "compscidr/apache:0.1.0"
      cmd:
      runoptions:
        - "-p 8080:8080"
        - "-e VIRTUAL_HOST=www.jasonernst.com"
        - "-e VIRTUAL_PORT=8080"
        - "-e LETSENCRYPT_EMAIL=ernstjason1@gmail.com"
        - "-v /var/www/www.jasonernst.com/:/var/www/html/"
        - "--rm"
    php:
      image: "compscidr/php:0.1.0"
      cmd:
      runoptions:
        - "--rm"
    mysql:
      image: "mysql:latest"
      cmd:
      runoptions:
        - "-e MYSQL_ROOT_PASSWORD=rootpassword"
        - "--rm"
