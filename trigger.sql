-- Тригер, який при додаванні нового рядка в таблицю game записує
-- значення поля developer у верхньому регістрі.

SELECT * FROM game

DROP TRIGGER IF EXISTS game_developer_insert ON game;

-- Перший етап: створення тригерної функції
CREATE OR REPLACE FUNCTION upper_developer() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE game
          SET developer = upper(developer) WHERE game.game_id = NEW.game_id; 
		  RETURN NULL; -- result is ignored since this is an AFTER trigger
     END;
$$;

-- Другий етап: створення тригеру
CREATE TRIGGER game_developer_insert 
AFTER INSERT ON game
FOR EACH ROW EXECUTE FUNCTION upper_developer()

-- Перевірка роботи. 
INSERT INTO game(game_id, name_game, developer, release_date,  price_for_game) 
VALUES('130', 'Half-Life: Blue Shift', 'Valve','2001-06-01',  3.99);


