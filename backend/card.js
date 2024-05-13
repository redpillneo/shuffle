// class for card

class Card {
  constructor(card_ID, card_name, value, suite){
    this.card_ID = card_ID;
    this.card_name = card_name;
    this.value = value;
    this.suite = suite;
  }
}
const c1 = new Card("c1", "ace of cloves", "ace", "cloves");
