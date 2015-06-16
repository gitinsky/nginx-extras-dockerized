FROM ubuntu:14.04.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository -y ppa:nginx/stable \
  && apt-get -y install nginx-extras \
  && apt-get pugre software-properties-common \
  && rm -vrf /var/cache/* /var/lib/apt/lists/* \
  && rm -vrf /etc/nginx/sites-enabled/* \
  && true

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
