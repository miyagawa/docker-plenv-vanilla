# Unused for now, just for reference

FROM base

RUN apt-get update
RUN apt-get install -y --force-yes build-essential curl git
RUN apt-get clean

RUN git clone git://github.com/tokuhirom/plenv.git /root/.plenv
RUN echo 'export PLENV_ROOT="/root/.plenv" > /root/.plenv.sh
Run echo 'export PATH="$PLENV_ROOT/bin:$PATH"' >> /root/.plenv.sh
RUN echo 'eval "$(plenv init -)"' >> /root/.plenv.sh
RUN git clone git://github.com/tokuhirom/Perl-Build.git /root/.plenv/plugins/perl-build/

# temp 6/16/2013 CPAN DNSSEC outage
RUN echo "207.171.7.177 www.cpan.org" >> /etc/hosts

# Install stable versions only
RUN . /root/.plenv.sh; plenv install -list | perl -nle '/ 5\.(\d+)\.\d+$/ and $1 % 2 == 0 and print' | xargs -n1 plenv install
