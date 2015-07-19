class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<p><%= rankName %> of <%= suitName %></p>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

