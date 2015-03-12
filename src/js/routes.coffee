React                 = require 'react'
{Route, DefaultRoute} = require 'react-router'
App                   = require './components/app'
Friendlist            = require './components/friendlist'

module.exports = (
  <Route name="app" path="/" handler={App}>
    <DefaultRoute handler={Friendlist} />
  </Route>
)
