FROM java:8

MAINTAINER warren.strange@gmail.com

WORKDIR /opt/opendj

ADD run.sh /opt/opendj/run.sh

VOLUME ["/installers", "/opt/opendj/instance/logs", "/opt/opendj/instance/db"]

EXPOSE 389 636 4444

# Todo: Do we want to copy the writable dirs to a common volume
# And then update instance.loc to that volume. This would let us seperate out the bits that need persistence
# These dirs need to be copied to instance.loc:  config	db	locks	logs

CMD  ["/opt/opendj/run.sh"]
