/* global require, module */

var uglifyJavaScript = require('broccoli-uglify-js');
var compileES6 = require('broccoli-es6-concatenator');
var p = require('ember-cli/lib/preprocessors');
var pickFiles = require('broccoli-static-compiler');
var env = require('broccoli-env').getEnv();

var preprocessCss = p.preprocessCss;
var preprocessTemplates = p.preprocessTemplates;
var preprocessJs = p.preprocessJs;

module.exports = function (broccoli) {
  var app = 'app';
  var tests = 'tests';
  var publicFiles = 'public';
  var vendor = 'vendor';
  var config = 'config';
  var styles;

  app = pickFiles(app, {
    srcDir: '/',
    destDir: 'animation-demo/'
  });

  app = preprocessTemplates(app);

  config = pickFiles(config, {
    srcDir: '/',
    files: ['environment.*', 'environments/' + env + '.*'],
    destDir: 'animation-demo/config'
  });

  tests = pickFiles(tests, {
    srcDir: '/',
    destDir: 'animation-demo/tests'
  });

  tests = preprocessTemplates(tests);

  var sourceTrees = [
    app,
    config,
    vendor
  ];

  if (env !== 'production') {
    //sourceTrees.push(tests);
  }

  sourceTrees = sourceTrees.concat(broccoli.bowerTrees());

  var appAndDependencies = new broccoli.MergedTree(sourceTrees);

  appAndDependencies = preprocessJs(appAndDependencies, '/', 'animation-demo');

  var applicationJs = compileES6(appAndDependencies, {
    loaderFile: 'loader.js',
    ignoredModules: [
      'ember/resolver'
    ],
    inputFiles: [
      'animation-demo/**/*.js'
    ],
    legacyFilesToAppend: [
      'animation-demo/config/environment.js',
      'animation-demo/config/environments/' + env + '.js',
      'jquery.js',
      'handlebars.js',
      'ember.js',
      'ic-ajax/main.js',
      'ember-data.js',
      'ember-resolver.js',
      'moment/moment.js'
    ],

    wrapInEval: env !== 'production',
    outputFile: '/assets/app.js'
  });

  styles = preprocessCss(sourceTrees, 'animation-demo/styles', '/assets');

  if (env === 'production') {
    applicationJs = uglifyJavaScript(applicationJs, {
      mangle: false,
      compress: false
    });
  }

  return [
    applicationJs,
    publicFiles,
    styles
  ];
};
