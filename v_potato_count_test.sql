CREATE VIEW `v_potato_count_test` AS
  SELECT p.potato_id, p.description, count(*) count_test
    FROM exp_data ed, potatos p, experiments e
    WHERE ed.experiment_id = e.experiment_id
      AND e.potato_id = p.potato_id
	group by p.potato_id, p.description