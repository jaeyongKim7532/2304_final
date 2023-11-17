<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js
" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<style>
.fileSelctBox {
    margin-top: 0.25rem !important;
    margin-right: 0.5em !important;
}
</style>
<c:if test="${ not empty folderDup }">
<script>
	alert('${folderDup }');
</script>
</c:if>

<c:if test="${ not empty fileDup }">
<script>
	alert('${fileDup }');
</script>
</c:if>

<c:if test="${ not empty deleteMessage }">
<script>
	alert('${deleteMessage }');
</script>
</c:if>

<!-- <div class="email-container"> -->

<!-- 	<div class="row"> -->
<!-- 		<div class="col-8"> -->
<sec:authentication property="principal.emp" var="emp"/>
<h2>즐겨찾는자료</h2>
<span style="font-weight: bolder;">${emp.empName }님이 <span style="color: blue;">즐겨찾는 자료실</span>입니다.</span>			
<!-- 		</div> -->
<!-- 	</div> -->
	
<!-- 	</div> -->
	<div
		class="row gx-lg-6 gx-3 z-index-2 position-sticky bg-soft email-header">
<!-- 		<div class="col-auto d-lg-none"> -->
<!-- 			<a class="btn btn-primary px-3 px-sm-4" -->
<!-- 				href="../../apps/email/compose.html"> <span -->
<!-- 				class="d-none d-sm-inline-block">Compose</span><span -->
<!-- 				class="d-sm-none fas fa-plus"></span></a> -->
<!-- 		</div> -->
		
	<div class="card mt-7" style="padding: 40px; padding-left: 130px; padding-right: 150px;">	
		<div class="d-flex justify-content-center">
			<div class="search-box" style="width: 500px;">
				<form class="position-relative" data-bs-toggle="search"
					data-bs-display="static">
					<input class="form-control search-input search" type="text"
						placeholder="Search ..." aria-label="Search" id="searchBar"/> <span
						class="fas fa-search search-box-icon"></span>
				</form>
			</div>
		</div>
		
<!-- 		<div class="row"> -->
<!-- 		<div class="col-8"></div> -->
			<div class="d-felx text-end">
				<input id="fileInput" type="file" style="display:none"/>
				<button class="uil-folder-plus btn btn-info me-1 mb-1 fade" type="button" id="resFolderBtn">&nbsp;&nbsp;폴더생성&nbsp;&nbsp;</button>
				<button class="uil-file-upload btn btn-outline-info me-1 mb-1 fade" type="button" id="resFileBtn">파일업로드</button>
			</div>
<!-- 		</div> -->
<!-- 	</div> -->
	
		<div class="d-flex justify-content-end">
			<button class="uil-arrow-down btn btn-link fs-0" type="button" id="basicSort">기본순</button>
			<form action="/showImpFilesDate.do" method="POST" id="folderFileDateForm">
				<button class="uil-arrow-up btn btn-link fs-0" type="button" id="DateSort">최신순</button>
				<input type="hidden" value="${parentCd.folderCd }" name="folderParent">
			</form>
		</div>
		
	<div class="row mb-8">
		<div class="col-lg-auto">
			<div class="phoenix-offcanvas-backdrop d-lg-none"
				data-phoenix-backdrop="data-phoenix-backdrop" style="top: 0;"></div>
		</div>
		<div class="col-lg ">
			<div class="px-lg-1">
