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
      image: "compscidr/apache:0.5.0"
      cmd:
      runoptions:
        - "-p 8080"
        - "-e VIRTUAL_HOST=www.jasonernst.com,jasonernst.com"
        - "-e VIRTUAL_PORT=8080"
        - "-e LETSENCRYPT_HOST=www.jasonernst.com,jasonernst.com"
        - "-e LETSENCRYPT_EMAIL=ernstjason1@gmail.com"
        - "-e PHP_HOST=www-php"
        - "-v /var/www/www.jasonernst.com/:/var/www/html/"
        - "--network=bridge"
        - "--rm"
    dev.jasonernst.com:
      image: "compscidr/apache:0.5.0"
      cmd:
      runoptions:
        - "-p 8080"
        - "-e VIRTUAL_HOST=dev.jasonernst.com"
        - "-e VIRTUAL_PORT=8080"
        - "-e LETSENCRYPT_HOST=dev.jasonernst.com"
        - "-e LETSENCRYPT_EMAIL=ernstjason1@gmail.com"
        - "-e PHP_HOST=dev-php"
        - "-v /var/www/dev.jasonernst.com/:/var/www/html/"
        - "--network=bridge"
        - "--rm"
    www-php:
      image: "compscidr/php:0.5.0"
      cmd:
      runoptions:
        - "-p 9000"
        - "-e VIRTUAL_HOST=www-php"
        - "-e VIRTUAL_PORT=9000"
        - "-v /var/www/www.jasonernst.com/:/var/www/html/"
        - "--network=backend"
        - "--rm"
    dev-php:
      image: "compscidr/php:0.5.0"
      cmd:
      runoptions:
        - "-p 9000"
        - "-e VIRTUAL_HOST=dev-php"
        - "-e VIRTUAL_PORT=9000"
        - "-v /var/www/dev.jasonernst.com/:/var/www/html/"
        - "--network=backend"
        - "--rm"
    www.p2ptrader.io:
      image: "compscidr/apache:0.5.0"
      cmd:
      runoptions:
        - "-p 8080"
        - "-e VIRTUAL_HOST=www.p2ptrader.io,p2ptrader.io"
        - "-e VIRTUAL_PORT=8080"
        - "-e LETSENCRYPT_HOST=www.p2ptrader.io,p2ptrader.io"
        - "-e LETSENCRYPT_EMAIL=ernstjason1@gmail.com"
        - "-e PHP_HOST=www-p2p-php"
        - "-v /var/www/www.p2ptrader.io/:/var/www/html/"
        - "--network=bridge"
        - "--rm"
    dev.p2ptrader.io:
      image: "compscidr/apache:0.5.0"
      cmd:
      runoptions:
        - "-p 8080"
        - "-e VIRTUAL_HOST=dev.p2ptrader.io"
        - "-e VIRTUAL_PORT=8080"
        - "-e LETSENCRYPT_HOST=dev.p2ptrader.io"
        - "-e LETSENCRYPT_EMAIL=ernstjason1@gmail.com"
        - "-e PHP_HOST=dev-p2p-php"
        - "-v /var/www/dev.p2ptrader.io/:/var/www/html/"
        - "--network=bridge"
        - "--rm"
    www-p2p-php:
      image: "compscidr/php:0.5.0"
      cmd:
      runoptions:
        - "-p 9000"
        - "-e VIRTUAL_HOST=www-php"
        - "-e VIRTUAL_PORT=9000"
        - "-v /var/www/www.p2ptrader.io/:/var/www/html/"
        - "--network=backend"
        - "--rm"
    dev-p2p-php:
      image: "compscidr/php:0.5.0"
      cmd:
      runoptions:
        - "-p 9000"
        - "-e VIRTUAL_HOST=dev-php"
        - "-e VIRTUAL_PORT=9000"
        - "-v /var/www/dev.p2ptrader.io/:/var/www/html/"
        - "--network=backend"
        - "--rm"
    mysql:
      image: "mysql:latest"
      cmd:
      runoptions:
        - "-e MYSQL_ROOT_PASSWORD=rootpassword"
        - "--network=backend"
        - "--rm"
