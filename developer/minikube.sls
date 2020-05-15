minikube_download:
  file.managed:
    - source: https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    - source_hash: https://github.com/kubernetes/minikube/releases/download/v1.10.1/minikube-linux-amd64.sha256
    - name: /usr/bin/minikube
    - mode: 755
