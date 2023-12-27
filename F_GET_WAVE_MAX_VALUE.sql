use potato;
DELIMITER //

DROP FUNCTION IF EXISTS F_GET_WAVE_MAX_VALUE //
-- Task-7-1. Создайте функцию, которая рассчитывает стоимость каждой аренды (для каждой записи таблицы bookings).  
CREATE FUNCTION F_GET_WAVE_MAX_VALUE(vEXPIRIMENT_ID INT) RETURNS FLOAT
  READS SQL DATA
NOT DETERMINISTIC
BEGIN
  DECLARE vLAMBDA FLOAT;
  SELECT max( w.lyambda) INTO vLAMBDA
    FROM exp_data ed, waves w
    WHERE ed.wave_id = w.wave_id
    AND ED.EXPERIMENT_ID = vEXPIRIMENT_ID;
  RETURN(vLAMBDA);
END //

DELIMITER ;