FROM stackbrew/ubuntu:raring
MAINTAINER Nat Lownes <nat.lownes@gmail.com>

RUN apt-get -qq update
RUN apt-get install -y weechat ruby1.9.1-dev libpython2.7-dev

RUN adduser weechat
USER weechat

RUN mkdir -p /home/weechat
RUN chown -R weechat:weechat /home/weechat

RUN mkdir -p /home/weechat/.weechat/python/autoload
RUN mkdir -p /home/weechat/.weechat/ruby/autoload
ADD shell.py /home/weechat/.weechat/python/shell.py
RUN ln -s /home/weechat/.weechat/python/shell.py /home/weechat/.weechat/python/autoload/shell.py

ADD irc.conf /home/weechat/.weechat/

ENV HOME /home/weechat
ENV LANG en_US.UTF-8
ENV TERM screen-256color

ENTRYPOINT weechat-curses
ENTRYPOINT /bin/bash
