gulp           = require 'gulp'
browserify     = require 'browserify'
debowerify     = require 'debowerify'
coffeeReactify = require 'coffee-reactify'
source         = require 'vinyl-source-stream'
browserSync    = require 'browser-sync'
config         = require '../config'
paths          = config.path

gulp.task 'browserify', ->
  browserify (
    entries: ["#{paths.src.coffee}"]
    transform: [coffeeReactify, debowerify]
    debug: true
    cache: {}
    packageCache: {}
    fullPaths: true
    extensions: ['.coffee']
  )
  .bundle()
  .pipe source('app.js')
  .pipe(gulp.dest("#{paths.dest.coffee}"))
  .pipe browserSync.reload({stream:true});
