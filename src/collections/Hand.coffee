class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  stand: ->
    #if stand is called
    #flip first card
    @models[0].flip();
      #while dealer score <17
    while @scores() < 17
        #flip cards from deck
      @hit()
        #send score to view
    @scores()  

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    @score = if @minScore() + 10 * @hasAce() <= 21
      @minScore() + 10 * @hasAce()
    else @minScore()  
###
if (minscore<=21)
  score = minscore+10*ace
else
  score = minscore
###
