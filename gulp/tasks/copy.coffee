gulp        = require 'gulp'
browserSync = require 'browser-sync'
config      = require '../config'
paths        = config.path

gulp.task 'copy', ['imagemin'], ->
  gulp
    .src [ "#{paths.src.html}" ], { base: "#{paths.src.dir}" }
    .pipe gulp.dest( "#{paths.dest.dir}" )
    .pipe browserSync.reload({stream:true})

gulp.task 'copy_bower', ->
  gulp
    .src("#{paths.bower_src.jquery}")
    .pipe gulp.dest( "#{paths.bower_dest.jquery}" )
  gulp
    .src("#{paths.bower_src.remodal_js}")
    .pipe gulp.dest( "#{paths.bower_dest.remodal_js}" )
  gulp
    .src("#{paths.bower_src.remodal_css}")
    .pipe gulp.dest( "#{paths.bower_dest.remodal_css}" )
