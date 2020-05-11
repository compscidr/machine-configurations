docker-containers:
  lookup:
    grafana:
      # note its possible to run plugins: https://grafana.com/docs/grafana/latest/installation/docker/
      image: grafana/grafana:6.7.3
      runoptions:
        - "-p 3000:3000"
        - "--network=stats"
        - "--rm"
    graphite:
      image: graphiteapp/graphite-statsd:1.1.7-2
      runoptions:
        - "-p 8080:80"
        - "-p 2003-2004:2003-2004"
        - "-p 2023-2024:2023-2024"
        - "-p 8125:8125/udp"
        - "-p 8126:8126"
        - "-v /opt/statsd/config:/opt/statsd/config"
        - "-v /opt/graphite/conf:/opt/graphite/conf"
        - "-v /opt/graphite/storage:/opt/graphite/storage"
        - "--network=stats"
        - "--rm"
