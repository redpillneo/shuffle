-- how should I do this?

CREATE TABLE 'shuffle_user' (
  'user_id' int NOT NULL auto_increment PRIMARY KEY,
  'password' varchar(100) NOT NULL,
  'progress' int NOT NULL -- REFERENCES user_progress
)

CREATE TABLE 'user_progress' (
  'user_progress_ID' int NOT NULL auto_increment PRIMARY KEY,
  'user_ID' int,
  'ave_mem_speed' int,
  'accuracy' int, 
  'wrong_cards' 
)

-- table for the standard cards in the system
CREATE TABLE standard_cards (
  card_ID varchar(3) not null PRIMARY KEY,
  card_value varchar(6) not null,
  card_suite varchar(8) not null
)

-- inserting the standard cards
INSERT INTO standard_cards (card_ID, card_value, card_suite) VALUES
('ac', 'Ace', 'Clubs'),
('2c', 'Two', 'Clubs'),
('3c', 'Three', 'Clubs'),
('4c', 'Four', 'Clubs'),
('5c', 'Five', 'Clubs'),
('6c', 'Six', 'Clubs'),
('7c', 'Seven', 'Clubs'),
('8c', 'Eight', 'Clubs'),
('9c', 'Nine', 'Clubs'),
('10c', 'Ten', 'Clubs'),
('jc', 'Jack', 'Clubs'),
('qc', 'Queen', 'Clubs'),
('kc', 'King', 'Clubs'),
('ah', 'Ace', 'Hearts'),
('2h', 'Two', 'Hearts'),
('3h', 'Three', 'Hearts'),
('4h', 'Four', 'Hearts'),
('5h', 'Five', 'Hearts'),
('6h', 'Six', 'Hearts'),
('7h', 'Seven', 'Hearts'),
('8h', 'Eight', 'Hearts'),
('9h', 'Nine', 'Hearts'),
('10h', 'Ten', 'Hearts'),
('jh', 'Jack', 'Hearts'),
('qh', 'Queen', 'Hearts'),
('kh', 'King', 'Hearts'),
('as', 'Ace', 'Spades'),
('2s', 'Two', 'Spades'),
('3s', 'Three', 'Spades'),
('4s', 'Four', 'Spades'),
('5s', 'Five', 'Spades'),
('6s', 'Six', 'Spades'),
('7s', 'Seven', 'Spades'),
('8s', 'Eight', 'Spades'),
('9s', 'Nine', 'Spades'),
('10s', 'Ten', 'Spades'),
('js', 'Jack', 'Spades'),
('qs', 'Queen', 'Spades'),
('ks', 'King', 'Spades'),
('ad', 'Ace', 'Diamonds'),
('2d', 'Two', 'Diamonds'),
('3d', 'Three', 'Diamonds'),
('4d', 'Four', 'Diamonds'),
('5d', 'Five', 'Diamonds'),
('6d', 'Six', 'Diamonds'),
('7d', 'Seven', 'Diamonds'),
('8d', 'Eight', 'Diamonds'),
('9d', 'Nine', 'Diamonds'),
('10d', 'Ten', 'Diamonds'),
('jd', 'Jack', 'Diamonds'),
('qd', 'Queen', 'Diamonds'),
('kd', 'King', 'Diamonds');

CREATE TABLE shuffle_users(
  user_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  password varchar(8) NOT NULL,
  progress INT,
  FOREIGN KEY (progress) REFERENCES user_progress(progress_ID)
)


-- what do I want to do?
CREATE TABLE user_card(
  user_card_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  card_ID varchar(3) NOT NULL,
  card_acc decimal(6,3), -- card accuracy
  FOREIGN KEY (card_ID) REFERENCES standard_cards(card_ID)
)
-- duplicate w/o comment
CREATE TABLE user_card(
  user_card_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  card_ID varchar(3) NOT NULL,
  card_acc decimal(6,3), 
  FOREIGN KEY (card_ID) REFERENCES standard_cards(card_ID)
)

-- CREATE TABLE user_progress(
--   progress_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   user_ID INT NOT NULL,
--   ave_mem_spd DECIMAL(4, 2),
--   ave_rec_spd DECIMAL(4, 2), -- needs to be dd.dd because a user can't technically memorize a 3 digit amount of cards in under 3 minutes
--   ave_acc DECIMAL(6,3),
--   user_card_ac INT 
-- )


