

# Note: This is not needed, as the base docker image creates the user
create user openidm with password 'openidm';

create database openidm encoding 'utf8' owner openidm;

grant all privileges on database openidm to openidm;
