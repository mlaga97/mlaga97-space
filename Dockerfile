# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.18

# Image Stuff
MAINTAINER Matieu Lagarde <mlaga97@gmail.com>

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Add Services
ADD etc/service /etc/service/

# Package Dependencies
RUN apt-get update && apt-get install -y \
	lua5.2 \
	apache2 \
	liblua5.2 \
	subversion \
	apache2-dev \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Compile Lua Module
RUN svn co https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x/modules/lua/ \
	&& cd lua \
	&& apxs -I/usr/include/lua5.2 -cia mod_lua.c lua_*.c -lm -llua5.2 \
	&& cd .. && rm -r lua

# Clean Up After Lua Module Installation
RUN apt-get update && apt-get remove -y \
	subversion \
	apache2-dev \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Port Forwarding
EXPOSE 80

# Apache Config
RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD etc/apache2/sites-enabled /etc/apache2/sites-enabled/
ADD var /var/
