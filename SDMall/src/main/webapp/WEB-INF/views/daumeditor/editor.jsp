<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 에디터 컨테이너 시작 -->
<DIV id=tx_trex_container class=tx-editor-container>
	<!-- 사이드바 -->
	<DIV id=tx_sidebar class=tx-sidebar>
		<DIV class=tx-sidebar-boundary>
			<!-- 사이드바 / 첨부 -->
			<UL class="tx-bar tx-bar-left tx-nav-attach">
				<!-- 이미지 첨부 버튼 시작 -->
				<!-- @decsription <li></li> 단위로 위치를 이동할 수 있다. -->
				<LI class=tx-list>
					<DIV id=tx_image class="tx-image tx-btn-trans" unselectable="on">
						<A title=사진 class=tx-text href="javascript:;">사진</A>
					</DIV> <!-- 이미지 첨부 버튼 끝 -->
				<!-- <LI class=tx-list>
					<DIV id=tx_file class="tx-file tx-btn-trans" unselectable="on">
						<A title=파일 class=tx-text href="javascript:;">파일</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_media class="tx-media tx-btn-trans" unselectable="on">
						<A title=외부컨텐츠 class=tx-text href="javascript:;">외부컨텐츠</A>
					</DIV>
				<LI class="tx-list tx-list-extra">
					<DIV class="tx-btn-nlrbg tx-extra" unselectable="on">
						<A title="버튼 더보기" class=tx-icon href="javascript:;">버튼 더보기</A>
					</DIV>
					<UL class="tx-extra-menu tx-menu" style="LEFT: -48px"
						unselectable="on">
						@decsription 일부 버튼들을 빼서 레이어로 숨기는 기능을 원할 경우 이 곳으로 이동시킬 수 있다.
					</UL>
				</LI> -->
			</UL>
			<!-- 사이드바 / 우측영역 -->
			<UL class="tx-bar tx-bar-right">
				<LI class=tx-list>
					<DIV id=tx_fullscreen class="tx-btn-lrbg tx-fullscreen"
						unselectable="on">
						<A title="넓게쓰기 (Ctrl+M)" class=tx-icon href="javascript:;">넓게쓰기</A>
					</DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-right tx-nav-opt">
				<LI class=tx-list>
					<DIV id=tx_switchertoggle class=tx-switchtoggle unselectable="on">
						<A title="에디터 타입" href="javascript:;">에디터</A>
					</DIV>
				</LI>
			</UL>
		</DIV>
	</DIV>
	<!-- 툴바 - 기본 시작 -->
	<!-- @decsription 툴바 버튼의 그룹핑의 변경이 필요할 때는 위치(왼쪽, 가운데, 오른쪽) 에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다. tx-btn-lbg: 왼쪽, tx-btn-bg: 가운데, tx-btn-rbg: 오른쪽, tx-btn-lrbg: 독립적인 그룹 드롭다운 버튼의 크기를 변경하고자 할 경우에는 넓이에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다. tx-slt-70bg, tx-slt-59bg, tx-slt-42bg, tx-btn-43lrbg, tx-btn-52lrbg, tx-btn-57lrbg, tx-btn-71lrbg tx-btn-48lbg, tx-btn-48rbg, tx-btn-30lrbg, tx-btn-46lrbg, tx-btn-67lrbg, tx-btn-49lbg, tx-btn-58bg, tx-btn-46bg, tx-btn-49rbg -->
	<DIV id=tx_toolbar_basic class="tx-toolbar tx-toolbar-basic">
		<DIV class=tx-toolbar-boundary>
			<UL class="tx-bar tx-bar-left">
				<LI class=tx-list>
					<DIV id=tx_fontfamily class="tx-slt-70bg tx-fontfamily"
						unselectable="on">
						<A title=글꼴 href="javascript:;">굴림</A>
					</DIV>
					<DIV id=tx_fontfamily_menu class="tx-fontfamily-menu tx-menu"
						unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left">
				<LI class=tx-list>
					<DIV id=tx_fontsize class="tx-slt-42bg tx-fontsize"
						unselectable="on">
						<A title=글자크기 href="javascript:;">9pt</A>
					</DIV>
					<DIV id=tx_fontsize_menu class="tx-fontsize-menu tx-menu"
						unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-font">
				<LI class=tx-list>
					<DIV id=tx_bold class="&#9;&#9; tx-btn-lbg &#9;tx-bold"
						unselectable="on">
						<A title="굵게 (Ctrl+B)" class=tx-icon href="javascript:;">굵게</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_underline class="&#9;&#9; tx-btn-bg &#9;tx-underline"
						unselectable="on">
						<A title="밑줄 (Ctrl+U)" class=tx-icon href="javascript:;">밑줄</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_italic class="&#9;&#9; tx-btn-bg &#9;tx-italic"
						unselectable="on">
						<A title="기울임 (Ctrl+I)" class=tx-icon href="javascript:;">기울임</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_strike class="&#9;&#9; tx-btn-bg &#9;tx-strike"
						unselectable="on">
						<A title="취소선 (Ctrl+D)" class=tx-icon href="javascript:;">취소선</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_forecolor class="&#9;&#9; tx-slt-tbg &#9;tx-forecolor"
						unselectable="on">
						<A title=글자색 class=tx-icon href="javascript:;">글자색</A> <A
							title="글자색 선택" class=tx-arrow href="javascript:;">글자색 선택</A>
					</DIV>
					<DIV id=tx_forecolor_menu
						class="tx-menu tx-forecolor-menu tx-colorpallete"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_backcolor class="&#9;&#9; tx-slt-brbg &#9;tx-backcolor"
						unselectable="on">
						<A title="글자 배경색" class=tx-icon href="javascript:;">글자 배경색</A> <A
							title="글자 배경색 선택" class=tx-arrow href="javascript:;">글자 배경색
							선택</A>
					</DIV>
					<DIV id=tx_backcolor_menu
						class="tx-menu tx-backcolor-menu tx-colorpallete"
						unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-align">
				<LI class=tx-list>
					<DIV id=tx_alignleft class="&#9;&#9; tx-btn-lbg &#9;tx-alignleft"
						unselectable="on">
						<A title="왼쪽정렬 (Ctrl+,)" class=tx-icon href="javascript:;">왼쪽정렬</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_aligncenter
						class="&#9;&#9; tx-btn-bg &#9;tx-aligncenter" unselectable="on">
						<A title="가운데정렬 (Ctrl+.)" class=tx-icon href="javascript:;">가운데정렬</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_alignright class="&#9;&#9; tx-btn-bg &#9;tx-alignright"
						unselectable="on">
						<A title="오른쪽정렬 (Ctrl+/)" class=tx-icon href="javascript:;">오른쪽정렬</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_alignfull class="&#9;&#9; tx-btn-rbg &#9;tx-alignfull"
						unselectable="on">
						<A title=양쪽정렬 class=tx-icon href="javascript:;">양쪽정렬</A>
					</DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-tab">
				<LI class=tx-list>
					<DIV id=tx_indent class="&#9;&#9; tx-btn-lbg &#9;tx-indent"
						unselectable="on">
						<A title="들여쓰기 (Tab)" class=tx-icon href="javascript:;">들여쓰기</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_outdent class="&#9;&#9; tx-btn-rbg &#9;tx-outdent"
						unselectable="on">
						<A title="내어쓰기 (Shift+Tab)" class=tx-icon href="javascript:;">내어쓰기</A>
					</DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-list">
				<LI class=tx-list>
					<DIV id=tx_lineheight class="tx-slt-31lbg tx-lineheight"
						unselectable="on">
						<A title=줄간격 class=tx-icon href="javascript:;">줄간격</A> <A
							title=줄간격 class=tx-arrow href="javascript:;">줄간격 선택</A>
					</DIV>
					<DIV id=tx_lineheight_menu class="tx-lineheight-menu tx-menu"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_styledlist class="tx-slt-31rbg tx-styledlist"
						unselectable="on">
						<A title=리스트 class=tx-icon href="javascript:;">리스트</A> <A
							title=리스트 class=tx-arrow href="javascript:;">리스트 선택</A>
					</DIV>
					<DIV id=tx_styledlist_menu class="tx-styledlist-menu tx-menu"
						unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-etc">
				<LI class=tx-list>
					<DIV id=tx_emoticon class="&#9;&#9; tx-btn-lbg &#9;tx-emoticon"
						unselectable="on">
						<A title=이모티콘 class=tx-icon href="javascript:;">이모티콘</A>
					</DIV>
					<DIV id=tx_emoticon_menu class="tx-emoticon-menu tx-menu"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_link class="&#9;&#9; tx-btn-bg &#9;tx-link"
						unselectable="on">
						<A title="링크 (Ctrl+K)" class=tx-icon href="javascript:;">링크</A>
					</DIV>
					<DIV id=tx_link_menu class="tx-link-menu tx-menu"></DIV>
				<LI class=tx-list>
					<DIV id=tx_specialchar
						class="&#9;&#9; tx-btn-bg &#9;tx-specialchar" unselectable="on">
						<A title=특수문자 class=tx-icon href="javascript:;">특수문자</A>
					</DIV>
					<DIV id=tx_specialchar_menu class="tx-specialchar-menu tx-menu"></DIV>
				<LI class=tx-list>
					<DIV id=tx_table class="&#9;&#9; tx-btn-bg &#9;tx-table"
						unselectable="on">
						<A title=표만들기 class=tx-icon href="javascript:;">표만들기</A>
					</DIV>
					<DIV id=tx_table_menu class="tx-table-menu tx-menu"
						unselectable="on">
						<DIV class=tx-menu-inner>
							<DIV class=tx-menu-preview></DIV>
							<DIV class=tx-menu-rowcol></DIV>
							<DIV class=tx-menu-deco></DIV>
							<DIV class=tx-menu-enter></DIV>
						</DIV>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_horizontalrule
						class="&#9;&#9; tx-btn-rbg &#9;tx-horizontalrule"
						unselectable="on">
						<A title=구분선 class=tx-icon href="javascript:;">구분선</A>
					</DIV>
					<DIV id=tx_horizontalrule_menu
						class="tx-horizontalrule-menu tx-menu" unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left">
				<LI class=tx-list>
					<DIV id=tx_richtextbox
						class="&#9;&#9; tx-btn-lbg &#9;tx-richtextbox" unselectable="on">
						<A title=글상자 class=tx-icon href="javascript:;">글상자</A>
					</DIV>
					<DIV id=tx_richtextbox_menu class="tx-richtextbox-menu tx-menu">
						<DIV class=tx-menu-header>
							<DIV class=tx-menu-preview-area>
								<DIV class=tx-menu-preview></DIV>
							</DIV>
							<DIV class=tx-menu-switch>
								<DIV class="tx-menu-simple tx-selected">
									<SPAN>간단 선택</SPAN>
								</DIV>
								<DIV class=tx-menu-advanced>
									<SPAN>직접 선택</SPAN>
								</DIV>
							</DIV>
						</DIV>
						<DIV class=tx-menu-inner></DIV>
						<DIV class=tx-menu-footer>
							<IMG class=tx-menu-confirm alt=""
								src="${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/btn_confirm.gif?rv=1.0.1">
							<IMG class=tx-menu-cancel hspace=3 alt=""
								src="${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/btn_cancel.gif?rv=1.0.1">
						</DIV>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_quote class="&#9;&#9; tx-btn-bg &#9;tx-quote"
						unselectable="on">
						<A title="인용구 (Ctrl+Q)" class=tx-icon href="javascript:;">인용구</A>
					</DIV>
					<DIV id=tx_quote_menu class="tx-quote-menu tx-menu"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_background class="&#9;&#9; tx-btn-bg &#9;tx-background"
						unselectable="on">
						<A title=배경색 class=tx-icon href="javascript:;">배경색</A>
					</DIV>
					<DIV id=tx_background_menu
						class="tx-menu tx-background-menu tx-colorpallete"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_dictionary class="&#9;&#9; tx-btn-rbg &#9;tx-dictionary"
						unselectable="on">
						<A title=사전 class=tx-icon href="javascript:;">사전</A>
					</DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-undo">
				<LI class=tx-list>
					<DIV id=tx_undo class="&#9;&#9; tx-btn-lbg &#9;tx-undo"
						unselectable="on">
						<A title="실행취소 (Ctrl+Z)" class=tx-icon href="javascript:;">실행취소</A>
					</DIV>
				<LI class=tx-list>
					<DIV id=tx_redo class="&#9;&#9; tx-btn-rbg &#9;tx-redo"
						unselectable="on">
						<A title="다시실행 (Ctrl+Y)" class=tx-icon href="javascript:;">다시실행</A>
					</DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-right">
				<LI class=tx-list>
					<DIV id=tx_advanced class="tx-btn-nlrbg tx-advanced"
						unselectable="on">
						<A title="툴바 더보기" class=tx-icon href="javascript:;">툴바 더보기</A>
					</DIV>
				</LI>
			</UL>
		</DIV>
	</DIV>
	<!-- 툴바 - 기본 끝 -->
	<!-- 툴바 - 더보기 시작 -->
	<DIV id=tx_toolbar_advanced class="tx-toolbar tx-toolbar-advanced">
		<DIV class=tx-toolbar-boundary>
			<UL class="tx-bar tx-bar-left">
				<LI class=tx-list>
					<DIV class=tx-tableedit-title></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-align">
				<LI class=tx-list>
					<DIV id=tx_mergecells class="tx-btn-lbg tx-mergecells"
						unselectable="on">
						<A title=병합 class=tx-icon2 href="javascript:;">병합</A>
					</DIV>
					<DIV id=tx_mergecells_menu class="tx-mergecells-menu tx-menu"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_insertcells class="tx-btn-bg tx-insertcells"
						unselectable="on">
						<A title=삽입 class=tx-icon2 href="javascript:;">삽입</A>
					</DIV>
					<DIV id=tx_insertcells_menu class="tx-insertcells-menu tx-menu"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_deletecells class="tx-btn-rbg tx-deletecells"
						unselectable="on">
						<A title=삭제 class=tx-icon2 href="javascript:;">삭제</A>
					</DIV>
					<DIV id=tx_deletecells_menu class="tx-deletecells-menu tx-menu"
						unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left tx-group-align">
				<LI class=tx-list>
					<DIV id=tx_cellslinepreview
						class="tx-slt-70lbg tx-cellslinepreview" unselectable="on">
						<A title="선 미리보기" href="javascript:;"></A>
					</DIV>
					<DIV id=tx_cellslinepreview_menu
						class="tx-cellslinepreview-menu tx-menu" unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_cellslinecolor class="tx-slt-tbg tx-cellslinecolor"
						unselectable="on">
						<A title=선색 class=tx-icon2 href="javascript:;">선색</A>
						<DIV class=tx-colorpallete unselectable="on"></DIV>
					</DIV>
					<DIV id=tx_cellslinecolor_menu
						class="tx-cellslinecolor-menu tx-menu tx-colorpallete"
						unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_cellslineheight class="tx-btn-bg tx-cellslineheight"
						unselectable="on">
						<A title=두께 class=tx-icon2 href="javascript:;">두께</A>
					</DIV>
					<DIV id=tx_cellslineheight_menu
						class="tx-cellslineheight-menu tx-menu" unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_cellslinestyle class="tx-btn-bg tx-cellslinestyle"
						unselectable="on">
						<A title=스타일 class=tx-icon2 href="javascript:;">스타일</A>
					</DIV>
					<DIV id=tx_cellslinestyle_menu
						class="tx-cellslinestyle-menu tx-menu" unselectable="on"></DIV>
				<LI class=tx-list>
					<DIV id=tx_cellsoutline class="tx-btn-rbg tx-cellsoutline"
						unselectable="on">
						<A title=테두리 class=tx-icon2 href="javascript:;">테두리</A>
					</DIV>
					<DIV id=tx_cellsoutline_menu class="tx-cellsoutline-menu tx-menu"
						unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left">
				<LI class=tx-list>
					<DIV id=tx_tablebackcolor class="tx-btn-lrbg tx-tablebackcolor"
						style="BACKGROUND-COLOR: rgb(154, 165, 234)" unselectable="on">
						<A title="테이블 배경색" class=tx-icon2 href="javascript:;">테이블 배경색</A>
					</DIV>
					<DIV id=tx_tablebackcolor_menu
						class="tx-tablebackcolor-menu tx-menu tx-colorpallete"
						unselectable="on"></DIV>
				</LI>
			</UL>
			<UL class="tx-bar tx-bar-left">
				<LI class=tx-list>
					<DIV id=tx_tabletemplate class="tx-btn-lrbg tx-tabletemplate"
						unselectable="on">
						<A title="테이블 서식" class=tx-icon2 href="javascript:;">테이블 서식</A>
					</DIV>
					<DIV id=tx_tabletemplate_menu
						class="tx-tabletemplate-menu tx-menu tx-colorpallete"
						unselectable="on"></DIV>
				</LI>
			</UL>
		</DIV>
	</DIV>
	<!-- 툴바 - 더보기 끝 -->
	<!-- 편집영역 시작 -->
	<!-- 에디터 Start -->
	<DIV id=tx_canvas class=tx-canvas>
		<DIV id=tx_loading class=tx-loading>
			<DIV>
				<IMG
					src="${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/loading2.png"
					width=113 align=absMiddle height=21>
			</DIV>
		</DIV>
		<DIV id=tx_canvas_wysiwyg_holder class=tx-holder
			style="DISPLAY: block">
			<IFRAME id=tx_canvas_wysiwyg frameBorder=0 allowTransparency
				name=tx_canvas_wysiwyg></IFRAME>
		</DIV>
		<DIV class=tx-source-deco>
			<DIV id=tx_canvas_source_holder class=tx-holder>
				<TEXTAREA id=tx_canvas_source rows=30 cols=30></TEXTAREA>
			</DIV>
		</DIV>
		<DIV id=tx_canvas_text_holder class=tx-holder>
			<TEXTAREA id=tx_canvas_text rows=30 cols=30></TEXTAREA>
		</DIV>
	</DIV>
	<!-- 높이조절 Start -->
	<DIV id=tx_resizer class=tx-resize-bar>
		<DIV class=tx-resize-bar-bg></DIV>
		<IMG id=tx_resize_holder alt=""
			src="${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/skin/01/btn_drag01.gif"
			width=58 height=12 unselectable="on">
	</DIV>
