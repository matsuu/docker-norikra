FROM centos

RUN yum install -y java-1.7.0-openjdk tar && yum clean all

RUN curl -L http://jruby.org.s3.amazonaws.com/downloads/1.7.13/jruby-bin-1.7.13.tar.gz | tar zxf -
ENV PATH /jruby-1.7.13/bin:$PATH
RUN gem install norikra --no-ri --no-rdoc

EXPOSE 26571 26578

VOLUME /var/norikra

#CMD ["norikra", "start"]
CMD ["norikra", "start", "--stats=/var/norikra/stats.json", "--dump-stat-interval=60"]
