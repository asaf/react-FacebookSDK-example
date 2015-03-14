React                = require('react')
{Link, RouteHandler} = require('react-router')

Friendlist = React.createClass(
  loadFromserver: ->
    self = this
    FB.api "/me/friendlists", (response) ->
      if (response && !response.error)
          self.setState data: response.data

  getInitialState: ->
    return data: ''

  componentDidMount: ->
    this.loadFromserver()

  renderList: ->
    for d in @state.data
        friendlistLink = "https://www.facebook.com/lists/" + d.id
        (<div className="fList_obj" key={d.id}>
            <p className="fList_id">id: {d.id}</p>
            <h3 className="fList_name">name: <a href=friendlistLink target='new'>{d.name}</a></h3>
            <p className="fList_type">type: {d.list_type}</p>
          </div>
        )

  render: ->
    if @state.data == ''
      (<div className="fList">
          <h1>Now Loading...</h1>
        </div>
      )
    else
      (<div className="fList">
          {this.renderList()}
        </div>
      )
)

module.exports = Friendlist