<!-- 				<div class="d-flex align-items-center flex-wrap position-sticky pb-2 z-index-2 email-toolbar inbox-toolbar"> -->
<!-- 					<div class="d-flex align-items-center flex-1 me-2"></div> -->
<!-- 					<div class="d-flex"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="border-top border-200 py-2 d-flex justify-content-between align-items-center"> -->
<!-- 					<div class="form-check fw-bold"> -->
<!-- 						<input class="form-check-input" type="checkbox" -->
<!-- 							data-bulk-select-row="data-bulk-select-row" id="allCheckBox" /> -->
<!-- 						<div class="ms-5"> -->
<!-- 							<button class="btn p-0 me-2 text-500 hover-text-600" -->
<!-- 								data-bs-toggle="tooltip" data-bs-placement="top" -->
<!-- 								data-bs-title="다운로드" id="folderFileBtn"> -->
<!-- 								<span class="uil uil-download-alt fs-1 fw-bold"></span> -->
<!-- 							</button> -->
<!-- 							<button class="btn p-0 text-500 hover-text-600" -->
<!-- 								data-bs-toggle="tooltip" data-bs-placement="top" -->
<!-- 								data-bs-title="삭제" id="deleteFileBtn"> -->
<!-- 								<span class="uil uil-trash fs-1 fw-bold"></span> -->
<!-- 							</button> -->
<!-- 							<span class="col-3"></span> -->
<!-- 							<span class="col-3">파일크기</span> -->
<!-- 							<span class="col-2">업로드 날짜</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->


				<div class="border-top border-200 py-2 fw-bold">
					<div class="col-auto">
						<div class="form-check d-flex flex-column flex-sm-row justify-align-center">
							<input class="form-check-input" type="checkbox"	
									data-bulk-select-row="data-bulk-select-row" id="allCheckBox"/>
								<div class="ms-5 col-auto">
									<button class="btn p-0 me-2 text-500 hover-text-600"
										data-bs-toggle="tooltip" data-bs-placement="top"
										data-bs-title="다운로드" id="folderFileBtn">
										<span class="uil uil-download-alt fs-1 fw-bold"></span>
									</button>
<!-- 									<button class="btn p-0 text-500 hover-text-600" -->
<!-- 										data-bs-toggle="tooltip" data-bs-placement="top" -->
<!-- 										data-bs-title="삭제" id="deleteFileBtn"> -->
<!-- 										<span class="uil uil-trash fs-1 fw-bold"></span> -->
<!-- 									</button> -->
								</div>
								<div class="col-auto"></div>
								<div class="col-6"></div>
								<div class="col-2 text-end">파일크기</div>
								<div class="col-3 text-end">업로드 날짜</div>
						</div>
					</div>
				</div>
				
				<div class="border-top border-200 hover-actions-trigger py-3" id="folderFileDiv">
					<!-- 폴더위치 -->
					<c:forEach var="folder" items="${FolderList }">
					<form action="/indfiles.do" method="POST" id="${folder.folderName }">
					<input type="hidden" value="${folder.folderCd }" name="folderCd">
					<input type="hidden" value="${folder.folderSe }" name="folderSe">
					<input type="hidden" value="${folder.empNo }" name="empNo">
					<input type="hidden" value="${folder.folderName }" name="folderName">
					<input type="hidden" value="${folder.folderParent }" name="folderParent">
					<input type="hidden" value="${folder.folderDelse }" name="folderDelse">			
					<div class="row align-items-sm-center gx-2">
						<div class="col-auto">
							<div class="d-flex flex-column flex-sm-row">
								<input class="form-check-input mb-2 m-sm-0 me-sm-2 folderSelectBox"
									type="checkbox" id="checkbox-1" data-value="${folder.folderCd }"
									data-bulk-select-row="data-bulk-select-row" value="${folder.folderName }"/>
								<button class="btn p-0">
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</button>
							</div>
						</div>
						<div class="col-auto">
							<div class="avatar avatar-s rounded-circle">
								<span class="uil uil-folder fs-1"></span>
							</div>
						</div>
						<div class="col-6">
							<a class="text-1100 inbox-link folderSelect" id="${folder.folderName }" style="cursor:pointer">${folder.folderName }</a>
						</div>
					</div>
					<hr/>
					</form>
					</c:forEach>


					<!--  파일위치  -->
					<c:forEach var="file" items="${fileList }">
					<div class="oneFile">
					<input type="hidden" value="${file.fileCd }" id="${file.fileCd }">
					<div class="row align-items-sm-center gx-2">
						<div class="col-auto">
							<div class="d-flex flex-column flex-sm-row justify-align-center">
								<input class="form-check-input mb-2 m-sm-0 me-sm-2 fileSelctBox"
									type="checkbox" id="checkbox-1" data-value="${file.fileCd }"
									data-bulk-select-row="data-bulk-select-row"/>
								<div id="">
									<button class="btn p-0 fileLike" type="button" style="transform: scale(1);" data-value="${file.fileCd }" style="cursor:pointer">
										<c:if test="${file.fileLikese eq 1 }">
							      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star text-warning" viewBox="0 0 16 16">
					  						<path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
										</svg>
						      			</c:if>
						      			<c:if test="${file.fileLikese eq 2 }">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill text-warning" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
						      			</c:if>
