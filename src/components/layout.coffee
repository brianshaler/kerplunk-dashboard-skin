_ = require 'lodash'
React = require 'react'

routeMatcher = require 'route-matcher'
routeMatcher = routeMatcher.routeMatcher if routeMatcher.routeMatcher

{DOM} = React

module.exports = React.createFactory React.createClass
  getInitialState: ->
    navActive: false

  componentWillReceiveProps: (newProps) ->
    if newProps.currentUrl != @props.currentUrl
      @setState
        navActive: false

  toggleNav: (e) ->
    e.preventDefault()
    @setState
      navActive: !@state.navActive

  render: ->
    getComponent = (componentPath) =>
      Component = @props.getComponent componentPath
      (obj) =>
        Component _.extend {}, @props, obj

    url = @props.currentUrl #window.location.pathname
    stylesheets = []
    for path, routes of @props.globals.public.styles
      if routeMatcher url, routes
        stylesheets.push path
    wrapperClasses = [
      'wrapper'
      'row-offcanvas'
      'row-offcanvas-left'
      'relative'
    ]
    if @state.navActive
      wrapperClasses.push 'active'

    Header = getComponent @props.globals.public.headerComponent
    Nav = getComponent @props.globals.public.navComponent
    Content = getComponent @props.contentComponent
    LoadingComponent = getComponent @props.globals.public.loadingComponent
    anyLoading = !!(_.find @props.components, (c) -> c == 'loading')

    DOM.div
      className: 'dashboard-container fixed skin-black'
    ,
      Header
        toggleNav: @toggleNav
      DOM.div
        className: wrapperClasses.join ' '
      ,
        DOM.div
          className: 'nav-container'
        ,
          Nav()
        DOM.aside
          className: 'right-side'
          style:
            display: ('none' if anyLoading)
        ,
          _.map (@props.globals.public.layout?.preContent ? []), (componentPath, key) =>
            Component = getComponent componentPath
            Component _.extend {}, @props, @state,
              key: "layout-precontent-#{key}"
          if anyLoading
            LoadingComponent()
          Content
            key: @props.currentUrl
      _.map stylesheets, (stylesheet) ->
        DOM.link
          rel: 'stylesheet'
          key: stylesheet
          href: "/plugins/#{stylesheet}"
        , ''
