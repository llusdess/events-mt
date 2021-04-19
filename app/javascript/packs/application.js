// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require.context("../images", true)

// Javascripts
import "controllers"

// Stylesheets
import "stylesheets/application"

// FontAwesome 5 Pro
import "font-awesome-pro/js/all"
FontAwesome.config.mutateApproach = 'sync'

// Toastr Setup
global.toastr = require("toastr")
toastr.options = {
  "closeButton": true,
  "progressBar": true
}