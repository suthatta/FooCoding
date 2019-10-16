/*select Name, Region, count(Language) from countrylanguage co
inner join country c on co.CountryCode =c.Code group by Name order by count(Language) Desc limit 18;*/

-- Create an insert trigger

create trigger insertLanguage on 
countrylanguage
for insert
as

          declare @CountryCode char(3);
          declare @Language char(30);
          declare @IsOfficial enum ('T','F') default 'F';
          declare @Percentage float (4,1);
          
	      select @CountryCode = s.CountryCode from inserted s;
          select @Language = s.Language from inserted s;
          select @IsOfficial  = s.lastname from inserted s;
          select @Percentage = s.Percentage from inserted s;
          set @activity = 'a country X has 9 languages';
			if insert into (Language)
                      set @activity = 'a country X has 9 languages'
	
          insert into myDatabase_new_world.dbo.countrylanguade(CountryCode, Language, IsOfficial, Percentage, activity)
                      values(@CountryCode @Language, @IsOfficial, @Percentage, @activity)
 
go

