React = require 'react'

{DOM} = React

module.exports = React.createFactory React.createClass
  getInitialState: ->
    opacity: 0

  componentDidMount: ->
    setTimeout =>
      return unless @isMounted()
      @setState
        opacity: 1
    , 1

  componentWillUnmount: ->
    @setState
      opacity: 0

  render: ->
    DOM.section
      className: 'content'
      style:
        opacity: @state.opacity
        transition: 'all 1s'
    ,
      DOM.h3 null, 'Loading...'