<%-- 	다음로고 삭제
		<DIV id=tx_side_bi class=tx-side-bi>
		<DIV style="TEXT-ALIGN: right">
			<IMG hspace=4
				src="${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/editor_bi.png"
				width=78 align=absMiddle height=14>
		</DIV>
	</DIV> --%>
	<!-- 편집영역 끝 -->
	<!-- 첨부박스 시작 -->
	<!-- 파일첨부박스 Start -->
	<DIV id=tx_attach_div class=tx-attach-div>
		<DIV id=tx_attach_txt class=tx-attach-txt>파일 첨부</DIV>
		<DIV id=tx_attach_box class=tx-attach-box>
			<DIV class=tx-attach-box-inner>
				<DIV id=tx_attach_preview class=tx-attach-preview>
					<P>&nbsp;</P>
					<IMG
						src="${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/pn_preview.gif"
						width=147 height=108 unselectable="on">
				</DIV>
				<DIV class=tx-attach-main>
					<DIV id=tx_upload_progress class=tx-upload-progress>
						<DIV>0%</DIV>
						<P>파일을 업로드하는 중입니다.</P>
					</DIV>
					<UL class=tx-attach-top>
						<LI id=tx_attach_delete class=tx-attach-delete>전체삭제
						<LI id=tx_attach_size class=tx-attach-size>파일: <SPAN
							id=tx_attach_up_size class=tx-attach-size-up></SPAN>/<SPAN
							id=tx_attach_max_size></SPAN>
						<LI id=tx_attach_tools class=tx-attach-tools></LI>
					</UL>
					<UL id=tx_attach_list class=tx-attach-list></UL>
				</DIV>
			</DIV>
		</DIV>
	</DIV>
	<!-- 첨부박스 끝 -->
