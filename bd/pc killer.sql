/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  14/08/2024 16:36:45                      */
/*==============================================================*/

/*==============================================================*/
/* Table : SPECIALITE                                           */
/*==============================================================*/
create table SPECIALITE
(
   ID_SPECIAL           int not null AUTO_INCREMENT,
   NOM_SPECIAL          varchar(100),
   primary key (ID_SPECIAL)
);


create table UNIVERSITE
(
   ID_UNIV              int not null AUTO_INCREMENT,
   NOM_UNIV             varchar(100),
   primary key (ID_UNIV)
);

/*==============================================================*/
/* Table : USER                                                 */
/*==============================================================*/
create table USER
(
   ID_USER              int not null AUTO_INCREMENT,
   NOM_USER             varchar(100),
   EMAIL_USER           varchar(100),
   NIVEAUX              varchar(100),
   MOT_DE_PASS          varchar(100),
   TYPE_USER            varchar(100),
   DATE_DE_CREATION     date,
   STATUT__USER         varchar(100),
   primary key (ID_USER)
);

/*==============================================================*/
/* Table : ABONNEMENT                                           */
/*==============================================================*/
create table ABONNEMENT
(
   ID                   int not null AUTO_INCREMENT,
   NOM_ABON             varchar(100),
   TYPE_ABON            varchar(100),
   primary key (ID)
);

/*==============================================================*/
/* Table : CLASSE                                               */
/*==============================================================*/
create table CLASSE
(
   ID_CLASS             int not null AUTO_INCREMENT,
   NOM_CLASS            varchar(100),
   primary key (ID_CLASS)
);

/*==============================================================*/
/* Table : COLLEGE                                              */
/*==============================================================*/
create table COLLEGE
(
   ID_COL               int not null AUTO_INCREMENT,
   NOM_COL              varchar(100),
   primary key (ID_COL)
);

/*==============================================================*/
/* Table : EPREUVE                                              */
/*==============================================================*/
create table EPREUVE
(
   ID_EPREUV            int not null AUTO_INCREMENT,
   ID_SPECIAL           int not null,
   ID_CLASS             int not null,
   NOM_EPREUV           varchar(100),
   PRIX                 decimal(50),
   primary key (ID_EPREUV),
   foreign key (ID_SPECIAL)
      references SPECIALITE (ID_SPECIAL) on delete CASCADE on update CASCADE,
   foreign key (ID_CLASS)
      references CLASSE (ID_CLASS) on delete CASCADE on update CASCADE
);

/*==============================================================*/
/* Table : HISTORIQUE                                           */
/*==============================================================*/
create table HISTORIQUE
(
   ID_USER              int not null ,
   ID_UNIV              int not null,
   ID_COL               int not null,
   ID_EPREUV            int not null,
   H_ACTION               varchar(100),
   DATE_ACTION          datetime,
   foreign key (ID_COL)
      references COLLEGE (ID_COL) on delete CASCADE on update CASCADE,
      foreign key (ID_EPREUV)
      references EPREUVE (ID_EPREUV) on delete CASCADE on update CASCADE,
      foreign key (ID_UNIV)
      references UNIVERSITE (ID_UNIV) on delete CASCADE on update CASCADE,
      foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update CASCADE
);

/*==============================================================*/
/* Table : HISTORIQUE_ABONNEMENT                                */
/*==============================================================*/
create table HISTORIQUE_ABONNEMENT
(
   ID_USER              int not null ,
   ID                   int not null,
   DATE_DEB             datetime,
   DATE_FIN             datetime,
   foreign key (ID)
      references ABONNEMENT (ID) on delete CASCADE on update CASCADE,
      foreign key (ID_USER)
      references USER (ID_USER) on delete CASCADE on update CASCADE
);

/*==============================================================*/
/* Table : SECONDAIRE                                           */
/*==============================================================*/
create table SECONDAIRE
(
   ID_COL               int not null,
   ID_CLASS             int not null,
   foreign key (ID_CLASS)
      references CLASSE (ID_CLASS) on delete CASCADE on update CASCADE,
      foreign key (ID_COL)
      references COLLEGE (ID_COL) on delete CASCADE on update CASCADE
);


/*==============================================================*/
/* Table : SUPERIEUR                                            */
/*==============================================================*/
create table SUPERIEUR
(
   ID_UNIV              int not null ,
   ID_SPECIAL           int not null,
   foreign key (ID_SPECIAL)
      references SPECIALITE (ID_SPECIAL) on delete CASCADE on update CASCADE,
      foreign key (ID_UNIV)
      references UNIVERSITE (ID_UNIV) on delete CASCADE on update CASCADE
);

/*==============================================================*/
/* Table : UNIVERSITE                                           */
/*==============================================================*/


-- alter table EPREUVE foreign key (ID_SPECIAL)
--       references SPECIALITE (ID_SPECIAL) on delete CASCADE on update CASCADE;

-- alter table EPREUVE foreign key (ID_CLASS)
--       references CLASSE (ID_CLASS) on delete CASCADE on update CASCADE;

-- alter table HISTORIQUE foreign key (ID_COL)
--       references COLLEGE (ID_COL) on delete CASCADE on update CASCADE;

-- alter table HISTORIQUE  foreign key (ID_EPREUV)
--       references EPREUVE (ID_EPREUV) on delete CASCADE on update CASCADE;

-- alter table HISTORIQUE foreign key (ID_UNIV)
--       references UNIVERSITE (ID_UNIV) on delete CASCADE on update CASCADE;

-- alter table HISTORIQUE foreign key (ID_USER)
--       references USER (ID_USER) on delete CASCADE on update CASCADE;

-- alter table HISTORIQUE_ABONNEMENT foreign key (ID)
--       references ABONNEMENT (ID) on delete CASCADE on update CASCADE;

-- alter table HISTORIQUE_ABONNEMENT foreign key (ID_USER)
--       references USER (ID_USER) on delete CASCADE on update CASCADE;

-- alter table SECONDAIRE foreign key (ID_CLASS)
--       references CLASSE (ID_CLASS) on delete CASCADE on update CASCADE;

-- alter table SECONDAIRE foreign key (ID_COL)
--       references COLLEGE (ID_COL) on delete CASCADE on update CASCADE;

-- alter table SUPERIEUR foreign key (ID_SPECIAL)
--       references SPECIALITE (ID_SPECIAL) on delete CASCADE on update CASCADE;

-- alter table SUPERIEUR foreign key (ID_UNIV)
--       references UNIVERSITE (ID_UNIV) on delete CASCADE on update CASCADE;

