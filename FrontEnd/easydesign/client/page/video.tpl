<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
<!--    <link href="/js/lib/videojs/video-js.min.css" rel="stylesheet"> -->


</head>
<body>
 <video id="my-video" class="video-js" controls preload="none" width="750px" height="420px"
  poster="/images/production/common/video_design.jpg" data-setup="{}">
    <source src="/video/cpsj.mp4" type='video/mp4'>

    <p class="vjs-no-js">
      您的浏览器版本过低，为了顺利观看视频，请升级浏览器<br/ >
      <a href="/html/easysofthome/version.html" target="_blank">下载高版本浏览器</a>
    </p>
  </video>
  <script src="/js/seajs/sea-debug.js"></script>

  <script src="/js/seajs/seajs-css.js"></script>
  <script src="/js/rootConfig.js"></script>
  <script>
     seajs.use('/js/front/lib/videojs/video.min.js');
  </script>



</body></html>
