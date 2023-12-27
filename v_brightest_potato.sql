CREATE VIEW `v_brightest_potato` AS
select potato_id, experiment_id, lyambda, measurement
  from (SELECT v.potato_id, v.experiment_id, v.measurement, v.lyambda,
               rank() OVER (partition by v.potato_id, v.experiment_id 
                 ORDER BY v.measurement desc) rank_bright
          FROM v_experiment_data v) as v_prev
    where rank_bright = 1