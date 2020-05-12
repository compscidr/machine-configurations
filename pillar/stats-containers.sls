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
        - "-p 8080:80"                          # web interface on 8080
        - "-p 2003-2004:2003-2004"              # carb plain & pickle tcp
        - "-p 2003-2004:2003-2004/udp"          # carb plain & pickle udp
        - "-p 2013-2014:2013-2014"              # carb relay plain & pickle tcp
        - "-p 2013-2014:2013-2014/udp"          # carb relay plain & pickle udp
        - "-p 2023-2024:2023-2024"              # carb agg plain & pickle tcp
        - "-p 2023-2024:2023-2024/udp"          # carb agg plain & pickle udp
        - "-p 8125:8125/udp"                    # statsd udp
        - "-p 8126:8126"                        # statsd admin tcp
        - "-v /opt/statsd/config:/opt/statsd/config"
        - "-v /opt/graphite/conf:/opt/graphite/conf"
        - "-v /opt/graphite/storage:/opt/graphite/storage"
        - "-e RELAY=1"
        - "--network=stats"
        - "--rm"
