/**
 * 
 */
/*function collapseNavbar() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
}
*/
$(document).ready(function(){
    $(".button-collapse").sideNav();
    $('.carousel.carousel-slider').carousel({fullWidth: true});
    $(document).ready(function(){
      $('.parallax').parallax();
    });
});
/*$(window).scroll(collapseNavbar);*/
/*$(document).ready(collapseNavbar);*/