CREATE TABLE user_progress (
  progress_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_ID INT NOT NULL,
  ave_mem_spd DECIMAL(4, 2),
  ave_rec_spd DECIMAL(4, 2),
  ave_acc DECIMAL(6, 3),
  
  -- Clubs
  user_card_ac INT,
  user_card_2c INT,
  user_card_3c INT,
  user_card_4c INT,
  user_card_5c INT,
  user_card_6c INT,
  user_card_7c INT,
  user_card_8c INT,
  user_card_9c INT,
  user_card_10c INT,   -- Ten of Clubs
  user_card_jc INT,
  user_card_qc INT,
  user_card_kc INT,

  -- Hearts
  user_card_ah INT,
  user_card_2h INT,
  user_card_3h INT,
  user_card_4h INT,
  user_card_5h INT,
  user_card_6h INT,
  user_card_7h INT,
  user_card_8h INT,
  user_card_9h INT,
  user_card_10h INT,   -- Ten of Hearts
  user_card_jh INT,
  user_card_qh INT,
  user_card_kh INT,

  -- Spades
  user_card_as INT,
  user_card_2s INT,
  user_card_3s INT,
  user_card_4s INT,
  user_card_5s INT,
  user_card_6s INT,
  user_card_7s INT,
  user_card_8s INT,
  user_card_9s INT,
  user_card_10s INT,   -- Ten of Spades
  user_card_js INT,
  user_card_qs INT,
  user_card_ks INT,

  -- Diamonds
  user_card_ad INT,
  user_card_2d INT,
  user_card_3d INT,
  user_card_4d INT,
  user_card_5d INT,
  user_card_6d INT,
  user_card_7d INT,
  user_card_8d INT,
  user_card_9d INT,
  user_card_10d INT,   -- Ten of Diamonds
  user_card_jd INT,
  user_card_qd INT,
  user_card_kd INT,

  -- Foreign key reference to user_card table
  FOREIGN KEY (user_card_ac) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_jc) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qc) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_kc) REFERENCES user_card(user_card_ID),
  
  FOREIGN KEY (user_card_ah) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_jh) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qh) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_kh) REFERENCES user_card(user_card_ID),
  
  FOREIGN KEY (user_card_as) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_js) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qs) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_ks) REFERENCES user_card(user_card_ID),
  
  FOREIGN KEY (user_card_ad) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_jd) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qd) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_kd) REFERENCES user_card(user_card_ID),

  -- referencing the user
  FOREIGN KEY(user_ID) REFERENCES user(user_ID),
);

-- duplicate w/o comments
CREATE TABLE user_progress (
  progress_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_ID INT NOT NULL,
  ave_mem_spd DECIMAL(4, 2),
  ave_rec_spd DECIMAL(4, 2),
  ave_acc DECIMAL(6, 3),
  
  user_card_ac INT,
  user_card_2c INT,
  user_card_3c INT,
  user_card_4c INT,
  user_card_5c INT,
  user_card_6c INT,
  user_card_7c INT,
  user_card_8c INT,
  user_card_9c INT,
  user_card_10c INT,   
  user_card_jc INT,
  user_card_qc INT,
  user_card_kc INT,

  user_card_ah INT,
  user_card_2h INT,
  user_card_3h INT,
  user_card_4h INT,
  user_card_5h INT,
  user_card_6h INT,
  user_card_7h INT,
  user_card_8h INT,
  user_card_9h INT,
  user_card_10h INT,   
  user_card_jh INT,
  user_card_qh INT,
  user_card_kh INT,

  user_card_as INT,
  user_card_2s INT,
  user_card_3s INT,
  user_card_4s INT,
  user_card_5s INT,
  user_card_6s INT,
  user_card_7s INT,
  user_card_8s INT,
  user_card_9s INT,
  user_card_10s INT,   
  user_card_js INT,
  user_card_qs INT,
  user_card_ks INT,

  user_card_ad INT,
  user_card_2d INT,
  user_card_3d INT,
  user_card_4d INT,
  user_card_5d INT,
  user_card_6d INT,
  user_card_7d INT,
  user_card_8d INT,
  user_card_9d INT,
  user_card_10d INT,   
  user_card_jd INT,
  user_card_qd INT,
  user_card_kd INT,

  FOREIGN KEY (user_card_ac) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10c) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_jc) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qc) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_kc) REFERENCES user_card(user_card_ID),
  
  FOREIGN KEY (user_card_ah) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10h) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_jh) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qh) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_kh) REFERENCES user_card(user_card_ID),
  
  FOREIGN KEY (user_card_as) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10s) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_js) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qs) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_ks) REFERENCES user_card(user_card_ID),
  
  FOREIGN KEY (user_card_ad) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_2d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_3d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_4d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_5d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_6d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_7d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_8d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_9d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_10d) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_jd) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_qd) REFERENCES user_card(user_card_ID),
  FOREIGN KEY (user_card_kd) REFERENCES user_card(user_card_ID)

);

