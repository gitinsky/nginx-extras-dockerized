FROM ubuntu:14.04.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
  && apt-get -qq install -y software-properties-common \
  && add-apt-repository -y ppa:nginx/stable \
  && apt-get -qq install -y nginx-extras \
  && apt-get -qq pugre -y software-properties-common \
  && rm -vrf /var/cache/* /var/lib/apt/lists/* \
  && rm -vrf /etc/nginx/sites-enabled/* \

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]