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

<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/resources/modern-business/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		
		for(var i=3; i<5; i++){
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