<%-- 										<span class="<c:if test="${file.fileLikese eq 2 }">text-warning</c:if> fas fa-star fileLike fs-0" data-value="${file.fileCd }" style="cursor:pointer"></span> --%>
									</button>
								</div>
							</div>
						</div>
						<div class="col-auto">
							<div class="avatar avatar-s rounded-circle">
								<span class="uil uil-file fs-1"></span>
							</div>
						</div>
						<div class="col-6">
							<span class="text-1100 inbox-link fileSelect" data-value="${file.fileCd }" style="cursor:pointer">${file.fileOrgname }.${file.fileType }</span>
						</div>
						<div class="col-2 text-end">
							<span>${file.fileSize }KB</span>
						</div>
						<fmt:formatDate value="${file.fileUploaddt }" var="fileUploaddt" pattern="yyyy-MM-dd HH:mm"/>
						<div class="col-3 text-end">
							<span>${fileUploaddt }</span>
						</div>
					</div>
					<hr/>
					</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
	
<!-- 폴더이름을 저장할 모달. -->
<form action="/InsertIndFileFolder.do" method="POST" id="folderNameForm">
<div class="modal fade" id="folderModal" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">아이웍스</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-700 lh-lg mb-0 pb-2 px-1">원하시는 폴더명을 입력하세요</p>
        <div>
        	<input class="form-control" id="folderName" placeholder="폴더명 입력" name="folderName"/>
        </div>
      </div>
      <div class="modal-footer"><button class="btn btn-info" type="button" id="modalOkayBtn">확인</button>
      <button class="btn btn-outline-info" type="button" data-bs-dismiss="modal" id="modalCancleBtn">취소</button></div>
    </div>
  </div>
</div>

<c:if test="${not empty parentCd }">
	<input type="hidden" value="${parentCd.folderCd }" name="folderParent">
</c:if>
</form>

<!-- 파일 넘기기 -->
<form action="/insertIndFileFile.do" method="POST" id="fileNameForm" enctype="multipart/form-data">
<div class="modal fade" id="fileModal" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">아이웍스</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body">
        <p class="text-700 lh-lg mb-0 pb-2 px-1">첨부할 파일을 선택해주세요</p>
        <div class="mb-3">
  			<input class="form-control form-control-sm" id="customFileSm" type="file" name="foFile" multiple="multiple"/>
		</div>
      </div>
      <div class="modal-footer"><button class="btn btn-info" type="button" data-bs-dismiss="modal" id="modalFileOkayBtn">확인</button>
      <button class="btn btn-outline-info" type="button" data-bs-dismiss="modal" id="modalFileCancleBtn">취소</button></div>
    </div>
  </div>
</div>

<!-- 미리보기를 띄워줄 모달 -->
<div class="modal fade" id="showPictureModal" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">이미지 미리보기</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body d-flex justify-content-center align-items-center">
        <div class="mb-3 imgDiv" id="imgDiv">
  			
		</div>
      </div>
      <div class="modal-footer">
      <button class="btn btn-info downloadFileBtn" type="button" id="downloadFileBtn">다운로드</button>
      <button class="btn btn-outline-info" type="button" data-bs-dismiss="modal" id="modalFileCancleBtn">취소</button></div>
    </div>
  </div>
</div>


<!-- 파일형식의 미리보기 href로 태그로 문서자체를 보여준다 -->
<div class="modal fade" id="showFileModal" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">파일 미리보기</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body d-flex justify-content-center align-items-center">
        <div class="mb-3 imgDiv" id="imgDiv">
        	
		</div>
      </div>
      <div class="modal-footer">
      <button class="btn btn-info downloadFileBtn" type="button" id="downloadFileBtn">다운로드</button>
      <button class="btn btn-outline-info" type="button" data-bs-dismiss="modal" id="modalFileCancleBtn">취소</button></div>
    </div>
  </div>
