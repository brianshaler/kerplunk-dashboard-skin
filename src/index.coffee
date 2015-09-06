#Plugin = require "kerplunk-base-plugin"
pkg = require '../package.json'

module.exports = (System) ->
  globals:
    public:
      loadingComponent: 'kerplunk-dashboard-skin:loading'
      layout:
        admin: 'kerplunk-dashboard-skin:layout'
      styles:
        'kerplunk-dashboard-skin/css/AdminLTE.css': ['/admin/**', '/admin/']
        'kerplunk-dashboard-skin/css/font-awesome.css': ['/admin/**', '/admin/']
        'kerplunk-dashboard-skin/css/layout.css': ['/admin/**', '/admin/']
        #'kerplunk-dashboard-skin/css/ionicons.css': ['/admin/**', '/admin/']
