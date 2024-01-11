# promtail-loki-docker

## Docker service for collecting logs and sending it to Grafana Loki
Used tech stack:
 - Nginx - for proxying requests to 3100 port and a restricting access to this port by certain ip
 - Promtail - logs collector
 - Loki - sends logs to your general grafana loki server

### Setup

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
5. Copy `conf.d/default.nginx.conf.example` to `conf.d/default.nginx.conf`
6. If you want to restrict access for all IP except of sertain Grafana Loki server, unkomment and edit following code in `conf.d/default.nginx.conf`:
~~~nginx configuration
    deny   all;
    allow  192.168.176.1/24;
~~~

### Run

1. Switch to `promtail-loki-docker`  folder
2. Run command `make up`

### Stop

1. Switch to `promtail-loki-docker`  folder
2. Run command `make down`