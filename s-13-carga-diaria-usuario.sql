-- @Autor   Ariadna Lazaro & Brian Bautista
-- @Fecha   04/dic/2023
-- @Descripcion: Inserts iniciales de modulo usuario

connect developer_m/oracle123@balaproy

whenever sql error rollback
set serveroutput on;

---TABLA TARJETA-CREDITO

declare
  v_count number;
  cursor cur_insert is
  select * from tarjeta_credito;
begin
  for r in cur_insert loop
    update tarjeta_credito set vencimiento=add_months(r.vencimiento,1)
      where usuario_id=r.usuario_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros actualizados en tarjeta_credito: '||v_count);
end;
/

--TABLA REPRODUCCION

declare
  v_count number;
  v_i number;
begin
  for v_i in 2001..2500 loop
    insert into reproduccion (reproduccion_id, multimedia_id, segundo_ini, segundo_fin, fecha, usuario_id)
    values(reproduccion_seq.nextval,round(dbms_random.value(1,100),0),round(dbms_random.value(1,10),0),
    round(dbms_random.value(30,40),0),sysdate,round(dbms_random.value(1,1000),0)); 
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en reproduccion: '||v_count);
end;
/

select count(*) from reproduccion;


--TABLA COMENTARIO

declare
  v_count number;
  v_i number;
begin
  for v_i in 301..750 loop
    insert into comentario (comentario_id, texto, comentario_respuesta_id, reproduccion_id)
    values(comentario_seq.nextval,dbms_random.string('A',15),null,round(dbms_random.value(1,2000),0));
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en comentarios: '||v_count);
end;
/

select count(*) from comentario;

--TABLA RENTA COMPRA

declare
  v_count number;
  v_i number;
begin
  for v_i in 51..100 loop
    insert into renta_compra (renta_compra_id,multimedia_id,folio,ini_renta,fin_renta,fecha_compra,usuario_id)
    values(renta_compra_seq.nextval,round(dbms_random.value(501,1000),0),dbms_random.string('A',8),null,null,sysdate,
    round(dbms_random.value(1,1000),0));
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en renta_compra: '||v_count);
end;
/
    

select count(*) from renta_compra;

--TABLA CARGO
declare
  v_count number;
  v_i number;
begin
  for v_i in 601..1000 loop
    insert into cargo (num_pago, usuario_id, importe, fecha_cargo)
    values(1,cargo_seq.nextval,round(dbms_random.value(100,200),0),sysdate);
    v_count := v_count + sql%rowcount;
  end loop;  
  dbms_output.put_line('Registros insertados en cargo: '||v_count);
end;
/
--TABLA HISTORICO COSTO

declare
  v_count number;
  v_i number;
begin
  for v_i in 101..200 loop
    insert into historico_costo (historico_costo_id, costo, ini_vigencia, fin_vigencia, plan_suscripcion_id)
    values(historico_costo_seq.nextval,round(dbms_random.value(100,200),0),sysdate,null,round(dbms_random.value(1,4),0));
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en historico_costo: '||v_count);
end;
/

select count(*) from historico_costo;

commit;