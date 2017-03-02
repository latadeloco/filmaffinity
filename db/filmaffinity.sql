
drop table if exists directores cascade;
create table directores (
    id         bigserial    constraint pk_directores primary key,
    nombre     varchar(30)  not null constraint uq_directores_nombre unique
);
insert into directores(nombre) values
    ('pepe'),
    ('manolito'),
    ('juanito'),
    ('lolito');

drop table if exists generos cascade;
create table generos (
    id         bigserial    constraint pk_generos primary key,
    nombre     varchar(30)  not null constraint uq_generos_nombre unique
);
insert into generos(nombre) values
    ('comedia'),
    ('ciencia ficción'),
    ('thriller'),
    ('terror');

drop table if exists peliculas cascade;
create table peliculas (
    id      bigserial    constraint pk_peliculas primary key,
    titulo  varchar(255) not null,
    fecha   timestamp,
    duracion    numeric(4),
    pais    varchar(20),
    director    bigint references directores (id),
    genero  bigint references generos (id),
    sinopsis    varchar(255)
);

insert into peliculas(titulo, fecha, duracion, pais, director, genero) values
    ('La guerra del otro día', timestamp '2013-03-01', 133 ,'España', 1, 1),
    ('La guerra del día siguiente al otro día',timestamp '2014-03-01',222, 'Gibraltar', 2, 2),
    ('La paz ya ha llegado', timestamp '2015-04-21', 124,'Gibraltar', 3, 4);


    create table usuarios (
    id         bigserial    constraint pk_usuarios primary key,
    nombre     varchar(15)  not null constraint uq_usuarios_nombre unique,
    password   varchar(60)  not null,
    email      varchar(255) not null unique,
    created_at timestamptz  default current_timestamp
);

insert into usuarios(nombre, password, email) values
    ('pepe', 'pepe', 'pepe@pepe.com'),
    ('pepa', 'pepa', 'pepa@pepa.com'),
    ('lolo', 'lolo', 'lolo@lolo.com'),
    ('lola', 'lola', 'lola@lola.com');