</DIV>
<!-- 에디터 컨테이너 끝 -->
<script type="text/javascript">
	var config = {
		
		txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService: 'sample', /* 수정필요없음. */
		txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId: "", /* 대부분의 경우에 빈문자열 */
		wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form: 'tx_editor_form'+"", /* 등록하기 위한 Form 이름 */
		txIconPath: "${ pageContext.request.contextPath }/resources/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath: "${ pageContext.request.contextPath }/resources/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas: {
			initHeight: 200,
            exitEditor:{
                /*
                desc:'빠져 나오시려면 shift+b를 누르세요.',
                hotKey: {
                    shiftKey:true,
                    keyCode:66
                },
                nextElement: document.getElementsByTagName('button')[0]
                */
            },
			styles: {
				color: "#123456", /* 기본 글자색 */
				fontFamily: "굴림", /* 기본 글자체 */
				fontSize: "10pt", /* 기본 글자크기 */
				backgroundColor: "#fff", /*기본 배경색 */
				lineHeight: "1.5", /*기본 줄간격 */
				padding: "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea: false
		},
		events: {
			preventUnload: false
		},
		sidebar: {
			attachbox: {
				show: true,
				confirmForDeleteAll: true
			},
			// 이미지첨부 관련 추가 config
			attacher:{
				image:{ 
					features:{left:250,top:65,width:400,height:190,scrollbars:0}, //팝업창 사이즈 
					popPageUrl:'${pageContext.request.contextPath}/daumeditor/imagePopup' // 팝업창 주소(콘트롤러 RequestMapping)
				} 
			},
			/* 이미지첨부 관련 추가 config */
			capacity: { maximum: 5*1024*1024 // 최대 첨부 용량 (5MB) 
			}
		},
		size: {
			contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	};
	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
	});
	
