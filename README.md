# promtail-loki-docker

Setup

1. Copy `docker-compose.yml.example` to `docker-compose.yml`
2. In docker-compose.yml in `promtail` service in volume block add needed folders with logs
3. Copy file `promtail-config/promtail.yaml.example` to `promtail-config/promtail.yaml`
4. Add needed log folders to new jobs to `promtail-config/promtail.yaml`. Example:
~~~yaml
  - job_name: nginx
    static_configs:
      - targets:
          - localhost
        labels:
          job: nginx
          __path__: /var/www/nginx-proxy-hs1/log/nginx/*log
          host: grafana
~~~

Run

1. Switch to `promtail-loki-docker`  folder
2. Run command `make up`

Stop

1. Switch to `promtail-loki-docker`  folder
2. Run command `make down`