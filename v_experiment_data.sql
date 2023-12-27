CREATE VIEW `v_experiment_data` AS
  SELECT ed.id, ed.experiment_id, ed.wave_id, e.potato_id, 
         e.description as exp_description,
         p.description, p.color, w.lyambda, ed.measurement
    FROM exp_data ed, potatos p, experiments e, waves w
    WHERE ed.wave_id = w.wave_id
      AND ed.experiment_id = e.experiment_id
      AND e.potato_id = p.potato_id