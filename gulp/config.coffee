srcDir = 'src'
destDir = 'dest'
bowerDir = 'bower_components'

path =
  src:
    dir    : srcDir
    sass   : srcDir + '/css/app.sass'
    html   : srcDir + '/*.html'
    img    : srcDir + '/img/*'
    coffee : './' + srcDir + '/js/main.coffee'
  dest:
    dir    : destDir
    sass   : destDir + '/css'
    html   : destDir
    img    : destDir + '/img'
    coffee : destDir + '/js/'
  watch:
    sass   : srcDir + '/**/*.sass'
    scss   : srcDir + '/**/*.scss'
    coffee : srcDir + '/**/*.coffee'
    html   : srcDir + '/**/*.html'
    png    : srcDir + '/**/*.png'
    jpg    : srcDir + '/**/*.jpg'
    gif    : srcDir + '/**/*.gif'
  bower_src:
    jquery     : bowerDir + '/jquery/dist/jquery.min.*'
    remodal_js : bowerDir + '/remodal/dist/jquery.remodal.js'
    remodal_css: bowerDir + '/remodal/dist/jquery.remodal.css'
  bower_dest:
    jquery     : destDir + '/js/bower'
    remodal_js : destDir + '/js/bower'
    remodal_css: destDir + '/css/bower'

module.exports =
  path: path
