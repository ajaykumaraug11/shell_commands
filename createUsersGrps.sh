#shell 
addgroup -g <GRP_ID> <GRP_NAME> && \
adduser -u <USER_ID> -G <GRP_NAME> -g "DESRIPTION OF USER" -s /bin/sh -D <USER_NAME>


#bash
groupadd -g <GRP_ID> <GRP_NAME> && \
useradd -r -u <USER_ID> -g <GRP_NAME> <USER_NAME>
