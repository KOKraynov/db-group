insert into potatos(potato_id)
  select distinct class
    from libs_row;
    
insert into experiments(potato_id, experiment_id)
  select distinct class, exp
    from libs_row;
    
insert into waves(lyambda)
  select distinct lyamda
    from libs_row;

insert into exp_data(id, experiment_id, wave_id, measurement)
  select ROW_NUMBER() OVER (ORDER BY lr.class), exp,  wave_id, value
    from libs_row lr, waves w
    where w.lyambda = lr.lyamda;