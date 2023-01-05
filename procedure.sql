-- Створити процедуру insert_rating(id_game, negative, positive), яка додає в таблицю rating
-- новий рядок із вказаними аргументами та поточною датою. Продемонструвати роботу процедури.
DROP PROCEDURE IF EXISTS insert_rating(integer, integer, integer);
CREATE OR REPLACE PROCEDURE insert_rating(id_game integer, negative integer, positive integer )
LANGUAGE 'plpgsql'
AS $$
BEGIN
    INSERT INTO rating(game_id,date_rating ,positive_rating,negative_rating) VALUES (id_game, CURRENT_DATE, positive,negative);
END;
$$;

-- Виклик процедури
CALL insert_rating(130,3822 ,420);
SELECT * FROM rating