</div>


<!-- 미리보기도안되고, href로도 안되는 애들 -->
<div class="modal fade" id="noShowFileModal" tabindex="-1" aria-labelledby="verticallyCenteredModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="verticallyCenteredModalLabel">파일 미리보기</h5><button class="btn p-1" type="button" data-bs-dismiss="modal" aria-label="Close"><span class="fas fa-times fs--1"></span></button>
      </div>
      <div class="modal-body d-flex justify-content-center align-items-center">
        <div class="mb-3" id="imgDiv">
        	<span>해당파일은 미리보기가 불가능합니다.</span>
		</div>
      </div>
      <div class="modal-footer">
      <button class="btn btn-info downloadFileBtn" type="button" id="downloadFileBtn">다운로드</button>
      <button class="btn btn-outline-info" type="button" data-bs-dismiss="modal" id="modalFileCancleBtn">취소</button></div>
    </div>
  </div>
</div>


<c:if test="${not empty parentCd }">
	<input type="hidden" value="${parentCd.folderCd }" name="folderParent">
</c:if>
</form>
<!-- 체크박스 선택된 애들의 알집 다운로드 -->
<form action="fileAlzip.do" method="POST" id="selectBoxForm">
	<input type="hidden" value="" name="folderArray" class="folderSelectArray"/>
	<input type="hidden" value="" name="fileArray" class="fileSelectArray"/>
</form>

<!-- 체크박스 선택된 애들의 삭제 폼 -->
<form action="/impSelectUnlike.do" method="POST" id="selectBoxDelForm">
	<input type="hidden" value="" name="folderArray" class="folderSelectArray"/>
	<input type="hidden" value="" name="fileArray" class="fileSelectArray"/>
	<input type="hidden" value="${parentCd.folderCd }" name="folderParent" id="folderParent">
</form>

<input type="hidden" value="true" id="checkFlag" />

