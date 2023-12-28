insert into potatos(potato_id)
  select distinct pot_id
    from pot;
    
insert into experiments(potato_id, experiment_id)
  select distinct pot_id, exp_id
    from pot;
    
insert into waves(wave_id, lyambda)
  select distinct w_id, lya
    from pot;

insert into exp_data(id, experiment_id, wave_id, measurement)
  select id, exp_id,  w_id, value
    from pot;