--функція get_developers(developer_arg_arg), яка виводить усі ігри 
--з заданим роробником. 

DROP FUNCTION IF EXISTS get_developer(varchar); 
CREATE OR REPLACE FUNCTION get_developer(developer_arg varchar) 
    RETURNS TABLE (names_game varchar, developers varchar)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
        SELECT name_game::varchar, developer::varchar
		FROM game
		WHERE developer = developer_arg;
END;
$$
-- Виклик функції
SELECT * FROM get_developer('Valve');
-- Другий варіант виклику
SELECT get_developer('Valve');



