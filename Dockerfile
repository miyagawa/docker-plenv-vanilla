FROM base

RUN apt-get update
RUN apt-get install -y --force-yes build-essential curl git
RUN apt-get clean

RUN git clone git://github.com/tokuhirom/plenv.git /root/.plenv
RUN git clone git://github.com/tokuhirom/Perl-Build.git /root/.plenv/plugins/perl-build/
ADD ./plenv.sh /root/.plenv.sh

RUN mkdir /build
ADD ./perls.txt /build/perls.txt

# temp 6/16/2013 CPAN DNSSEC outage
RUN echo "207.171.7.177 www.cpan.org" >> /etc/hosts

RUN . /root/.plenv.sh; xargs -L 1 plenv install < /build/perls.txt
