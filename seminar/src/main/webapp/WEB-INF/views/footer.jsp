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
		
		for(var i=2; i<4; i++){
			for(var j=0; j<4; j++){
				console.log($(location).attr('pathname'));
				if( $(location).attr('pathname') == "/seminar/detail.do"  || 
						$(location).attr('pathname') == "/seminar/insert.do" || 
						$(location).attr('pathname') == "/seminar/update.do" ||
						$(location).attr('pathname') == "/seminar.do" ){
					$('.navbar-nav >li:eq(2) > ul > li:eq(0)').addClass("active");
					$('.navbar-nav >li:eq(2)').addClass("active");
				}else if( $(location).attr('pathname') == "/businessAdmin/detail.do"  || 
						$(location).attr('pathname') == "/businessAdmin/insert.do" || 
						$(location).attr('pathname') == "/businessAdmin/update.do" ||
						$(location).attr('pathname') == "/businessAdmin.do" ){
					$('.navbar-nav >li:eq(2) > ul > li:eq(1)').addClass("active");
					$('.navbar-nav >li:eq(2)').addClass("active");
				}else if( $(location).attr('pathname') == "/businessStrategy/detail.do"  || 
						$(location).attr('pathname') == "/businessStrategy/insert.do" || 
						$(location).attr('pathname') == "/businessStrategy/update.do" ||
						$(location).attr('pathname') == "/businessStrategy.do" ){
					$('.navbar-nav >li:eq(2) > ul > li:eq(2)').addClass("active");
					$('.navbar-nav >li:eq(2)').addClass("active");
				}else if( $(location).attr('pathname') == "/businessSystem/detail.do"  || 
						$(location).attr('pathname') == "/businessSystem/insert.do" || 
						$(location).attr('pathname') == "/businessSystem/update.do" ||
						$(location).attr('pathname') == "/businessSystem.do" ){
					$('.navbar-nav >li:eq(2) > ul > li:eq(3)').addClass("active");
					$('.navbar-nav >li:eq(2)').addClass("active");
				}
				
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