gulp  = require 'gulp'
shell = require 'gulp-shell'

gulp.task 'install', shell.task(
    [
      'bourbon install',
      'neat install',
      'bitters install'
    ],
    { cwd: './src/css/plugin/'}
  )
