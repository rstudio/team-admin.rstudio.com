
# 


<div class="responsive-container-rmd">

  <div class="animated-r-wrapper">
  Loading...
    <div class="animated-r-vertical">
      <div class="animated-r-circle"></div>
    </div>
    <div class="animated-r-diagonal"></div>
  </div>

  <iframe id="survey-iframe"
    src="https://colorado.rstudio.com/rsc/team-admin-community/" 
    gesture="media"  
    allowfullscreen
    scrolling="yes"
  ></iframe>
</div>

<script type="text/javascript" src="/assets/js/iFrameResizer.min.js"></script>

<script>
(function() {
  // Remove contents of header 1
  document.getElementById("_1").style.display = "none"
  
  // pass query parameters into frame source
  var params = window.location.toString().split('?')[1];
  var iframe = document.getElementById('survey-iframe');
  iframe.src = iframe.src + '?' + params;

  // resize iframe
  iFrameResize({ checkOrigin: 'https://colorado.rstudio.com/' , log: true }, '#survey-iframe')

 })();
</script>
