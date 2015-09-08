# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table image_model (
  id                        bigserial not null,
  user_id                   bigint,
  user_uploaded_image       bytea,
  processed_image           bytea,
  ready_for_grabcut         boolean,
  ready_for_measurement     boolean,
  version                   timestamp not null,
  constraint pk_image_model primary key (id))
;

create table quote_model (
  id                        bigserial not null,
  user_id                   bigint,
  cost                      decimal(38,2),
  version                   timestamp not null,
  constraint pk_quote_model primary key (id))
;

create table user_model (
  id                        bigserial not null,
  email                     varchar(255),
  password                  varchar(255),
  version                   timestamp not null,
  constraint uq_user_model_email unique (email),
  constraint pk_user_model primary key (id))
;

create table window_model (
  id                        bigserial not null,
  window_image              bytea,
  manufacturer_name         varchar(255),
  series                    varchar(255),
  style                     varchar(255),
  length                    integer,
  width                     integer,
  color                     varchar(255),
  cost                      varchar(255),
  frame_type                varchar(255),
  grid_style                varchar(255),
  grid_type                 varchar(255),
  tempered                  boolean,
  glass_type                varchar(255),
  constraint pk_window_model primary key (id))
;




# --- !Downs

drop table if exists image_model cascade;

drop table if exists quote_model cascade;

drop table if exists user_model cascade;

drop table if exists window_model cascade;

