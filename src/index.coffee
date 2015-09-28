#Plugin = require "kerplunk-base-plugin"
pkg = require '../package.json'

module.exports = (System) ->
  globals:
    public:
      loadingComponent: 'kerplunk-dashboard-skin:loading'
      layout:
        admin: 'kerplunk-dashboard-skin:layout'
      css:
        'kerplunk-dashboard-skin:layout': [
          'kerplunk-bootstrap/css/bootstrap.css'
          'kerplunk-dashboard-skin/css/AdminLTE.css'
          'kerplunk-dashboard-skin/css/font-awesome.css'
          'kerplunk-dashboard-skin/css/layout.css'
        ]
