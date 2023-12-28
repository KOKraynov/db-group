use potato;
DELIMITER //

DROP FUNCTION IF EXISTS F_GET_WAVE_MAX_VALUE //
-- Task-7-1. Создайте функцию, которая рассчитывает стоимость каждой аренды (для каждой записи таблицы bookings).  
CREATE FUNCTION F_GET_WAVE_MAX_VALUE() RETURNS TEXT
  READS SQL DATA
NOT DETERMINISTIC
BEGIN
  CREATE TEMPORARY TABLE IF NOT EXISTS wave_peaks AS
    SELECT EXPERIMENT_ID, max(lyambda) max_wave, min(lyambda) min_wave, 
           max(CASE 
                 WHEN rnk = 1 THEN lyambda 
                 ELSE 0 
			   END) peak_wave   
      FROM (SELECT ed.EXPERIMENT_ID, w.lyambda, ed.measurement,
                   RANK() OVER (PARTITION by EXPERIMENT_ID ORDER BY ed.measurement DESC) rnk
              FROM exp_data ed, waves w
              WHERE ed.wave_id = w.wave_id) as ex
	  GROUP BY EXPERIMENT_ID;
  RETURN('Во временной таблице wave_peaks определены пики спектрограмм.');
END //

DELIMITER ;