--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      unam
-- Project :      FormatoCrowsFoot.DM1
-- Author :       Ariadna Lazaro & Brian Bautista
--
-- Date Created : 20/nov/2023
-- Target DBMS : Oracle 11g
--

Prompt conectando como usuario developer_m
connect developer_m/oracle123


-- 
-- TABLE: GENERO 
--

CREATE TABLE GENERO(
    GENERO_ID      NUMBER(10, 2)    NOT NULL,
    CLAVE          VARCHAR2(40)     NOT NULL,
    DESCRIPCION    VARCHAR2(400)    NOT NULL,
    CONSTRAINT GENERO_PK PRIMARY KEY (GENERO_ID)
    using index(
      create unique index GENERO_PK on GENERO(GENERO_ID)
      tablespace indices_multimedia
    )
);


-- 
-- TABLE: ESTATUS_CONTENIDO
--

CREATE TABLE ESTATUS_CONTENIDO(
    ESTATUS_CONTENIDO_ID    NUMBER(10, 2)    NOT NULL,
    CLAVE                   VARCHAR2(40)     NOT NULL,
    DESCRIPCION             VARCHAR2(100)    NOT NULL,
    CONSTRAINT ESTATUS_CONTENIDO_PK PRIMARY KEY (ESTATUS_CONTENIDO_ID)
    using index(
      create unique index ESTATUS_CONTENIDO_PK on ESTATUS_CONTENIDO(ESTATUS_CONTENIDO_ID)
      tablespace indices_multimedia
    )
) tablespace hisotricos_multimedia;



-- 
-- TABLE: AUTOR 
--

CREATE TABLE AUTOR(
    AUTOR_ID            NUMBER(10, 2)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PAT              VARCHAR2(40)     NOT NULL,
    AP_MAT              VARCHAR2(40)     NOT NULL,
    EMAIL               VARCHAR2(40)     NOT NULL,
    NOMBRE_ARTISTICO    VARCHAR2(40),
    GRUPO_ARTISTICO     VARCHAR2(40),
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
    using index(
      create unique index AUTOR_PK on AUTOR(AUTOR_ID)
      tablespace indices_multimedia
    )
);


-- 
-- TABLE: MULTIMEDIA 
--

