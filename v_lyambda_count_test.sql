CREATE VIEW `v_lyambda_count_test` AS
  SELECT w.wave_id, w.lyambda, count(*) count_test
    FROM waves w, experiments e
    WHERE w.wave_id = w.wave_id
	group by w.wave_id, w.lyambda