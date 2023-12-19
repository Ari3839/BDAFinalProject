-- @Autor		Ariadna Lazaro & Brian Bautista
-- @Fecha		20/nov/2023
-- @Descripcion: Inserts iniciales de historico_estatus

connect developer_m/oracle123@balaproy

create sequence historico_estatus_seq
  start with 1001
  increment by 1
  nocycle;

create sequence multimedia_playlist_seq
  start with 201
  increment by 1
  nocycle;

create sequence fragmento_seq
  start with 751
  increment by 1
  maxvalue 1000
  minvalue 751
  cycle;

create sequence num_seq
  start with 2
  increment by 1
  nocycle;


whenever sql error rollback
set serveroutput on;

---TABLA HISTORICO-ESTATUS

declare
  v_count number;
  cursor cur_insert is
   select * from multimedia;
begin
  for r in cur_insert loop
    insert into historico_estatus(historico_estatus_id,fecha_estatus,estatus_contenido_id,multimedia_id)
    values (r.multimedia_id,r.fecha_estatus,round(dbms_random.value(1,4),0),r.multimedia_id);
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en HISTORICO: '||v_count);
end;
/
commit;

connect developer_u/oracle123@balaproy


create sequence reproduccion_seq
  start with 2001
  increment by 1
  nocycle;

create sequence comentario_seq
  start with 301
  increment by 1
  nocycle;

create sequence renta_compra_seq
  start with 51
  increment by 1
  nocycle;

create sequence cargo_seq
  start with 601
  increment by 1
  maxvalue 1000
  minvalue 1
  cycle;

create sequence historico_costo_seq
  start with 101
  increment by 1
  nocycle;

