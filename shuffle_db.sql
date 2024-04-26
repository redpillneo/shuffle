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
