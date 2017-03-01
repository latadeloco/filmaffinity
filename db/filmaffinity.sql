
drop table if exists directores cascade;

create table directores (
    id         bigserial    constraint pk_usuarios primary key,
    nombre     varchar(30)  not null constraint uq_directores_nombre unique
);
insert into directores(nombre) values
    ('pepe'),
    ('manolito'),
    ('juanito'),
    ('lolito');

drop table if exists peliculas cascade;
create table peliculas (
    id      bigserial    constraint pk_peliculas primary key,
    titulo  varchar(255) not null,
    fecha   timestamp,
    duracion    numeric(4),
    pais    varchar(20),
    director    bigint references directores (id)
);

insert into peliculas(titulo, fecha, duracion, pais, director) values
    ('La guerra del otro día', timestamp '2013-03-01', 133 ,'España', 1),
    ('La guerra del día siguiente al otro día',timestamp '2014-03-01',222, 'Gibraltar', 2),
    ('La paz ya ha llegado', timestamp '2015-04-21', 124,'Gibraltar', 3);
--
--
-- create table usuarios (
--     id         bigserial    constraint pk_usuarios primary key,
--     nombre     varchar(15)  not null constraint uq_usuarios_nombre unique,
--     password   varchar(60)  not null,
--     email      varchar(255) not null,
--     token      varchar(32),
--     activacion varchar(32),
--     created_at timestamptz  default current_timestamp
-- );
--
-- create index idx_usuarios_activacion on usuarios (activacion);
-- create index idx_usuarios_created_at on usuarios (created_at);
