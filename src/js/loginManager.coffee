FBLoginManager = {
  statusChangeCallback: statusChangeCallback = (response) ->
    console.log 'statusChangeCallback'
    if response.status == 'connected'
      $('[data-remodal-id=loginModal]').remodal().close()
      getFriendlist()
    else if response.status == 'not_authorized'
      console.log 'not_authorized'
      $('[data-remodal-id=loginModal]').remodal().open()
    else
      console.log 'not_facebook_login'
      $('[data-remodal-id=loginModal]').remodal().open()

  # Scope is not working with API
  # login: login = () ->
  #   FB.login( ((response)->
  #     if response.authResponse
  #       $('[data-remodal-id=loginModal]').remodal().close()
  #       FBLoginManager.checkLoginState()
  #     else
  #       console.log 'User cancelled login or did not fully authorize.'
  #   ), {scope: 'user_friends', 'user_likes', 'user_about_me', 'read_friendlists'})

  checkLoginState: checkLoginState = () ->
    FB.getLoginStatus( (response) ->
      statusChangeCallback response
    )

  getFriendlist: getFriendlist = ()->
    console.log 'getFriendlist'

    FB.api("/me/friendlists", (response) ->
      if (response && !response.error)
        console.log(response.data)
        for flData, i in response.data
          flId = '<p class="fList_id">id: ' +  flData.id + '</p>'
          flName = '<h3 class="fList_name">name: ' +  flData.name + '</h3>'
          flType = '<p class="fList_type">type: ' + flData.list_type + '</p>'
          flObj = '<div class="fList_obj">' + flId + flName + flType + '</div>'
          document.getElementById('friends').insertAdjacentHTML( 'beforeend', flObj)
    )
}
module.exports = FBLoginManager