<script>
$(function(){
	
// 	$(document).on("click","#test",function(){
// 	})
	var resFolderBtn = $('#resFolderBtn');
	var resFileBtn = $('#resFileBtn');
	var folderModal = $('#folderModal');
	var fileModal = $('#fileModal');
	var folderName = $('#folderName');
	var modalOkayBtn = $('#modalOkayBtn');
	var modalCancleBtn = $('#modalCancleBtn');
	var folderNameForm = $('#folderNameForm');	
	var folderSelect = $('.folderSelect');
	var fileSelect = $('.fileSelect');
	var modalFileOkayBtn = $('#modalFileOkayBtn');
	var fileNameForm = $('#fileNameForm');
	var reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
	var blank_pattern = /[\s]/g;
	var fileCd = $('#fileCd');

	
	$(document).on("click","#basicSort",function(){
// 	basicSort.on('click', function(){
		 location.href="/impfiles.do";
	});
	
	$(document).on("click","#DateSort",function(){
// 	DateSort.on('click'. function({
		$('#folderFileDateForm').submit();
	});
	
	var searchBar = $('#searchBar');
	var folderFileDiv = $('#folderFileDiv');
	
	$(document).on("keyup","#searchBar",function(){
// 	searchBar.on('keyup', function(){
		var searchText = searchBar.val();
		var folderParent = $("#folderParent").val();
		console.log(searchText);
		var str = "";
		var searchData = {
				"searchText" : searchText,
				"folderParent" : folderParent
		}
		 $.ajax({
			type : "POST",
			url : "/impSearchAjax.do",
			data : JSON.stringify(searchData),
			contentType : "application/json; charset=utf-8",
			success:function(result) {
				console.log('에이잭스 결과값 반환되었음.')
				folderFileDiv.html('');
				result.fileList.forEach(function(item){
					console.log('에이잭스 : '+item.fileLikese);
					str +='<input type="hidden" value="'+item.fileCd+'" id="'+item.fileCd+'">';
					str +='<div class="row align-items-sm-center gx-2">';
					str +='<div class="col-auto">';
					str +='<div class="d-flex flex-column flex-sm-row justify-align-center">';
					str +='<input class="form-check-input mb-2 m-sm-0 me-sm-2 fileSelctBox"';
					str +='type="checkbox" id="checkbox-1" data-value="'+item.fileCd+'"';
					str +='data-bulk-select-row="data-bulk-select-row"/>';
					str +='<div id="">';
					str +='<span class="';
					if(item.fileLikese == 2){
					str +='text-warning';	
						}
					str +=' fas fa-star fileLike fs-0" data-value="'+item.fileCd+'" style="cursor:pointer"></span>';
					str +='</div>';
					str +='</div>';
					str +='</div>';
					str +='<div class="col-auto">';
					str +='<div class="avatar avatar-s  rounded-circle">';
					str +='<span class="uil uil-file fs-1"></span>';
					str +='</div>';
					str +='</div>';
					str +='<div class="col-auto">';
					str +='<span class="text-1100 inbox-link fileSelect" data-value="'+item.fileCd+'" style="cursor:pointer">'+item.fileOrgname+'.'+item.fileType+'</span>';
					str +='</div>';
					str +='</div>';
					str +='<hr/>';
				})
				folderFileDiv.html(str);
			}
		 });
	});
	
	var fileLike = $('.fileLike');
	
	var submitFileCd = "";
	
	// 별모양 버튼을 눌렀을때 좋아요를 수정해줄 ajax문
	$(document).on("click",".fileLike",function(i,e){
// 	fileLike.on('click', function(){
		var str="";
		console.log($(this).data('value'));
		// 돔요소 자체를 가져올 예정이므로 제이쿼리 선택자가 아닌 돔선택자를 사용.
		var starIcon = this;
// 		folderFileDiv.html('');
		console.log(this);
		console.log(starIcon);
		var fileCd = $(this).data('value');
		var fileCd = {
				"fileCd" : fileCd
		}
		$.ajax({
			type : "POST",
			url : "impUpdateLikeSeAjax.do",
			data : JSON.stringify(fileCd),
			contentType : "application/json; charset=utf-8",
			success : function(result){
				// 반환값으로 vo를 가져와서 그안에 fileLikese에 따라 class를 변경해준다.
				// 클래스내용을 변경할땐 classList.remove('내용'); 혹은 classList.add('내용'); 을 사용한다.
				if(result.fileLike.fileLikese == 1) {
					console.log(starIcon);
					console.log('1일떄');
					starIcon.classList.remove('text-warning');
				} else if (result.fileLike.fileLikese == 2) {
					console.log(starIcon);
					console.log('2일떄');
					starIcon.classList.add('text-warning');
				}
				result.folderFileLike.forEach(function(item){
					console.log('에이잭스 : '+item.fileLikese);
					console.log(typeof item.fileLikese);
					console.log(item.fileLikese == 2);
					str +='<input type="hidden" value="'+item.fileCd+'" id="'+item.fileCd+'">';
					str +='<div class="row align-items-sm-center gx-2">';
					str +='<div class="col-auto">';
					str +='<div class="d-flex flex-column flex-sm-row justify-align-center">';
					str +='<input class="form-check-input mb-2 m-sm-0 me-sm-2 fileSelctBox"';
					str +='type="checkbox" id="checkbox-1" data-value="'+item.fileCd+'"';
					str +='data-bulk-select-row="data-bulk-select-row"/>';
					str +='<div id="">';
					str +='<span class="';
					if(item.fileLikese == 2){
					str +='text-warning';	
						}
					str +=' fas fa-star fileLike fs-0" data-value="'+item.fileCd+'" style="cursor:pointer"></span>';
					str +='</div>';
					str +='</div>';
					str +='</div>';
					str +='<div class="col-auto">';
					str +='<div class="avatar avatar-s  rounded-circle">';
					str +='<span class="uil uil-file fs-1"></span>';
					str +='</div>';
					str +='</div>';
					str +='<div class="col-auto">';
					str +='<span class="text-1100 inbox-link fileSelect" data-value="'+item.fileCd+'" style="cursor:pointer">'+item.fileOrgname+'.'+item.fileType+'</span>';
					str +='</div>';
					str +='</div>';
					str +='<hr/>';
				})
				folderFileDiv.html(str);
				console.log("e :::: ",e);
				$(starIcon).closest("div.oneFile").remove();
			}
		})
	});
	
	var allCheckBox = $('#allCheckBox');
	var checkBoxFlag = true;
	
	var folderSelectBox = $('.folderSelectBox');
	var fileSelctBox = $('.fileSelctBox');
	
	// 전체체크박스 처리
	$(document).on("click",'#allCheckBox',function(){
// 	allCheckBox.on('change', function() {
		  if ($('#checkFlag').val() == "true") {
		    console.log("트루");
		    $('.folderSelectBox').prop('checked', true);
		    $('.fileSelctBox').prop('checked', true);
		    $('#checkFlag').val('false');
		    fileSelctBox.prop('checked', true);
// 		    checkBoxFlag = false;
		  } else {
		    console.log("펄스");
		    $('.folderSelectBox').prop('checked', false);
		    $('#checkFlag').val('true');
		    $('.fileSelctBox').prop('checked', false);
// 		    fileSelctBox.prop('checked', true);
// 		    checkBoxFlag = true;
		  }
		});
	
	
	var folderFileBtn = $('#folderFileBtn');
	
	
	// 셀렉트박스로 클릭된 애들을 압축파일로 압축하도록 넘기는 로직.
	$(document).on("click",'#folderFileBtn',function(){
// 	folderFileBtn.on('click', function(){
		console.log('dd');
		var folderList = [];
		var fileList = [];
		var folderSelectArray = $('.folderSelectArray');
		var fileSelectArray = $('.fileSelectArray');
		var selectBoxForm = $('#selectBoxForm');
		
		// 체크박스 체크된 폴더코드 어레이에 넣기.
		$('.folderSelectBox').each(function () {
// 		folderSelectBox.each(function () {
	        if($(this).is(":checked")==true){
	            console.log($(this).data('value'));
	            folderList.push($(this).data('value'));
	        }
	    })
	    console.log(folderList);

		// 체크박스 체크된 파일코드 어레이에 넣기.
		$('.fileSelctBox').each(function () {
// 		fileSelctBox.each(function () {
	        if($(this).is(":checked")==true){
	            console.log($(this).data('value'));
	            fileList.push($(this).data('value'));
	        }
	    })
	    console.log(fileList)
	    
	    console.log('랭쓰 : '+folderList.length);
	    console.log('랭쓰2 : '+fileList.length);
	    if(folderList.length == 0 && fileList.length == 0) {
	    	alert('폴더나 파일을 선택해주세요');
	    	return false;
	    }
	    
	    if(folderList != null) {
	    	folderSelectArray.val(folderList);
	    }
		if(fileList != null) {
			fileSelectArray.val(fileList);
		}
		customConfirm('해당 폴더 및 파일을 압축파일로 다운로드 하시겠습니까?').then((userConfirmed) => {
	          if (userConfirmed) {
	        	  selectBoxForm.submit();
	          } else {
	        	  return false;
	          }
		})
	})
	
	
	var showPictureModal = $('#showPictureModal');
	var showFileModal = $('#showFileModal');
	var noShowFileModal = $('#noShowFileModal');
	
	$(document).on("click",'.fileSelect',function(){
// 	fileSelect.on('click', function(){
		// 이미지를 넣어줄 Div공간을 미리 선택자로 변수선언.
		var imgDiv = $('.imgDiv');
		var images = ["jpg","jpeg","jfif","gif","png"]
		var canViewFile = ["pdf"]
		console.log($(this).data('value'));
		// 사진파일을 다운로드할 수 있게 해주는 로직
		// 정확히는 다운로드가 아니고 전역변수에 value값을 미리 저장해준다.
		submitFileCd = $(this).data('value');
		console.log(submitFileCd);
		// 선택자로 변수에 넣은 submitFileCd값을 보내줄 변수
		var fileItem = {
				"submitFileCd" : submitFileCd
		}
		contentType : "application/json; charset=utf-8",
		
		$.ajax({
			type : "POST",
			url : "imageFileInfoAjax.do",
			data : JSON.stringify(fileItem),
			// 컨텐트타입엔 제이슨을 선언해주고, utf-8인코딩 형식을 선언.
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				if(images.includes(result.imageVO.fileType)){
					console.log("이미지입니다.")
					imgDiv.html('');
					imgDiv.html('<img src="'+result.imageVO.fileSavepath
								+result.imageVO.fileSavename+'" style="max-width: 100%;">');
					showPictureModal.modal('show');
					
				} else if (canViewFile.includes(result.imageVO.fileType)) {
					console.log("a태그를 통해 볼수있는 파일입니다.")
					imgDiv.html('');
					imgDiv.html('<a class="uil-monitor btn btn-outline-info" href="'+result.imageVO.fileSavepath
								+result.imageVO.fileSavename+'" target="_blank" id="fileViewBtn">파일 미리보기</a>');
					showFileModal.modal('show');
				} else {
					console.log("아무고토모타는 파일입니다.")
					noShowFileModal.modal('show');
				}
			}
		})
		
	});
	
	var downloadFileBtn = $('.downloadFileBtn');
	
	$(document).on("click",'#downloadFileBtn',function(){
// 	downloadFileBtn.on('click', function(){
		location.href="/fileDownload.do?submitFileCd="+submitFileCd;
	});
	
	
	$(document).on("click",'#resFolderBtn',function(){
// 	resFolderBtn.on('click', function(){
		folderModal.modal('show');		
	});
	
	$(document).on("click",'#modalOkayBtn',function(){
// 	modalOkayBtn.on('click', function(){		
		if(folderName.val()==null || folderName.val()=="" ) {
			alert('폴더명을 입력해주세요.');
			return false;
		} else if (reg.test(folderName.val())){
			alert('폴더명에 특수문자를 포함할 수 없습니다.');
		} else {
			folderNameForm.submit();
		}
		
	});
	
	$(document).on("click",'.folderSelect',function(){
// 	folderSelect.on('click', function(){
		var submitForm = this.textContent;
		console.log(this.textContent);
		
		var form = $('#'+submitForm);
		form.submit();
	});
	
	$(document).on("click",'#resFileBtn',function(){
// 	resFileBtn.on('click', function(){
		fileModal.modal('show');
	});
	
	
	$(document).on("click",'#modalFileOkayBtn',function(){
// 	modalFileOkayBtn.on('click', function(){
		fileNameForm.submit();
	});
	
	

	
	// 파일 삭제기능 (버튼)
	var deleteFileBtn = $('#deleteFileBtn');
	$(document).on("click",'#deleteFileBtn',function(){
		
//	 		folderFileBtn.on('click', function(){
				console.log('dd');
				var folderList = [];
				var fileList = [];
				var folderSelectArray = $('.folderSelectArray');
				var fileSelectArray = $('.fileSelectArray');
				var selectBoxForm = $('#selectBoxForm');
				
				// 체크박스 체크된 폴더코드 어레이에 넣기.
				$('.folderSelectBox').each(function () {
//	 			folderSelectBox.each(function () {
		        	if($(this).is(":checked")==true){
			            console.log($(this).data('value'));
		            	folderList.push($(this).data('value'));
		        	}
		    	})
		    	console.log(folderList);
	
				// 체크박스 체크된 파일코드 어레이에 넣기.
				$('.fileSelctBox').each(function () {
//	 			fileSelctBox.each(function () {
		        	if($(this).is(":checked")==true){
			            console.log($(this).data('value'));
		            	fileList.push($(this).data('value'));
		        	}
		    	})
		    	console.log(fileList)
			    
		    	console.log('랭쓰 : '+folderList.length);
		    	console.log('랭쓰2 : '+fileList.length);
		   	if(folderList.length == 0 && fileList.length == 0) {
		    	alert('폴더나 파일을 선택해주세요');
	    		return false;
		    }
		   	
		   	customConfirm('개인자료실 내부 원본파일은 삭제되지 않고 유지됩니다. 즐겨찾는 자료 목록을 해지하시겠습니까?').then((userConfirmed) = {
		        if (userConfirmed) {
		    
		    if(folderList != null) {
		    	folderSelectArray.val(folderList);
		    }
			if(fileList != null) {
				fileSelectArray.val(fileList);
				selectBoxDelForm.submit();
			} else {
				return false;
			}
		        }
		})
	})
	
});
</script>

















