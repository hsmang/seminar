<hr>

	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
		</div>
	</footer>

</div>
<!-- /.container -->

<script>
	$(document).ready(function(){
		var url = $(location).attr('pathname');
		var urlSplit = url.split("/");
		var wUrlSplit = urlSplit[1].split(".");
		//console.log(wUrlSplit[0]);
		//console.log($(location).attr('pathname'));
		
		if( wUrlSplit[0] == "seminar"){
			$('.navbar-nav >li:eq(2) > ul > li:eq(0)').addClass("active");
			$('.navbar-nav >li:eq(2)').addClass("active");
		}else if( wUrlSplit[0] == "businessAdmin" ){
			$('.navbar-nav >li:eq(2) > ul > li:eq(1)').addClass("active");
			$('.navbar-nav >li:eq(2)').addClass("active");
		}else if( wUrlSplit[0] == "businessStrategy" ){
			$('.navbar-nav >li:eq(2) > ul > li:eq(2)').addClass("active");
			$('.navbar-nav >li:eq(2)').addClass("active");
		}else if( wUrlSplit[0] == "businessSystem" ){
			$('.navbar-nav >li:eq(2) > ul > li:eq(3)').addClass("active");
			$('.navbar-nav >li:eq(2)').addClass("active");
		}else if( wUrlSplit[0] == "product" ){
			$('.navbar-nav >li:eq(3) > ul > li:eq(0)').addClass("active");
			$('.navbar-nav >li:eq(3)').addClass("active");
		}else if( wUrlSplit[0] == "contest" ){
			$('.navbar-nav >li:eq(3) > ul > li:eq(1)').addClass("active");
			$('.navbar-nav >li:eq(3)').addClass("active");
		}else if( wUrlSplit[0] == "tour" ){
			$('.navbar-nav >li:eq(3) > ul > li:eq(2)').addClass("active");
			$('.navbar-nav >li:eq(3)').addClass("active");
		}else if( wUrlSplit[0] == "album" ){
			$('.navbar-nav >li:eq(3) > ul > li:eq(3)').addClass("active");
			$('.navbar-nav >li:eq(3)').addClass("active");
		}
		
		for(var i=2; i<4; i++){
			for(var j=0; j<4; j++){
				if( $('.navbar-nav >li:eq('+i+') > ul > li > a:eq('+j+')').attr('href') == $(location).attr('pathname') ){
					$('.navbar-nav >li:eq('+i+') > ul > li:eq('+j+')').addClass("active");
					$('.navbar-nav >li:eq('+i+')').addClass("active");
				}
				if( $('.navbar-nav >li:eq('+j+') > a').attr('href') == $(location).attr('pathname') ){
					$('.navbar-nav >li:eq('+j+')').addClass("active");
				}
			}
		}
	});
</script>

</body>

</html>