DELIMITER //

DROP TRIGGER IF EXISTS TD_potatos //

CREATE TRIGGER TD_potatos BEFORE DELETE ON potatos 
  FOR EACH ROW 
BEGIN
  DELETE FROM experiments e
    WHERE e.potato_id =  OLD.potato_id;
END//

DROP TRIGGER IF EXISTS TD_waves //

CREATE TRIGGER TD_experiments BEFORE DELETE ON experiments 
  FOR EACH ROW 
BEGIN
  DELETE FROM exp_data ed
    WHERE ed.experiment_id =  OLD.experiment_id;
END//

DROP TRIGGER IF EXISTS TD_waves //

CREATE TRIGGER TD_waves BEFORE DELETE ON waves 
  FOR EACH ROW 
BEGIN
  DELETE FROM exp_data ed
    WHERE ed.wave_id =  OLD.wave_id;
END//

DELIMITER ;