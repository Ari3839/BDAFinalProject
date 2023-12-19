-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		04/dic/2023
-- @Descripcion: Inserts iniciales de modulo multimedia

connect developer_m/oracle123@balaproy

whenever sql error rollback
set serveroutput on;

---TABLA HISTORICO-ESTATUS

declare
  v_count number;
  cursor cur_insert is
  select * from historico_estatus;
begin
  for r in cur_insert loop
    insert into historico_estatus(historico_estatus_id,fecha_estatus,estatus_contenido_id,multimedia_id)
    values (historico_estatus_seq.nextval,add_months(r.fecha_estatus,-1),round(dbms_random.value(1,4),0),r.multimedia_id);
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en HISTORICO_ESTATUS: '||v_count);
end;
/

select count(*) from historico_estatus;

--TABLA AUTOR

declare
  v_count number;
  cursor cur_update is
  select * from autor;
begin
  for r in cur_update loop
    update autor set email=upper(email) where autor_id=r.autor_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros actualizados en AUTOR: '||v_count);
end;
/
select email from autor;
--TABLA AUTOR_MULTIMEDIA

declare
  v_count number;
  cursor cur_update is
  select * from autor_multimedia;
begin
  for r in cur_update loop
    update autor_multimedia set porcentaje_participacion=r.porcentaje_participacion+0.1
      where autor_multimedia_id=r.autor_multimedia_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros actualizados en AUTOR_MULTIMEDIA: '||v_count);
end;
/
select porcentaje_participacion from autor_multimedia;

--TABLA MULTIMEDIA:

declare
  v_count number;
  cursor cur_update is
  select * from multimedia;
begin
  for r in cur_update loop
    update multimedia set reproducciones=r.reproducciones+round(dbms_random.value(1,4),0)
      where multimedia_id=r.multimedia_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros actualizados en MULTIMEDIA: '||v_count);
end;
/
select reproducciones from multimedia;

--TABLA PLAYLIST
declare
  v_count number;
  cursor cur_update is
  select * from playlist
  where playlist_id<=100;
begin
  for r in cur_update loop
    if r.calificacion<5 then
      update playlist set calificacion=r.calificacion+1 where playlist_id=r.playlist_id;
      v_count := v_count + 1;
    end if;
  end loop;
  dbms_output.put_line('Registros actualizados en PLAYLIST: '||v_count);
end;
/

declare
  v_count number;
  cursor cur_update is
  select * from playlist
  where playlist_id>100 and playlist_id<=200;
begin
  for r in cur_update loop
    if r.calificacion>0 then
      update playlist set calificacion=r.calificacion-1 where playlist_id=r.playlist_id;
      v_count := v_count + 1;
    end if;
  end loop;
  dbms_output.put_line('Registros actualizados en PLAYLIST: '||v_count);
end;
/

--TABLA MULTIMEDIA PLAYLIST_MULTIMEDIA

declare
  v_count number;
  v_i number;
begin
  for v_i in 201..400 loop
    insert into multimedia_playlist(multimedia_playlist_id,multimedia_id,playlist_id)
    values(multimedia_playlist_seq.nextval,round(dbms_random.value(1,1000),0),round(dbms_random.value(1,200),0));
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en PLAYLIST_MULTIMEDIA: '||v_count);
end;
/
select count(*) from multimedia_playlist;


--TABLA VIDEO
declare
  v_count number;
  cursor cur_update is
  select * from video;
begin
  for r in cur_update loop
    update video set costo_venta=r.costo_venta+100.00, 
    costo_renta=r.costo_renta+50.00 where multimedia_id=r.multimedia_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros actualizados en VIDEO: '||v_count);
end;
/


--TABLA ALBUM
declare
  v_count number;
  cursor cur_update is
  select * from album;
begin
  for r in cur_update loop
    update album set fecha_lanzamiento=add_months(r.fecha_lanzamiento,1)
      where album_id=r.album_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros actualizados en ALBUM: '||v_count);
end;
/

--TABLA SERIE

declare
  v_count number;
  cursor cur_update is
  select * from serie;
begin
  for r in cur_update loop
    update serie set fecha_lanzamiento=add_months(r.fecha_lanzamiento,1)
      where serie_id=r.serie_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros actualizados en SERIE: '||v_count);
end;
/


--TABLA FRAGMENTO
declare
  v_count number;
  v_i number;
begin
  for v_i in 751..1000 loop
    insert into fragmento(num_sequencia,multimedia_id,fragmento)
    values(2,v_i,empty_blob());
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en FRAGMENTO: '||v_count);
end;
/

declare
  v_count number;
  v_i number;
begin
  for v_i in 601..1000 loop
    insert into fragmento(num_sequencia,multimedia_id,fragmento)
    values(3,v_i,empty_blob());
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en FRAGMENTO: '||v_count);
end;
/

select * from fragmento order by num_sequencia,multimedia_id;

commit;