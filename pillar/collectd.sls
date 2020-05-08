collectd:
  Hostname: {{ grains['nodename'] }}
  plugins:
    default: [aggregation, cpu, entropy, load, memory, swap, users, uptime]
    write_graphite:
      name: graphite
      host: localhost
      port: "2003"
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
