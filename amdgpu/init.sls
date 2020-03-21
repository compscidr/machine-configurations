amdgpu-pro-drivers:

  "wget https://drivers.amd.com/drivers/linux/19.50/amdgpu-pro-19.50-967956-ubuntu-18.04.tar.xz --referer https://support.amd.com/en-us/kb-articles/Pages/Radeon-Software-for-Linux-Release-Notes.aspx -O /tmp/radeon.tar.xz":
    cmd.run:
      - creates: /tmp/radeon.tar.xz

  archive.extracted:
    - name: /tmp/amd/
    - source: /tmp/radeon.tar.xz
    - source_hash: sha512=18d0497d0fc23a5a2ff36ba7e17bcf3b924f13c33f65dd42f4f6be65ca250fdd50826bdfd9aa7e61d2c9d3136f2e994412611315af7f8c4a0e20bad887ad980a
