FROM java:8

MAINTAINER warren.strange@gmail.com

WORKDIR /opt


RUN curl https://forgerock.org/djs/opendjrel.js?948497823 | grep -o "http://.*\.zip" | tail -1 | xargs curl -o opendj.zip

RUN unzip opendj.zip && ./opendj/setup --cli -p 389 --ldapsPort 636 --enableStartTLS --generateSelfSignedCertificate \
    --sampleData 100 --baseDN "dc=example,dc=com" -h localhost --rootUserPassword password --acceptLicense --no-prompt \
    && rm opendj.zip

EXPOSE 389 636 4444

# Todo: Do we want to copy the writable dirs to a common volume
# And then update instance.loc to that volume. This would let us seperate out the bits that need persistence
# These dirs need to be copied to instance.loc:  config	db	locks	logs

CMD  /opt/opendj/bin/start-ds && tail -f /dev/null
