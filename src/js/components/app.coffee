React                = require('react')
{Link, RouteHandler} = require('react-router')

App = React.createClass(
  componentDidMount: ->
    $('#logout').click ->
      FB.logout (response) ->
        console.log 'Logout!'
        $('[data-remodal-id=loginModal]').remodal().open()
        
  render: ->
    return (
      <div>
        <nav className="nav">
        <h1 className="nav_title"><Link to="app" className="nav_titleLink">AcquaintanceManager</Link></h1>
        <button id="logout" className="nav_button">Logout</button>
        </nav>
        <RouteHandler {...this.props} />
      </div>
    )
)

module.exports = App
