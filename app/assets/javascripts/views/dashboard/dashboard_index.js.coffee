class Qwikstubs.Views.DashboardIndex extends Backbone.View

  template: JST['dashboard/dashboard_index']

  initialize: ->
    @collection.on('reset' , @render, @ )
    @collection.on('add' , @appendEventMiniProfile, @ )

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEventMiniProfile)
    @

  events:
    'submit #new_user' : 'createUser'

  appendEventMiniProfile: (event) ->
    view = new Qwikstubs.Views.DashboardEventMiniProfile(model: event)
    $('#EventMiniProfiles').append(view.render().el)


  createUser: (new_user) ->
    new_user.preventDefault()
    users = new Qwikstubs.Collections.Users()
    users.create
      email: $('#new_user_email').val()
      password: $('#new_user_password').val()
      password_conf: $('#new_user_password_conf').val()
    $('#new_user')[0].reset()
      