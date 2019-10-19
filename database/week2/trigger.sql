-- Create an insert trigger
use new_world;
delimiter |
CREATE TRIGGER insertLanguage 
BEFORE INSERT ON countrylanguage 
FOR EACH ROW
BEGIN
	DECLARE messages_text char(30);
    DECLARE total_languages int;
    SET total_languages = (SELECT Count(Language) FROM countrylanguage WHERE CountryCode = NEW.CountryCode);
	IF ( total_languages > 9) then
        signal sqlstate '45000' 
        SET message_text = 'You cannot insert > 9!';
    END IF;   
END;
|
delimiter ;


-- DROP TRIGGER IF EXISTS insertLanguage;
-- DROP TRIGGER ALL ON countrylanguage;
/*TEST DATA*/
/*-- select Name, CountryCode, count(Language) from countrylanguage cl */
-- inner join country c on cl.CountryCode = c.Code 
-- group by CountryCode order by count(Language) desc limit 30;
/* Austria                               | AUT         |               9*/
-- INSERT INTO countrylanguage VALUE('VNM','Test12','F','0');
-- INSERT INTO countrylanguage (CountryCode, Language, IsOfficial, Percentage) VALUES ('TCD','TESTTEST','F','0');


-- select count(*) from countrylanguage where CountryCode ="TCD";
-- DELETE FROM countrylanguage WHERE CountryCode='AUT' and Percentage =0;
