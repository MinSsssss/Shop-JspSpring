<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	
	
	
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="logoutModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="logoutModalTitle">로그아웃</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<form action="/logout" id="logoutForm" method="post">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<button type="submit" class="btn btn-primary" id="logoutBtn">로그아웃</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					</form>	
				</div>
			</div>
		</div>
	</div>
	


    <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>
    
    <script src="/resources/admin/js/admin.js"></script>
    
	<script src="/resources/summernote/js/summernote-lite.js"></script>
	<script src="/resources/summernote/js/lang/summernote-ko-KR.js"></script>
    <!-- Page level plugins -->




</body>

</html>