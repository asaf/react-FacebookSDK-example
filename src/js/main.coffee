FBLoginManager = require "./login"

window.FBLoginManager = FBLoginManager

window.fbAsyncInit = ()->
  FB.init(
    appId      : 'your-app-id'
    cookie     : true
    xfbml      : true
    version    : 'v2.2'
  )

  FB.getLoginStatus (response) ->
    FBLoginManager.statusChangeCallback response

loadFacebookSDK = (d, s, id) ->
  fjs = d.getElementsByTagName(s)[0]
  if d.getElementById(id)
    return
  js = d.createElement(s)
  js.id = id
  js.src = "//connect.facebook.net/en_US/sdk.js"
  fjs.parentNode.insertBefore(js, fjs)

loadFacebookSDK(document, 'script', 'facebook-jssdk')
