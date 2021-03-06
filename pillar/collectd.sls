collectd:
  Hostname: {{ grains['nodename'] }}
  plugins:
    default: [aggregation, cpu, entropy, load, memory, swap, users, uptime]
    write_graphite:
      name: graphite
      host: localhost
      port: "2013"
      protocol: "tcp"
      prefix: "collectd."
      postfix: ""
      logsenderrors: false
      escapecharacter: "_"
      separateinstances: true
      storerates: true
      alwaysappendds: false
    interface:
      interfaces: ['/^enp.*/']
    df:
      MountPoints:
        - "/"
        - "/home"
        - "/var/log"
        - "/var/lib"
        - "/opt"
      IgnoreSelected: false
      ReportByDevice: false
      ReportInodes: true
      ValuesPercentage: false
      ValuesAbsolute: true
