$(document).ready(function(){

	/* Change the stylesheet of the website by the day of the week. */
	var d = new Date(), weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	
	function everyOtherDayTheme() {
	// Monday, Wednesday & Friday
	if(weekday[d.getDay()] == "Monday" || weekday[d.getDay()] == "Wednesday" || weekday[d.getDay()] == "Friday") {
		document.getElementById("mainsheet").setAttribute('href', "../css/first.css");
		}
	// Sunday, Tuesday, Thursday & Saturday
	else {
		document.getElementById("mainsheet").setAttribute('href', "../css/second.css");
		}
	}

	/* Make the navigation bar at a fixed position when scrolling down the page. */
	var navy = $(".navbar");

	function fixedScrollBar() {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 75) {
				navy.addClass("f-nav");
			}
			else {
				navy.removeClass("f-nav");
			}
		});
	}
	
	/* Highlight the items in the navigation menu that pertains to the focus on the page. */
	
	var nav0 = $("#nav0");
	var nav1 = $("#nav1");
	var nav2 = $("#nav2");
	var nav3 = $("#nav3");
	var sec0 = $("#section0");
	var sec1 = $("#section1");
	var sec2 = $("#section2");
	var sec3 = $("#section3");
		
	function activeScrollPage() {	
		$(window).scroll(function () {
			var st = $(this).scrollTop();
			
			if (st >= 0 && st < 500) {
				nav0.addClass("activeNav");
				sec0.css({ 'opacity': 1 });
			}
			else {
				nav0.removeClass("activeNav");
				sec0.css({ 'opacity': 0 });
			}
			if (st >= 500 && st < 1000) {
				nav1.addClass("activeNav");
				sec1.css({ 'opacity': 1 });
			}
			else {
				nav1.removeClass("activeNav");
				sec1.css({ 'opacity': 0 });
			}
			if (st >= 1000 && st < 1250) {
				nav2.addClass("activeNav");
				sec2.css({ 'opacity': 1 });
			}
			else {
				nav2.removeClass("activeNav");
				sec2.css({ 'opacity': 0 });
			}
			if (st >= 1250 && st < 2000) {
				nav3.addClass("activeNav");
				sec3.css({ 'opacity': 1 });
			}
			else {
				nav3.removeClass("activeNav");
				sec3.css({ 'opacity': 0 });
			}
		});
		
		/* Delay the clicks of links by 0.5 secs */
		$('a').click(function(){
    		$('html, body').animate({
        	scrollTop: $( $(this).attr('href') ).offset().top
    		}, 500);
    	return false;
				});
			}
		
	/* Call the functions. */
	everyOtherDayTheme();
	fixedScrollBar();
	activeScrollPage();
	
});
/*
http://tri.be/ (increase opacity as scoll down)
*/