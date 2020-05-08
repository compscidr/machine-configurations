collectd:
  Hostname: salt['grains.get']('host')
  plugins:
    default: [cpu, entropy, load, memory, swap, users]
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
