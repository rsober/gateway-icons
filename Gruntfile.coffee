dotenv = require('dotenv')

module.exports = (grunt) ->
  # load environment
  dotenv.load()
  
  # load package JSON
  pkg = grunt.file.readJSON 'package.json'
  
  # initialize grunt
  grunt.initConfig
    pkg: pkg
    
    clean:
      dist: ['dist/*']
    
    svgmin:
      icons:
        options:
          removeViewBox: false
        files: [
          expand: true
          cwd: 'assets/icons/'
          src: ['*.svg']
          dest: 'tmp/icons/'
          ext: '.svg'
        ]

    webfont:
      iconfont:
        options:
          engine: 'node'
          embed: 'ttf,woff'
          syntax: 'bootstrap'
          stylesheet: 'scss'
          font: 'gateway'
          hashes: false
          templateOptions:
            baseClass: 'gateway-icon'
            classPrefix: 'gateway-'
            mixinPrefix: 'gateway-'
        src: ['tmp/icons/*.svg']
        dest: 'dist/'
  
  # load required grunt tasks
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-svgmin'
  grunt.loadNpmTasks 'grunt-webfont'
  
  # define custom tasks
  grunt.registerTask 'compile', [
    'svgmin:icons'
    'webfont'
  ]
  grunt.registerTask 'build', [
    'clean'
    'compile'
  ]