CREATE TABLE MULTIMEDIA(
    MULTIMEDIA_ID           NUMBER(10, 2)    NOT NULL,
    CLAVE                   VARCHAR2(16)     NOT NULL,
    NOMBRE                  VARCHAR2(40)     NOT NULL,
    REPRODUCCIONES          NUMBER(6, 0)     NOT NULL,
    DURACION                NUMBER(5, 0)     NOT NULL,
    FECHA_ESTATUS           DATE             NOT NULL,
    TIPO                    VARCHAR2(1)      NOT NULL,
    ESTATUS_CONTENIDO_ID    NUMBER(10, 2)    NOT NULL,
    GENERO_ID               NUMBER(10, 2)    NOT NULL,
    CONSTRAINT MULTIMEDIA_PK PRIMARY KEY (MULTIMEDIA_ID)
    using index(
      create unique index MULTIMEDIA_PK on MULTIMEDIA(MULTIMEDIA_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT MULTIMEDIA_ESTATUS_CONTENIDO_ID_FK FOREIGN KEY (ESTATUS_CONTENIDO_ID)
    REFERENCES ESTATUS_CONTENIDO(ESTATUS_CONTENIDO_ID),
    CONSTRAINT MULTIMEDIA_GENERO_ID_FK FOREIGN KEY (GENERO_ID)
    REFERENCES GENERO(GENERO_ID)
)tablespace jerarquia_multimedia;


-- 
-- TABLE: ALBUM 
--

CREATE TABLE ALBUM(
    ALBUM_ID             NUMBER(10,2)    NOT NULL,
    NOMBRE               VARCHAR2(40)    NOT NULL,
    FECHA_LANZAMIENTO    DATE            NOT NULL,
    IMG_PORTADA          BLOB            NOT NULL,
    AUTOR_ID             NUMBER(10,2)    NOT NULL,
    CONSTRAINT ALBUM_PK PRIMARY KEY (ALBUM_ID)
    using index(
      create unique index ALBUM_PK on ALBUM(ALBUM_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT ALBUM_AUTOR_ID_FK FOREIGN KEY (AUTOR_ID)
    REFERENCES AUTOR(AUTOR_ID)
) LOB(IMG_PORTADA) STORE AS (tablespace lobs_multimedia1);


-- 
-- TABLE: AUDIO 
--

CREATE TABLE AUDIO(
    MULTIMEDIA_ID    NUMBER(10, 2)     NOT NULL,
    FORMATO          VARCHAR2(5)       NOT NULL,
    KBPS             NUMBER(5, 0)      NOT NULL,
    LETRA            VARCHAR2(4000)    NOT NULL,
    AUDIO            BLOB              NOT NULL,
    ALBUM_ID         NUMBER(10, 2),
    CONSTRAINT AUDIO_PK PRIMARY KEY (MULTIMEDIA_ID)
    using index(
      create unique index AUDIO_PK on AUDIO(MULTIMEDIA_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT AUDIO_MILTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT AUDIO_ALBUM_ID_FK FOREIGN KEY (ALBUM_ID)
    REFERENCES ALBUM(ALBUM_ID)
)LOB(AUDIO) STORE AS (tablespace lobs_multimedia2);


-- 
-- TABLE: AUTOR_MULTIMEDIA 
--

CREATE TABLE AUTOR_MULTIMEDIA(
    AUTOR_MULTIMEDIA_ID         NUMBER(10, 2)    NOT NULL,
    PORCENTAJE_PARTICIPACION    NUMBER(5, 2)     NOT NULL,
    AUTOR_ID                    NUMBER(10, 2)    NOT NULL,
    MULTIMEDIA_ID               NUMBER(10, 2)    NOT NULL,
    CONSTRAINT AUTOR_MULTIMEDIA_PK PRIMARY KEY (AUTOR_MULTIMEDIA_ID)
    using index(
      create unique index AUTOR_MULTIMEDIA_PK on AUTOR_MULTIMEDIA(AUTOR_MULTIMEDIA_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT AUTOR_MULTIMEDIA_AUTOR_ID_FK FOREIGN KEY (AUTOR_ID)
    REFERENCES AUTOR(AUTOR_ID),
    CONSTRAINT AUTOR_MULTIMEDIA_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
);


-- 
-- TABLE: HISTORICO_ESTATUS 
--

CREATE TABLE HISTORICO_ESTATUS(
    HISTORICO_ESTATUS_ID    NUMBER(10, 2)    NOT NULL,
    FECHA_ESTATUS           DATE             NOT NULL,
    ESTATUS_CONTENIDO_ID    NUMBER(10, 2)    NOT NULL,
    MULTIMEDIA_ID           NUMBER(10, 2)    NOT NULL,
    CONSTRAINT HISTORICO_ESTATUS_PK PRIMARY KEY (HISTORICO_ESTATUS_ID)
    using index(
      create unique index HISTORICO_ESTATUS_PK on HISTORICO_ESTATUS(HISTORICO_ESTATUS_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT HISTORICO_ESTATUS_ESTATUS_CONTENIDO_ID_FK FOREIGN KEY (ESTATUS_CONTENIDO_ID)
    REFERENCES ESTATUS_CONTENIDO(ESTATUS_CONTENIDO_ID),
    CONSTRAINT HISTORICO_ESTATUS_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
)tablespace hisotricos_multimedia;




-- 
-- TABLE: PLAYLIST 
--

CREATE TABLE PLAYLIST(
    PLAYLIST_ID     NUMBER(10, 2)    NOT NULL,
    USUARIO_ID      NUMBER(10, 2)    NOT NULL,
    NOMBRE          VARCHAR2(40)     NOT NULL,
    CALIFICACION    NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PLAYLIST_PK PRIMARY KEY (PLAYLIST_ID)
    using index(
      create unique index PLAYLIST_PK on playlist(PLAYLIST_ID)
      tablespace indices_multimedia
    )
)tablespace playlists;




-- 
-- TABLE: MULTIMEDIA_PLAYLIST 
--

CREATE TABLE MULTIMEDIA_PLAYLIST(
    MULTIMEDIA_PLAYLIST_ID    NUMBER(10, 2)    NOT NULL,
    MULTIMEDIA_ID             NUMBER(10, 2)    NOT NULL,
    PLAYLIST_ID               NUMBER(10, 2)    NOT NULL,
    CONSTRAINT MULTIMEDIA_PLAYLIST_PK PRIMARY KEY (MULTIMEDIA_PLAYLIST_ID)
    using index(
      create unique index MULTIMEDIA_PLAYLIST_PK on MULTIMEDIA_PLAYLIST(MULTIMEDIA_PLAYLIST_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT MULTIMEDIA_PLAYLIST_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT MULTIMEDIA_PLAYLIST_ID_FK FOREIGN KEY (PLAYLIST_ID)
    REFERENCES PLAYLIST(PLAYLIST_ID)
) tablespace playlists;


-- 
-- TABLE: SERIE 
--

CREATE TABLE SERIE(
    SERIE_ID             NUMBER(10, 2)    NOT NULL,
    NOMBRE               VARCHAR2(40)     NOT NULL,
    NUM_TEMP             NUMBER(2, 0)     NOT NULL,
    FECHA_LANZAMIENTO    DATE             NOT NULL,
    CONSTRAINT SERIE_PK PRIMARY KEY (SERIE_ID)
    using index(
      create unique index SERIE_PK on serie(SERIE_ID)
      tablespace indices_multimedia
    )
);




-- 
-- TABLE: VIDEO 
--

CREATE TABLE VIDEO(
    MULTIMEDIA_ID            NUMBER(10, 2)    NOT NULL,
    TIPO                     VARCHAR2(40)     NOT NULL,
    CLASIFICACION            VARCHAR2(3)      NOT NULL,
    CODIFICACION             VARCHAR2(5),
    TRANSPORTE               VARCHAR2(5)      NOT NULL,
    PROTOCOLO_TRANSMISION    VARCHAR2(5)      NOT NULL,
    VIP                      NUMBER(1, 0)     NOT NULL,
    COSTO_RENTA              NUMBER(6, 2)     NOT NULL,
    COSTO_VENTA              NUMBER(6, 2)     NOT NULL,
    FECHA_INI_COSTO          DATE             NOT NULL,
    FECHA_FIN_COSTO          DATE             NOT NULL,
    SERIE_ID                 NUMBER(10, 2),
    CONSTRAINT VIDEO_PK PRIMARY KEY (MULTIMEDIA_ID)
    using index(
      create unique index VIDEO_PK on video(MULTIMEDIA_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT VIDEO_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT VIDEO_SERIE_ID_FK FOREIGN KEY (SERIE_ID)
    REFERENCES SERIE(SERIE_ID)
) tablespace jerarquia_multimedia;





-- 
-- TABLE: FRAGMENTO 
--

CREATE TABLE FRAGMENTO(
    NUM_SEQUENCIA    NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID    NUMBER(10, 2)    NOT NULL,
    FRAGMENTO        BLOB             NOT NULL,
    CONSTRAINT FRAGMENTO_PK PRIMARY KEY (NUM_SEQUENCIA, MULTIMEDIA_ID)
    using index(
      create unique index FRAGENTO_PK on FRAGMENTO(NUM_SEQUENCIA,MULTIMEDIA_ID)
      tablespace indices_multimedia
    ),
    CONSTRAINT FRAGMENTO_MILTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES VIDEO(MULTIMEDIA_ID)
)LOB(FRAGMENTO) STORE AS (tablespace lobs_multimedia3);


---INDICES

create index autor_username_ix on autor(upper(ap_pat)) tablespace indices_multimedia;
create index multimedia_clave_ix on multimedia(upper(clave)) tablespace indices_multimedia;
create index multimedia_nombre_ix on multimedia(upper(nombre)) tablespace indices_multimedia;
create index album_nombre_ix on album(upper(nombre)) tablespace indices_multimedia;
create index serie_nombre_ix on serie(upper(nombre)) tablespace indices_multimedia;
create index playlist_usuario_uk on playlist(usuario_id) tablespace indices_multimedia;


-------------------------------------SEPARACION
-------------------------------------SEPARACION
-------------------------------------SEPARACION
-------------------------------------SEPARACION
-------------------------------------SEPARACION
-------------------------------------SEPARACION
-------------------------------------SEPARACION


Prompt conectando como usuario developer_u
connect developer_u/oracle123


-- 
-- TABLE: PLAN_SUSCRIPCION 
--

CREATE TABLE PLAN_SUSCRIPCION(
    PLAN_SUSCRIPCION_ID    NUMBER(10, 2)    NOT NULL,
    CLAVE                  VARCHAR2(20)     NOT NULL,
    NOMBRE                 VARCHAR2(40)     NOT NULL,
    COSTO                  NUMBER(6, 2)     NOT NULL,
    DESCRIPCION            VARCHAR2(250)    NOT NULL,
    CONSTRAINT PLAN_SUSCRIPCION_PK PRIMARY KEY (PLAN_SUSCRIPCION_ID)
    using index(
      create unique index PLAN_SUSCRIPCION_PK on plan_suscripcion(PLAN_SUSCRIPCION_ID)
      tablespace indices_usuarios
    )
) tablespace hisotricos_usuarios;






-- 
-- TABLE: USUARIO 
--

CREATE TABLE USUARIO(
    USUARIO_ID                    NUMBER(10, 2)    NOT NULL,
    NOMBRE                        VARCHAR2(40)     NOT NULL,
    AP_PAT                        VARCHAR2(40)     NOT NULL,
    AP_MAT                        VARCHAR2(40)     NOT NULL,
    EMAIL                         VARCHAR2(40)     NOT NULL,
    PASSWORD                      VARCHAR2(40)     NOT NULL,
    USERNAME                      VARCHAR2(40)     NOT NULL,
    RFC                           VARCHAR2(13),
    ADMININSTRADOR_FAMILIAR_ID    NUMBER(10, 2),
    USUARIO_COMPARTE_ID           NUMBER(10, 2),
    PLAN_SUSCRIPCION_ID           NUMBER(10, 2)    NOT NULL,
    CONSTRAINT USUARIO_PK PRIMARY KEY (USUARIO_ID)
    using index(
      create unique index USUARIO_PK on usuario(USUARIO_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT USUARIO_ADMIN_FAMILIAR_ID_FK FOREIGN KEY (ADMININSTRADOR_FAMILIAR_ID)
    REFERENCES USUARIO(USUARIO_ID),
    CONSTRAINT USUARIO_USUARIO_COMPARTE_ID_FK FOREIGN KEY (USUARIO_COMPARTE_ID)
    REFERENCES USUARIO(USUARIO_ID),
    CONSTRAINT USUARIO_PLAN_SUSCRIPCION_ID_FK FOREIGN KEY (PLAN_SUSCRIPCION_ID)
    REFERENCES PLAN_SUSCRIPCION(PLAN_SUSCRIPCION_ID)
);



-- 
-- TABLE: TARJETA_CREDITO 
--

CREATE TABLE TARJETA_CREDITO(
    USUARIO_ID     NUMBER(10, 2)    NOT NULL,
    NUMERO         NUMBER(16, 0)    NOT NULL,
    VENCIMIENTO    DATE             NOT NULL,
    TIPO           VARCHAR2(40)     NOT NULL,
    CVV            NUMBER(3, 0)     NOT NULL,
    CONSTRAINT TARJETA_CREDITO_PK PRIMARY KEY (USUARIO_ID)
    using index(
      create unique index TARJETA_CREDITO_PK on tarjeta_credito(USUARIO_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT TARJETA_CREDITO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
) tablespace tarjetas;



-- 
-- TABLE: RENTA_COMPRA 
--

CREATE TABLE RENTA_COMPRA(
    RENTA_COMPRA_ID    NUMBER(10, 2)    NOT NULL,
    MULTIMEDIA_ID      NUMBER(10, 2)    NOT NULL,
    FOLIO              VARCHAR2(8)      NOT NULL,
    INI_RENTA          DATE,
    FIN_RENTA          DATE,
    PERIODO_RENTA      NUMBER(6, 0) generated always as (FIN_RENTA-INI_RENTA),
    FECHA_COMPRA       DATE,
    USUARIO_ID         NUMBER(10, 2)    NOT NULL,
    CONSTRAINT RENTA_COMPRA_PK PRIMARY KEY (RENTA_COMPRA_ID)
    using index(
      create unique index RENTA_COMPRA_PK on renta_compra(RENTA_COMPRA_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT RENTA_COMPRA_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
);


-- 
-- TABLE: REPRODUCCION 
--

CREATE TABLE REPRODUCCION(
    REPRODUCCION_ID    NUMBER(10, 2)    NOT NULL,
    MULTIMEDIA_ID      NUMBER(10, 2)    NOT NULL,
    SEGUNDO_INI        NUMBER(8, 0)     NOT NULL,
    SEGUNDO_FIN        NUMBER(8, 0)     NOT NULL,
    FECHA              DATE             NOT NULL,
    USUARIO_ID         NUMBER(10, 2)    NOT NULL,
    CONSTRAINT REPRODUCCION_PK PRIMARY KEY (REPRODUCCION_ID)
    using index(
      create unique index REPRODUCCION_PK on reproduccion(REPRODUCCION_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT REPRODUCCION_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
)
partition by hash (REPRODUCCION_ID)
partitions 4
store in (reproducciones1,reproducciones2,reproducciones3,reproducciones4);




-- 
-- TABLE: CARGO 
--

CREATE TABLE CARGO(
    NUM_PAGO       NUMBER(3, 0)     NOT NULL,
    USUARIO_ID     NUMBER(10, 2)    NOT NULL,
    IMPORTE        NUMBER(8, 2)     NOT NULL,
    FECHA_CARGO    DATE             NOT NULL,
    CONSTRAINT CARGO_PK PRIMARY KEY (NUM_PAGO, USUARIO_ID)
    using index(
      create unique index CARGO_PK on CARGO(NUM_PAGO,USUARIO_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT CARGO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES TARJETA_CREDITO(USUARIO_ID)
);


-- 
-- TABLE: COMENTARIO 
--

CREATE TABLE COMENTARIO(
    COMENTARIO_ID              NUMBER(10, 2)    NOT NULL,
    TEXTO                      VARCHAR2(150)    NOT NULL,
    COMENTARIO_RESPUESTA_ID    NUMBER(10, 2),
    REPRODUCCION_ID            NUMBER(10, 2)    NOT NULL,
    CONSTRAINT COMENTARIO_PK PRIMARY KEY (COMENTARIO_ID)
    using index(
      create unique index COMENTARIO_PK on COMENTARIO(COMENTARIO_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT COMENTARIO_COMENTARIO_ID_FK FOREIGN KEY (COMENTARIO_RESPUESTA_ID)
    REFERENCES COMENTARIO(COMENTARIO_ID),
    CONSTRAINT COMENTARIO_REPRODUCCION_ID_FK FOREIGN KEY (REPRODUCCION_ID)
    REFERENCES REPRODUCCION(REPRODUCCION_ID)
)tablespace comentarios;


-- 
-- TABLE: DISPOSITIVO 
--

CREATE TABLE DISPOSITIVO(
    DISPOSITIVO_ID    NUMBER(10, 2)    NOT NULL,
    NOMBRE            VARCHAR2(40)     NOT NULL,
    TIPO              VARCHAR2(40)     NOT NULL,
    IP                VARCHAR2(15)     NOT NULL,
    SISTEMA_OP        VARCHAR2(40)     NOT NULL,
    MARCA             VARCHAR2(40)     NOT NULL,
    USUARIO_ID        NUMBER(10, 2)    NOT NULL,
    CONSTRAINT DISPOSITIVO_PK PRIMARY KEY (DISPOSITIVO_ID)
    using index(
      create unique index DISPOSITIVO_PK on DISPOSITIVO(DISPOSITIVO_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT DISPOSITIVO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
);

-- 
-- TABLE: HISTORICO_COSTO 
--

CREATE TABLE HISTORICO_COSTO(
    HISTORICO_COSTO_ID     NUMBER(10, 2)    NOT NULL,
    COSTO                  NUMBER(6, 2)     NOT NULL,
    INI_VIGENCIA           DATE             NOT NULL,
    FIN_VIGENCIA           DATE,
    PLAN_SUSCRIPCION_ID    NUMBER(10, 2)    NOT NULL,
    CONSTRAINT HISTORICO_COSTO_PK PRIMARY KEY (HISTORICO_COSTO_ID)
    using index(
      create unique index HISTORICO_COSTO_PK on HISTORICO_COSTO(HISTORICO_COSTO_ID)
      tablespace indices_usuarios
    ),
    CONSTRAINT HISTORICO_COSTO_PLAN_SUSCRIPCION_ID_FK FOREIGN KEY (PLAN_SUSCRIPCION_ID)
    REFERENCES PLAN_SUSCRIPCION(PLAN_SUSCRIPCION_ID)
) tablespace hisotricos_usuarios;


--INDICES

create unique index usuario_email_uk on usuario(email) tablespace indices_usuarios;
create unique index usuario_username_uk on usuario(username) tablespace indices_usuarios;
create index reproduccion_multimedia_ix on reproduccion(multimedia_id) tablespace indices_usuarios;
create unique index renta_compra_folio_uk on renta_compra(folio) tablespace indices_usuarios;