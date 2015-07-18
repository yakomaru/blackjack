class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'add', => 
      if @collection.score >21
        @collection.bust = true;
    @render()

  blackjack: ->
    if @collection.score is 21 and !@collection.isDealer and @collection.models.length is 2
      alert("BLACKJACK! \n You win!")
  
  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()
    setTimeout((-> @blackjack()).bind(@), 0)


    #Aces
    #choose highest score as long as <21
    #if scores()[1] <21

