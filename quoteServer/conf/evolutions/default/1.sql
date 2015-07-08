# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table image (
  id                        bigint not null,
  user_uploaded_image       blob,
  version                   timestamp not null,
  constraint pk_image primary key (id))
;

create table quote (
  id                        bigint not null,
  user_id                   bigint,
  cost                      decimal(38,2),
  version                   timestamp not null,
  constraint pk_quote primary key (id))
;

create table user_model (
  id                        bigint not null,
  email                     varchar(255),
  password                  varchar(255),
  version                   timestamp not null,
  constraint uq_user_model_email unique (email),
  constraint pk_user_model primary key (id))
;

create table window (
  id                        bigint not null,
  window_image              blob,
  manufacturer_name         varchar(255),
  style                     varchar(255),
  length                    integer,
  width                     integer,
  color                     varchar(255),
  cost                      varchar(255),
  constraint pk_window primary key (id))
;

create sequence image_seq;

create sequence quote_seq;

create sequence user_model_seq;

create sequence window_seq;




# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists image;

drop table if exists quote;

drop table if exists user_model;

drop table if exists window;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists image_seq;

drop sequence if exists quote_seq;

drop sequence if exists user_model_seq;

drop sequence if exists window_seq;

