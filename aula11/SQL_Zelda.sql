/* Lógico_Zelda: */

CREATE TABLE character (
    descriptiom char(80),
    name char(40),
    affilitation char(40),
    character_id int PRIMARY KEY
);

CREATE TABLE item (
    effect char(40),
    item_id int PRIMARY KEY,
    rarity char(40),
    name char(40),
    type char(40)
);

CREATE TABLE local (
    type char(40),
    name char(40),
    descriptiom char(80),
    local_id int PRIMARY KEY
);

CREATE TABLE race (
    race_name char(40),
    special_ability char(40),
    fk_character_character_id int PRIMARY KEY
);

CREATE TABLE E__Assoc__1_have (
    quantity int,
    fk_character_character_id int,
    fk_item_item_id int
);

CREATE TABLE to_be (
    fk_character_character_id int,
    fk_local_local_id int
);
 
ALTER TABLE race ADD CONSTRAINT FK_race_2
    FOREIGN KEY (fk_character_character_id)
    REFERENCES character (character_id)
    ON DELETE CASCADE;
 
ALTER TABLE E__Assoc__1_have ADD CONSTRAINT FK_E__Assoc__1_have_1
    FOREIGN KEY (fk_character_character_id)
    REFERENCES character (character_id);
 
ALTER TABLE E__Assoc__1_have ADD CONSTRAINT FK_E__Assoc__1_have_2
    FOREIGN KEY (fk_item_item_id)
    REFERENCES item (item_id);
 
ALTER TABLE to_be ADD CONSTRAINT FK_to_be_1
    FOREIGN KEY (fk_character_character_id)
    REFERENCES character (character_id)
    ON DELETE RESTRICT;
 
ALTER TABLE to_be ADD CONSTRAINT FK_to_be_2
    FOREIGN KEY (fk_local_local_id)
    REFERENCES local (local_id)
    ON DELETE RESTRICT;