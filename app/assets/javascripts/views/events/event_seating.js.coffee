class Qwikstubs.Views.EventsSeating extends Backbone.View

  tagName: 'div'

  render: ->
    $(@el).attr('id', 'seating_canvas')
    @

  draw: ->
    console.log(model)
    stage = new Kinetic.Stage({
        container: 'seating_canvas'
        width: 578
        height: 200
      })
    shapesLayer = new Kinetic.Layer()
    
    circle = new Kinetic.Circle({
        x: 1
        y: 1
        radius: 5
        fill: 'red'
        stroke: 'black'
        strokeWidth: 2
      })
    shapesLayer.add(circle)

    stage.add(shapesLayer)   
 