class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()



  compareScores: ->
    if @get('playerHand').score <= 21 and @get('playerHand').score > @get('dealerHand').score
      alert('You Win!')
    else if @get('playerHand').score is @get('dealerHand').score
      alert('Push!')
    else if @get('dealerHand').bust
      return
    else
      alert('You Lose!')

#compare cards you start with
#button to split
#make a new hand by popping from the original
#new hits only go to first hand until they lose or stand
  #repeat with 2nd hand