-- adding foreign key to the progress user
ALTER TABLE user_progress
ADD CONSTRAINT fk_user_ID
FOREIGN KEY (user_ID) REFERENCES shuffle_users(user_ID);

-- session table
CREATE TABLE

-- session_results table
CREATE TABLE session_results (
  session_result_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  session_ID INT NOT NULL,
  user_ID INT NOT NULL,
  mem_spd DECIMAL(4, 2),
  rec_spd DECIMAL(4, 2),
  acc DECIMAL(6, 3),
  
  sess_card_ac INT,
  sess_card_2c INT,
  sess_card_3c INT,
  sess_card_4c INT,
  sess_card_5c INT,
  sess_card_6c INT,
  sess_card_7c INT,
  sess_card_8c INT,
  sess_card_9c INT,
  sess_card_10c INT,   
  sess_card_jc INT,
  sess_card_qc INT,
  sess_card_kc INT,

  sess_card_ah INT,
  sess_card_2h INT,
  sess_card_3h INT,
  sess_card_4h INT,
  sess_card_5h INT,
  sess_card_6h INT,
  sess_card_7h INT,
  sess_card_8h INT,
  sess_card_9h INT,
  sess_card_10h INT,   
  sess_card_jh INT,
  sess_card_qh INT,
  sess_card_kh INT,

  sess_card_as INT,
  sess_card_2s INT,
  sess_card_3s INT,
  sess_card_4s INT,
  sess_card_5s INT,
  sess_card_6s INT,
  sess_card_7s INT,
  sess_card_8s INT,
  sess_card_9s INT,
  sess_card_10s INT,   
  sess_card_js INT,
  sess_card_qs INT,
  sess_card_ks INT,

  sess_card_ad INT,
  sess_card_2d INT,
  sess_card_3d INT,
  sess_card_4d INT,
  sess_card_5d INT,
  sess_card_6d INT,
  sess_card_7d INT,
  sess_card_8d INT,
  sess_card_9d INT,
  sess_card_10d INT,   
  sess_card_jd INT,
  sess_card_qd INT,
  sess_card_kd INT,

  FOREIGN KEY (sess_card_ac) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_2c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_3c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_4c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_5c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_6c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_7c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_8c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_9c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_10c) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_jc) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_qc) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_kc) REFERENCES user_cards(user_card_ID),
  
  FOREIGN KEY (sess_card_ah) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_2h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_3h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_4h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_5h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_6h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_7h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_8h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_9h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_10h) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_jh) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_qh) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_kh) REFERENCES user_cards(user_card_ID),
  
  FOREIGN KEY (sess_card_as) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_2s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_3s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_4s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_5s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_6s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_7s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_8s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_9s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_10s) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_js) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_qs) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_ks) REFERENCES user_cards(user_card_ID),
  
  FOREIGN KEY (sess_card_ad) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_2d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_3d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_4d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_5d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_6d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_7d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_8d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_9d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_10d) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_jd) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_qd) REFERENCES user_cards(user_card_ID),
  FOREIGN KEY (sess_card_kd) REFERENCES user_cards(user_card_ID),

  FOREIGN KEY (session_ID) REFERENCES training_sessions(session_ID)

);

-- session_configurations table

CREATE TABLE session_configs (
  config_ID INT NOT NULL PRIMARY KEY,
  session_ID INT NOT NULL,
  user_ID INT NOT NULL,
  time_mode_ID INT NOT NULL,
  shuff_mode_ID INT NOT NULL,
  deck_no INT NOT NULL,
  card_no INT NOT NULL,
  session_decks TEXT,

  FOREIGN KEY (time_mode_ID) REFERENCES time_modes(time_mode_ID),
  FOREIGN KEY (shuff_mode_ID) REFERENCES shuff_modes(shuff_mode_ID),
  FOREIGN KEY (user_ID) REFERENCES shuffle_users(user_ID)
);

-- training_sessions
CREATE TABLE training_sessions(
  session_ID INT NOT NULL PRIMARY KEY,
  user_ID INT NOT NULL,
  config_ID INT NOT NULL,
  session_result_ID INT NOT NULL,
  time_stamp TIMESTAMP,

  FOREIGN KEY (user_ID) REFERENCES shuffle_users(user_ID),
  FOREIGN KEY (config_ID) REFERENCES session_configs(config_ID)
);


-- time_modes tables

CREATE TABLE time_modes(
  time_mode_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description TEXT
);

CREATE TABLE shuff_modes(
  shuff_mode_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  description TEXT
);


-- 