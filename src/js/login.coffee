FBLoginManager = {
  statusChangeCallback: statusChangeCallback = (response) ->
    if response.status == 'connected'
      console.log 'connected'
      $('[data-remodal-id=loginModal]').remodal().close()
      runApp()
    else if response.status == 'not_authorized'
      console.log 'not_authorized'
      $('[data-remodal-id=loginModal]').remodal().open()
    else
      console.log 'not_facebook_login'
      $('[data-remodal-id=loginModal]').remodal().open()

  checkLoginState: checkLoginState = () ->
    FB.getLoginStatus (response) ->
      statusChangeCallback response

  getFriendlist: getFriendlist = ()->
    console.log 'getFriendlist'
}

module.exports = FBLoginManager

React = require 'react'
Router = require 'react-router'
routes = require './routes'

runApp = () ->
  Router.run routes, Router.HistoryLocation, (Handler) ->
    React.render(<Handler/>, document.getElementById('content'))
