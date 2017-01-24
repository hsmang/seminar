<hr>

	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy;</p>
			</div>
		</div>
	</footer>

</div>
<!-- /.container -->



<script>
	$(document).ready(function(){
		
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