class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()


#if player > 21 = bust
#else if player = 21
#when player stands, do dealer stuff
  #dealer hits until >=17
    #if dealer >21, you win!
    #else, compare player to dealer score
      #if player>, alert you win!
      #if player<, alert you lose
      #if tie, alert push