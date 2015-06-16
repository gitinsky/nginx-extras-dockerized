Dockerized Nginx-extras
======

```
sudo docker build -t gitinsky/nginx-extras https://github.com/gitinsky/nginx-extras-dockerized.git

tee nginx-simple-site.conf <<EOF
server {
  listen 8080;
}
EOF

sudo docker run \
  -v ./nginx-log:/var/log/nginx \
  -v ./nginx-simple-site.conf:/etc/nginx/sites-enabled/nginx-simple-site.conf \
  -p 8080:8080 \
  gitinsky/nginx-extras
```

## Important notes

No logrotate!