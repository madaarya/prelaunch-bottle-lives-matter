//= require jquery
//= require jquery_ujs
//= require gritter
//= require mediaelement_rails

jQuery(function(){
  initMediaElement();
});

// initialize media element player
function initMediaElement() {
  jQuery('video,audio').mediaelementplayer({
    pluginPath: window.pathInfo ? pathInfo.base + pathInfo.js : 'js/'
  });
}
