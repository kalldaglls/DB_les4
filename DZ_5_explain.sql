explain SELECT _cities.title_en, _regions.title_en FROM _cities
 join _regions on _regions.title_en = 'Московская область';
 ALTER TABLE `geodata`.`_cities` 
ADD INDEX `title_ind_cit` (`title_en` ASC) VISIBLE;
ALTER TABLE `geodata`.`_cities` ALTER INDEX `cities_ind` INVISIBLE;
explain SELECT _cities.title_en, _regions.title_en FROM _cities
 join _regions on _regions.title_en = 'Московская область';