</script>

<!-- Sample: Saving Contents -->
<script type="text/javascript">
	/* 예제용 함수 goods.jsp에서 호출하게변경*/
/* 	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	} */
	/**
	 * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로
	 * 상황에 맞게 수정하여 사용한다.
	 * 모든 데이터가 유효할 경우에 true를 리턴한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 모든 데이터가 유효할 경우에 true
	 */
	function validForm(editor) {
		// Place your validation logic here
		// sample : validate that content exists
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}
		return true;
	}
	/**
	 * Editor.save()를 호출한 경우 validForm callback 이 수행된 이후
	 * 실제 form submit을 위해 form 필드를 생성, 변경하기 위해 부르는 콜백함수로
	 * 각자 상황에 맞게 적절히 응용하여 사용한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 정상적인 경우에 true
	 */
	function setForm(editor) {
        var i, input;
        var form = editor.getForm();
        var content = editor.getContent();
        // 본문 내용을 daumcontent라는 이름의textarea를 만들어서 값을 할당
        var textarea = document.createElement('textarea');
        textarea.name = 'daumcontent';
        textarea.value = content;
        form.createField(textarea);
        /* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
         첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
        var images = editor.getAttachments('image');
        for (i = 0; i < images.length; i++) {
            // existStage는 현재 본문에 존재하는지 여부
            if (images[i].existStage) {
                // data는 팝업에서 execAttach 등을 통해 넘긴 데이터
                alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
                input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'attach_image';
                input.value = images[i].data.imageurl;  // 예에서는 이미지경로만 받아서 사용
                form.createField(input);
            }
        }
        var files = editor.getAttachments('file');
        for (i = 0; i < files.length; i++) {
            input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'attach_file';
            input.value = files[i].data.attachurl;
            form.createField(input);
        }
        return true;
	}
</script>