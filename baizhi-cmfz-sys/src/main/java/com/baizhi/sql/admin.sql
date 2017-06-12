drop table if exists admin;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   id                   varchar(36) not null,
   username             varchar(36),
   password             varchar(36),
   salt                 varchar(6),
   primary key (id)
);