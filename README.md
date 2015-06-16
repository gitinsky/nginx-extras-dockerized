Dockerized Nginx-extras
======

```
# nginx -V
nginx version: nginx/1.8.0
built with OpenSSL 1.0.1f 6 Jan 2014
TLS SNI support enabled
configure arguments: --with-cc-opt='-g -O2 -fPIE -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-ipv6 --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_addition_module --with-http_dav_module --with-http_flv_module --with-http_geoip_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module --with-http_mp4_module --with-http_perl_module --with-http_random_index_module --with-http_secure_link_module --with-http_spdy_module --with-http_sub_module --with-http_xslt_module --with-mail --with-mail_ssl_module --add-module=/build/buildd/nginx-1.8.0/debian/modules/headers-more-nginx-module --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-auth-pam --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-cache-purge --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-dav-ext-module --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-development-kit --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-echo --add-module=/build/buildd/nginx-1.8.0/debian/modules/ngx-fancyindex --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-http-push --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-lua --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-upload-progress --add-module=/build/buildd/nginx-1.8.0/debian/modules/nginx-upstream-fair --add-module=/build/buildd/nginx-1.8.0/debian/modules/ngx_http_substitutions_filter_module
```

```
sudo docker build -t gitinsky/nginx-extras https://github.com/gitinsky/nginx-extras-dockerized.git

tee nginx-simple-site.conf <<EOF
server {
  listen 80;
}
EOF

sudo docker run \
  -v $(pwd)/nginx-log:/var/log/nginx \
  -v $(pwd)/nginx-simple-site.conf:/etc/nginx/sites-enabled/nginx-simple-site.conf \
  -p 8080:80 \
  gitinsky/nginx-extras
```

## Important notes

No logrotate! Use syslog, %USERNAME%!