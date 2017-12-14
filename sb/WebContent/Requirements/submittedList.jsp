<%-- 
Document   : requirementedit
Created on : May 5, 2015, 1:55:08 AM
Author     : miracle
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.List" isErrorPage="true"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<%@page import="com.mss.msp.requirement.RequirementVTO"%>


<!DOCTYPE html>
<html>
<head>
<!-- new styles -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Requirements&nbsp;Details&nbsp;Page</title>

<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/font-awesome.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/animate.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/main.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/responsive.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/GridStyle.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/taskiframe.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/selectivity-full.css"/>">

<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>'
	type="text/css">
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>'
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/sweetalert.css"/>">
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>
<%-- <script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>
 --%>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/GeneralAjax.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/Ajax/AppConstants.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/profilediv.css"/>">
<script language="JavaScript"
	src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>

<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/EmployeeProfile.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/addLeaveOverlay.js"/>'></script>


<script type="text/javascript"
	src="<s:url value="/includes/js/Ajax/requirementAjax.js"/>"></script>
	<script type="text/javascript"
	src="<s:url value="/includes/js/Ajax/requirement.js"/>"></script>
<%-- <script type="text/javascript"
	src="<s:url value="/includes/js/Ajax/vendorAjax.js?version=1.0"/>"></script> --%>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/sweetalert.min.js"/>"></script>
<style>
.numeric_field {
	width: 30% !important;
	padding: 0 5px !important;
	float: left;
}

.select_duration {
	width: 70% !important;
}
.nav-tabs li a {
    border: 0px solid #dddd !important;
}
th {min-width: 100px;} 

@media only screen and (max-width: 1023px) {
 div.table-wrapper div.scrollable { overflow:hidden !important; overflow-y: hidden !important;}
 .pinned table {  width: 100%; display:none !important;}
} 
table#consultantListTable
{
display:block;
overflow-x:auto;
}
</style>
<script type="text/javascript">
	function sortables_init() {
		// Find all tables with class sortable and make them sortable
		if (!document.getElementsByTagName)
			return;
		tbls = document.getElementById("consultantListTable");
		sortableTableRows = document.getElementById("consultantListTable").rows;
		sortableTableName = "consultantListTable";
		for (ti = 0; ti < tbls.rows.length; ti++) {
			thisTbl = tbls[ti];
			if (((' ' + thisTbl.className + ' ').indexOf("sortable") != -1)
					&& (thisTbl.id)) {
				ts_makeSortable(thisTbl);
			}
		}
	};
	
</script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
</head>
<body style="overflow-x: hidden" oncontextmenu="return false"
	onload="doOnLoadDateList();getSubmittedListBySearch('1')">
	<div id="wrap">
		<header id="header">
			<!--header-->
			<div class="header_top">
				<!--header_top-->
				<div class="container">
					<s:include value="/includes/template/header.jsp" />
				</div>
			</div>
		</header>
		<%
			String orgId = session.getAttribute(ApplicationConstants.ORG_ID).toString();
		%>
		<div id="main">

			<section id="generalForm">
				<!--form-->
				<div class="container">
					<div class="row">
						<s:include value="/includes/menu/LeftMenu.jsp" />
						<!-- content start -->
						<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">
								<div id="consultantList">
													<div class="" id="profileBox"
														style="float: left; margin-top: 5px; background-color: white">
														<div class="backgroundcolor" >
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <!--<span class="pull-right"><a href="" class="profile_popup_open" ><font color="#DE9E2F"><b>Edit</b></font></a></span>-->
                                                        <font color="#ffffff">Submitted List </font>
                                                        <!-- <i id="updownArrow" onclick="toggleContent('RequirementListAllForm')" class="fa fa-minus"></i> -->
                                                    </h4>
                                                </div>
                                            </div>
														<div class="col-sm-12" id="consultantSearchForm">
															<div class="row">
																<s:form action="" theme="simple">

																	<s:hidden name="vendor" id="vendor" value="%{vendor}" />
																	<s:hidden name="RequirementId" id="RequirementId"
																		value="%{requirementVTO.RequirementId}" />
																	<s:hidden name="jdId" id="jdId" value="%{jdId}" />
                                                                    <s:hidden name="pageFlag" id="pageFlag" value="%{pageFlag}"/>
																	<s:hidden name="downloadFlag" id="downloadFlag"
																		value="%{downloadFlag}" />
																	<s:hidden name="customerFlag" id="customerFlag"
																		value="%{customerFlag}" />
																	<s:hidden name="accountFlag" id="accountFlag"
																		value="%{accountFlag}"></s:hidden>
																	<s:hidden name="accountSearchID" id="accountSearchID"
																		value="%{accountSearchID}"></s:hidden>
																    <s:hidden name="orgid" id="orgid" ></s:hidden>
																	<s:hidden name="gridDownload" id="gridDownload"
																		value="" />
																		<s:hidden name="csrRoleId" id="csrRoleId"
																		value="%{#session.primaryrole}" />

																	<br>
																	<s:if test="%{#session['usrgrpid']==1}">
																		<div class="col-sm-3">
																			<label style="color: #56a5ec;" class="labelStylereq">Customer&nbsp;Name</label>
																			<s:textfield cssClass="form-control"
																				name="vendorName" id="vendorName" tabindex="1"
																				maxLength="60" placeholder="Customer Name" />
																		</div>
																		</s:if>
																		<s:else>
																		<div class="col-sm-3">
																			<label style="color: #56a5ec;" class="labelStylereq">Vendor&nbsp;Name</label>
																			<s:textfield cssClass="form-control"
																				name="vendorName" id="vendorName" tabindex="1"
																				maxLength="60" placeholder="Vendor Name" />
																		</div>
																		</s:else>
																	<%-- <s:else>
																		<s:hidden name="vendorName" id="vendorName" />
																	</s:else> --%>
																	<div class="col-sm-3">
																			<label style="color: #56a5ec;" class="labelStylereq">Consultant Email</label>
																			<s:textfield cssClass="form-control"
																				name="consult_email" id="consult_email"
																				 tabindex="5" maxLength="60"
																				placeholder="Email Id" />

																		</div>
																		<s:hidden name="consult_email" id="consult_email" />
																	<div class="col-sm-3">

																		<label style="color: #56a5ec;" class="labelStylereq">First&nbsp;Name&nbsp;&nbsp;</label>
																		<s:textfield cssClass="form-control"
																			name="consult_name" id="consult_name"
																			 tabindex="2" maxLength="30"
																			placeholder="First Name" />

																	</div>
																	<div class="col-sm-3">

																		<label style="color: #56a5ec;" class="labelStylereq">Last&nbsp;Name&nbsp;&nbsp;</label>
																		<s:textfield cssClass="form-control"
																			name="consult_lstname" id="consult_lstname"
																		    tabindex="3"
																			maxLength="30" placeholder="Last Name" />

																	</div>
																		<div class="col-sm-3">
																			<label style="color: #56a5ec;" class="labelStylereq">Submitted From Date</label>
																			<div class="calImage">
																				<s:textfield cssClass="form-control "
																					name="submittedFrom" id="submittedFrom"
																					placeholder="Start Date"
																					onkeypress="return enterDateRepository(this);"
																					onfocus="return removeDateErrorMsg();"
																					cssStyle="z-index: 10000004;">
																					<i class="fa fa-calendar"></i>
																				</s:textfield>
																			</div>
																		
																		</div>
																    <div class="col-sm-3">
															<label style="color: #56a5ec;" class="labelStylereq">Submitted To Date
															</label>
															<div class="calImage">
																<s:textfield cssClass="form-control"
																	id="submittedEnd" placeholder="To Date" name="submittedEnd"
																	onkeypress="return enterDateRepository(this);"
																	onfocus="return removeDateErrorMsg();"
																	cssStyle="z-index: 10000004;">
																	<i class="fa fa-calendar"></i>
																</s:textfield>
															</div>
														</div>
																	<div class="col-sm-3">
																			<label style="color: #56a5ec;" class="labelStylereq">
																				Status </label>
																			<s:select name="consultStatus"
																				id="consultStatus"
																				list="#@java.util.LinkedHashMap@{'Selected':'Selected','Processing':'Processing','Withdraw':'Withdraw','SOWApproved':'SOWApproved','Rejected':'Rejected','ShortListed':'ShortListed','SOWReleased':'SOWReleased','Servicing':'Servicing'}"
																				headerKey="-1" headerValue="All"
																				cssClass="SelectBoxStyles form-control"
																				onfocus="removeErrorMessages()" />
																			<s:hidden name="status_check" id="status_check"
																				value="%{requirementVTO.RequirementStatus}" />
																		</div>
																		<s:if test="#session.primaryrole == 1 || vendor=='yes'">
									                                    <div class="col-sm-3">
										                                   <label class="labelStylereq" style="color: #56a5ec;">
											                                        CSR Status </label>
										                                    <s:select name="csrStatus" id="csrStatus"
											                                          value="%{consultantVTO.csrAppStatus}" tabindex="2"
											                                          headerKey="-1" headerValue="Please Select"
											                                          list="#@java.util.LinkedHashMap@{'Pending':'Pending','Approve':'Approve','Reject':'Reject'}"
											                                          cssClass="SelectBoxStyles form-control" />
									                                          </div>
									                                      </s:if>
																		
									                                   <s:hidden name="consultantFlag" id="consultantFlag"
																		value="%{consultantFlag}" />

																	<div class="col-sm-3 pull-right">


																		<div class="pull-right contact_search">
																			<label class="labelStylereq" style="color: #56a5ec;"></label>
																			<s:submit type="button"
																				cssClass="add_searchButton form-control"
																				id="searchButton" tabindex="7"
																				cssStyle="margin:5px 0px;" value=""
																				onclick="return getSubmittedListBySearch('1');">
																				<i class="fa fa-search"></i>&nbsp;Search</s:submit>
																		</div>
																		

																		
																	</div>


																</s:form>
															</div>
														</div>
														<span id="submissionValidation"></span>
														   <div id="loadingConsultant" class="loadingImg">
															<span id="LoadingContent">
															 <img src="<s:url value="/includes/images/Loader1.gif"/>"></span>
															</div> 
														<div class="col-sm-12" style="overflow-x:auto;width:1050px;">  
															<s:form>
																<span id="conWithRejectValid"></span>
																<s:hidden id="jdId" name="jdId" value="%{jdId}" />
																<br/>
																<div class="task_content" id="task_div" align="center"
																	style="display: none">
																																		<div>
																		<div>
																		<s:hidden name="pgNo" id="pgNo"/>
																		<s:hidden name="subListTotalRecords" id="subListTotalRecords"/>
																			<table id="consultantListTable"
																				class="responsive CSSTable_task sortable" border="5"
																				cell-spacing="2">

																				<tbody>
																					<tr>
																					    <th>Job Id</th>
																						
																						<s:if test="%{#session['usrgrpid']==1}">
																						    <th>Customer</th>
																						</s:if>
																						<s:else>
																							<th>Vendor</th>
																						</s:else>
																						<th>Candidate&nbsp;Name</th>
																						<th>Submitted&nbsp;Date</th>
																						<!-- <th>SSN&nbsp;No.</th> -->
																						
																							<th>Email Id</th>
																						
																						<!-- <th>Skill&nbsp;Set</th> -->
																						
																							<th class="unsortable">Phone No</th>
																						
																						<!-- <th>Experience</th> -->
																						<th class="unsortable">Consultant Status</th>
																						<th class="unsortable">Background Status</th>
																						<th>Rate</th>
																						<th class="unsortable">Resume</th>
																						
																							<th class="unsortable">Reviews</th>
																						
																						<s:if test="#session.primaryrole == 1 || vendor=='yes'">
																						<th class="unsortable">CSR Status</th>
																						</s:if>
																						<s:if test="accountFlag!='csr'">
																							<th class="unsortable">Proceed</th>
																						</s:if>
																						
																							<s:if test="vendor=='yes'">
																							<th class="unsortable">Withdrawn</th>
																						</s:if>
																						<!-- <th>Comments</th> -->
																					</tr>
                                                                                   
																				</tbody>
																			</table>
																			<br /> <label class="page_option"> Display <select
																				id="paginationOption" class="disPlayRecordsCss"
																				onchange="getSubmittedListBySearch(1)" style="width: auto">
																					<option>10</option>
																					<option>15</option>
																					<option>25</option>
																					<option>50</option>
																			</select> Submissions per page
																			</label>
																			<span id="consultantList_pageNation"></span>
																			 <%-- <div id="loadingConsultant" class="loadingImg">
																				<span id="LoadingContent"> <img
																					src="<s:url value="/includes/images/Loader1.gif"/>"></span>
																			</div>  --%>
																			<div align="right" id="taskpageNavPosition"
																				style="margin-right: 0vw; display: none"></div>
																			<%-- <script type="text/javascript">
																				var pager = new Pager(
																						'consultantListTable',
																						10);
																				pager
																						.init();
																				pager
																						.showPageNav(
																								'pager',
																								'taskpageNavPosition');
																				pager
																						.showPage(1);
																			</script> --%>
																		</div>
                                                                       <!--  <div class="row">
																		<div class="com-sm-12">
																			<div id="downloading_grid"
																				class="col-sm-6 pull-right">
																				<div class="pull-right  req_btn col-sm-0"
																					style="margin: 0px 0px 0px 10px">
																					<div onclick="downloadPDFSubmittedList()"
																						id="submittedListDownloadPDFButton" tabindex="8"
																						class="fa fa-download cssbutton form-control">&nbsp;DownloadPDF</div>
																				</div>
																				<div class="pull-right  req_btn col-sm-0">
																					<div onclick="downloadXLSSubmittedList()"
																						id="submittedListDownloadXLSButton" tabindex="9"
																						class=" fa fa-download cssbutton form-control">&nbsp;DownloadXLS</div>
																				</div>
																			</div>
																		</div>
																		</div> -->
																	</div>
															</s:form>

														</div>
														<div id="Migration_popup">
															<div id="recruiterBox" class="marginTasks">
																<div class="backgroundcolor">
																	<table>
																		<tr>
																			<td><h4 style="font-family: cursive">
																					<font class="titleColor">&nbsp;&nbsp;Forwarded&nbsp;By&nbsp;Details&nbsp;&nbsp;
																					</font>
																				</h4></td>
																			<span class="pull-right">
																				<h5>
																					&nbsp;&nbsp;&nbsp;&nbsp;<a href=""
																						class="Migration_popup_close"
																						onclick="migration_overlayClose()"><i
																						class="fa fa-times-circle-o fa-size"></i></a>
																				</h5>
																			</span>
																	</table>
																</div>
																<div>
																	<form>
																		<span><mig></mig></span>
																		<s:hidden name="consult_id" id="consult_id" value="" />
																		<s:hidden name="req_Id" id="req_Id"
																			value="%{requirementVTO.RequirementId}" />
																		<s:hidden name="acc_Id" id="acc_Id" value="" />
																		<s:hidden name="acc_type" id="acc_type" value="" />
																		<!--s:property value="%{vendor}"/-->
																		<s:hidden name="vendor" id="vendor" value="%{vendor}" />
																		<s:hidden name="loginId" id="loginId"
																			value="%{#session['loginId']}" />
																		<s:hidden id="cName" name="cName" value="" />

																		<center>
																			<table>

																				<div class="inner-techReviewdiv-elements">
																					<s:textfield cssClass="form-control "
																						id="migrationEmailId" type="text" value=""
																						name="migrationEmailId" placeholder=""
																						label="EmailId" onfocus="removeErrorMessages()" />


																				</div>

																			</table>

																		</center>
																		<br />
																		<s:submit cssClass="cssbutton migrationButton"
																			id="migrate" onclick="return userMigration();"
																			value="Migrate" />
																	</form>
																</div>
																<font style="color: #ffffff">.....................
																	..............................
																	..........................................</font>
															</div>
														</div>

														<br> <br>


													</div>


												</div>
											</div>
											<!--End Tabs-->
										</div>

									</div>
									<%-- panel task body complete--%>





								</div>

								<%--close of future_items--%>
							</div>
						</div>
					</div>
				</div>

				<!-- content end -->
				<%--  Skill Overlay --%>
				<div id="recSkillOverlay_popup">
					<div id="consultantSkillSetBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<tr>
									<td><h4 style="font-family: cursive">
											<font class="titleColor">&nbsp;&nbsp;Skill&nbsp;Details&nbsp;&nbsp;
											</font>
										</h4></td>
									<span class="pull-right">
										<h5>
											&nbsp;&nbsp;&nbsp;&nbsp;<a href=""
												id="consSkillOverlayCloseButton"
												class="recSkillOverlay_popup_close"
												onclick="consultantSkillCloseOverlay()"><i
												class="fa fa-times-circle-o fa-size"></i></a>
										</h5>
									</span>
							</table>
						</div>
						<div>

							<s:textarea name="customerSkillDetails" id="customerSkillDetails"
								disabled="true" cssClass="form-control textareaSkillOverlay" />


						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>

				<div id="SOW_popup">
					<div id="SOWBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<s:if test="requirementVTO.RequirementTaxTerm=='CO'">
									<tr>
										<td><h4 style="font-family: cursive">
												<font class="titleColor">&nbsp;&nbsp;SOW&nbsp;Process
													&nbsp;&nbsp; </font>
											</h4></td>
								</s:if>
								<s:else>
									<tr>
										<td><h4 style="font-family: cursive">
												<font class="titleColor">&nbsp;&nbsp;Finder&nbsp;Fee&nbsp;Process
													&nbsp;&nbsp; </font>
											</h4></td>
								</s:else>
								<span class="pull-right">
									<h5>
										&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="sowPopUpClose"
											class="SOW_popup_close" onclick="SOWPopupClose()"><i
											class="fa fa-times-circle-o fa-size"></i></a>
									</h5>
								</span>
							</table>
						</div>
						<s:hidden name="rateSalary" id="rateSalary" />
						<s:hidden name="conId" id="conId" />
						<span id="SOWSpan"><res></res></span>
						<s:if test="requirementVTO.RequirementTaxTerm=='CO'">
							<s:select name="SOWSelectValue" id="SOWSelectValue"
								cssClass="SelectBoxStyles form-control"
								list="#@java.util.LinkedHashMap@{'SOWProceed':'SOW Proceed','Denied':'Denied'}" />
						</s:if>
						<s:else>
							<s:select name="SOWSelectValue" id="SOWSelectValue"
								cssClass="SelectBoxStyles form-control"
								list="#@java.util.LinkedHashMap@{'FinderFee':'Finder Fee','Denied':'Denied'}" />
						</s:else>
						<br>
						<div class="pull-right ">
							<s:submit type="button" cssClass="cssbutton" id="contactSend"
								value="Save" onclick="saveSOWFinderFeeType();" />
						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>

				<div id="conWithdraw_popup">
					<div id="conWithdrawBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<tr>
									<td><h4 style="font-family: cursive">
											<font class="titleColor" id="commentsLabel">&nbsp;Comments</font>
										</h4></td>
									<span class="pull-right">
										<h5>
											&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
												id="withdrawCommentsClose" class="conWithdraw_popup_close"
												onclick="conWithdrawClose('close')"><i
												class="fa fa-times-circle-o fa-size"></i></a>
										</h5>
									</span>
							</table>
						</div>
						<s:hidden name="reqwithdrawId" id="reqwithdrawId" />
						<s:hidden name="conWithdrawId" id="conWithdrawId" />
						<div class="required">
							<label>Comments</label>
							<s:textarea name="withdrawComments" id="withdrawComments"
								cssClass="form-control textareaSkillOverlay" />
						</div>

						<div class="pull-right btn_pull" id="withdrawButtonDiv">
							<s:submit type="button"
								cssClass="cssbutton conWithdraw_popup_close fa icon-ok"
								id="contactSend" value="OK" onclick="conWithdrawClose('ok');" />
						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>
				<div id="decline_popup" style="display: none">
					<div id="declineBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<tr>
									<td><h4 style="font-family: cursive">
											<font class="titleColor">&nbsp;Rejection&nbsp; </font>
										</h4></td>
									<span class="pull-right">
										<h5>
											&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
												id="rejectionCommentsClose" class="decline_popup_close"
												onclick="declineClose()"><i
												class="fa fa-times-circle-o fa-size"></i></a>
										</h5>
									</span>
							</table>
						</div>
						<s:hidden name="reqRejectId" id="reqRejectId" />
						<s:hidden name="conRejectId" id="conRejectId" />
						<s:hidden name="createdByOrgId" id="createdByOrgId" />
						<span id="rejectionMessage"></span>
						<div class="required">
							<label>Comments</label>
							<s:textarea name="rejectionComments" id="rejectionComments"
								cssClass="form-control textareaSkillOverlay" />
						</div>

						<div class="pull-right btn_pull" id="declineButtonDiv"
							style="display: none">
							<s:submit type="button"
								cssClass="cssbutton decline_popup_close fa fa-check-circle-o"
								id="declineConsultant" value="OK"
								onclick="doDeclineConsultant();" />
						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>

				<div id="consultantLoginOverlay_popup">
					<div id="consultantLoginBox" class="marginTasks">
						<div class="backgroundcolor">
							<table>
								<tr>
									<td><h4 style="font-family: cursive">
											<font class="titleColor">&nbsp;&nbsp;
												Consultant&nbsp;Login&nbsp;Credentials&nbsp;&nbsp; </font>
										</h4></td>
									<span class="pull-right">
										<h5>
											&nbsp;&nbsp;&nbsp;&nbsp;<a href=""
												id="consCredentialsOverlayClose"
												class="consultantLoginOverlay_popup_close"
												onclick="consultantLoginCredential()"><i
												class="fa fa-times-circle-o fa-size"></i></a>
										</h5>
									</span>
							</table>
						</div>
						<div>
							<div class="inner-consuldiv-elements">
								<div id="outputMessage"></div>
								<s:hidden id="consultantEmail" name="consultantEmail" value="" />
								<s:hidden id="consultantId" name="consultantId" value="" />
								<div id="consultantdivEmail"></div>
							</div>
							<div class="pull-left ">
								<s:submit type="button"
									cssClass="consultantLoginOverlay_popup_close"
									id="contactCancel" onclick="consultantLoginCredential()"
									value="Cancel" />
							</div>
							<div class="pull-right ">

								<s:submit type="button" cssClass="cssbutton" id="contactSend"
									value="Send" onclick="saveConsultantLoginDetails()" />

							</div>

						</div>
						<font style="color: #ffffff">.....................
							..............................
							..........................................</font>
					</div>
				</div>

				<%--close of overlay --%>
			</section>
		</div>
	</div>
	<!--  Consultant Background attachment new modal start -->
	<button type="button" id="backgroundAttachmentModalBtn" class="pull-right cssbutton" data-toggle="modal" data-target="#myModal"></button>
								
								 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
      <div class="backgroundcolor">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Upload
																Attachment &nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
													
													<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
															<a href="" class="consultResumeAttachment_popup_close"
																data-dismiss="modal" ><i
																class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>
      
        <!-- <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div> -->
        <div class="modal-body">
         <s:form action="consultBackgroundUploadInitiation"
												id="consultantBackgroundAttachmentForm" theme="simple"
												enctype="multipart/form-data"
												onsubmit="return consultBackgroundAttachmentValidation();">
												<s:hidden name="current_orgid" id="current_orgid"/>
												<s:hidden name="current_pageFlag" id="current_pageFlag"/>
												<s:hidden name="current_vendor" id="current_vendor"/>
												<s:hidden name="consult_id" id="current_consult_id"/>
												<s:hidden name="current_requirementId" id="current_requirementId"/>
												<s:hidden name="jspPageFlag" id="jspPageFlag" value="submittedList"/>
												<s:hidden name="overlayFlag" id="overlayFlag" value="bgInitiation"/>
													<div class="inner-addtaskdiv-elements">
														<div id="backgroundAttachmentmessage"></div>
													</div>
													<div class="col-sm-12 required">
														<label class="labelStylereq">Attachment Title</label>
														<s:textfield cssClass="form-control"
															name="backgroundAttachmentTitle" id="backgroundAttachmentTitle"
															placeholder="Attachment Title" maxlength="30" />
													</div>
													<br> <br>

													<div class="col-sm-12 required">
														<label class="labelStylereq">Attachment Type</label>
														<s:select cssClass="form-control SelectBoxStyles"
															headerKey="0" headerValue="Select Attachment Type"
															name="backgroundAttachmentType" id="backgroundAttachmentType"
															list="#@java.util.LinkedHashMap@{'EV':'Employee Verification','CD':'Consent and Disclosure'}" />
													</div>
													<br> <br>
													<div class="col-sm-12 required">
														<label class="labelStylereq">Attach File</label>
														<s:file name="consultBackgroundAttachment" id="consultBackgroundAttachment"
															onchange="return backgroundAddValidation();" />
													</div>
													<br>

													
													<div class="col-sm-12 required">
														<s:submit id="consultBackgroundAttachUpload" type="button"
															cssClass="cssbutton fa fa-upload pull-right"
															value="Upload" theme="simple"
															onclick="return backgroundAttachmentValidation();" />
													</div>
													<br>
												
										 <br><br><br><br>
										
										</s:form>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
								
								<!--  Consultant Background attachment new modal end -->
	
	<!--consultant background Status update start-->
	<div class="modal fade" id="backgroundStatusDiv" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
      <div class="backgroundcolor">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Background Status
																 &nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
													
													<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
															<a href="" class="consultResumeAttachment_popup_close"
																data-dismiss="modal" ><i
																class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>
      
        <!-- <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div> -->
        <div class="modal-body">
        										<div id="verificationStatusAndCommentsDiv" style="display:none">
        											<div id="vStatusDiv" class="col-sm-12">
														<label class="labelStylereq">Verification Status</label>
														<s:textfield cssClass="form-control"
															id="vStatus" readonly="true"/>
													</div>
													<div id="vCommentsDiv" class="col-sm-12">
														<label class="labelStylereq">Verification Comments</label>
														<s:textarea cssClass="form-control"
														id="vComments" readonly="true"/>
													</div>
												</div>						
         										<s:form action="/Requirements/consultBackgroundStatusUpdate"
												id="consultantBackgroundStatusForm" theme="simple"
												enctype="multipart/form-data">
												<s:hidden name="ucurrent_orgid" id="ucurrent_orgid"/>
												<s:hidden name="ucurrent_pageFlag" id="ucurrent_pageFlag"/>
												<s:hidden name="ucurrent_vendor" id="ucurrent_vendor"/>
												<s:hidden name="consult_id" id="uCurrent_consult_id"/>
												<s:hidden name="current_requirementId" id="uCurrent_requirementId"/>
												<s:hidden name="current_attachmentId" id="uCurrent_attachmentId"/>
												<s:hidden name="jspPageFlag" id="jspPageFlag" value="submittedList"/>
												<s:hidden name="overlayFlag" id="overlayFlag" value="bgStatusUpdate"/>
												<div class="inner-addtaskdiv-elements">
												<div id="backgroundStatusMessage"></div>
												</div>
													
													<div class="col-sm-12 required">
														<label class="labelStylereq"> Background Status</label>
														<%-- <s:select cssClass="form-control SelectBoxStyles"
															headerKey="0" headerValue="Select Attachment Status"
															name="backgroundStatus" id="backgroundStatus"
															list="#@java.util.LinkedHashMap@{'Initiated':'Re-Initiate','Approved':'Approve','Rejected':'Reject','Verifying':'Verify'}" onchange="changeBackgroundStatus()"/> --%>
															
														<select id="backgroundStatus" name="backgroundStatus" class="form-control SelectBoxStyles" onchange="changeBackgroundStatus();"></select>	
													</div>
													<div id="attachmentTitleDiv" class="col-sm-12 required" style="display:none;">
														<label class="labelStylereq">Attachment Title</label>
														<s:textfield cssClass="form-control"
															name="backgroundAttachmentTitle" id="updateBackgroundAttachmentTitle"
															placeholder="Attachment Title" maxlength="30" />
													</div>
													
													<div id="attachmentTypeDiv" class="col-sm-12 required" style="display:none;">
														<label class="labelStylereq">Attachment Type</label>
														<s:select cssClass="form-control SelectBoxStyles"
															headerKey="0" headerValue="Select Attachment Type"
															name="backgroundAttachmentType" id="updateBackgroundAttachmentType"
															list="#@java.util.LinkedHashMap@{'EV':'Employee Verification','CD':'Consent and Disclosure'}" />
													</div>
													
													<div id="attachmentFileDiv" class="col-sm-12 required" style="display:none;">
														<label class="labelStylereq">Attach File</label>
														<s:file name="consultBackgroundAttachment" id="consultBackgroundAttachmentInStatus"
															onchange="return backgroundAddValidationInStatus();" />
													</div>
													<div id="verifiedByDiv" class="col-sm-12 required" style="display:none;">
														<label class="labelStylereq">VerifiedBy</label>
														<s:select cssClass="form-control SelectBoxStyles"
															headerKey="0" headerValue="Verified By"
															name="verifiedBy" id="verifiedBy"
															list="#@java.util.LinkedHashMap@{'CSR':'CSR','ThirdParty1':'ThirdParty1','ThirdParty2':'ThirdParty2','ThirdParty3':'ThirdParty3'}"/>
													</div>
													
													<div id="CommentsDiv" class="col-sm-12 required" style="display:none;">
														<label class="labelStylereq">Comments</label>
														<s:textarea cssClass="form-control"
															name="backgroundCheckComments" id="backgroundCheckComments"
															placeholder="Comments"/>
													</div>
													
													 <div id="fakeCandidateDiv">
						                               <div class="col-sm-5" style="">
						                               <label>Is the Candidate fake ?</label>
							                               <s:checkbox label="Agree" id="fakeCandidate" 
								                             name="fakeCandidate" onclick=""/>
						                              
						                              <a href="#" data-toggle="tooltip" data-container="body" data-placement="right" data-html="true" title="If this Checkbox is checked then Fake Candidate cost will be deducted from the Vendor's account.">
															   <img src="/sb/includes/images/icons/isymbol.png" width="15" height="15"/>
													   </a>
													   </div>
						                              <span id="fakeCandidateMessageSpan"></span>
						                            </div>
													
													<div class="col-sm-12 required">
														<s:submit id="consultBackgroundStatusUpdatebtn" type="button"
															cssClass="cssbutton fa fa-upload pull-right"
															value="Ok" theme="simple"
															onclick="return backgroundStatusValidation();" />
													</div>
													<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
													</s:form>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
	
	<!--consultant background Status update end  -->
		<!-- Consultant Background Status Verification By CSR modal Start -->
	<div class="modal fade" id="bgStatusbyCSRDiv" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
      <div class="backgroundcolor">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Verification Status
																 &nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
													
													<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
															<a href="" class="consultResumeAttachment_popup_close"
																data-dismiss="modal" ><i
																class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>
      
        <!-- <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div> -->
        <div class="modal-body">
          <s:form action="/Requirements/consultBackgroundStatusUpdateCsr"
												id="bgStatusByCSRForm" theme="simple"
												enctype="multipart/form-data">
												<s:hidden name="vcurrent_orgid" id="vcurrent_orgid"/>
												<s:hidden name="vcurrent_pageFlag" id="vcurrent_pageFlag"/>
												<s:hidden name="vcurrent_vendor" id="vcurrent_vendor"/>
												<s:hidden name="consult_id" id="vcurrent_consult_id"/>
												<s:hidden name="current_requirementId" id="vcurrent_requirementId"/>
												<s:hidden name="current_attachmentId" id="vcurrent_attachmentId"/>
												<s:hidden name="backgroundStatus" id="backgroundStatusByCSR" value="Verified"/>
												<s:hidden name="jspPageFlag" id="jspPageFlag" value="submittedList"/>
												<s:hidden name="overlayFlag" id="overlayFlag" value="verificationByCSR"/>
													<div class="inner-addtaskdiv-elements">
														<div id="bgStatusByCSRMessage"></div>
													</div>
													
													<div class="col-sm-12 required">
														<label class="labelStylereq"> Verification Status</label>
														<s:select cssClass="form-control SelectBoxStyles"
															headerKey="0" headerValue="Select Background Status"
															name="verificationStatus" id="verificationStatus"
															list="#@java.util.LinkedHashMap@{'Reliable':'Reliable','Non-Reliable':'Non-Reliable'}" onchange="changeVerificationStatus();"/>
													</div>
													<div id="verificationCommentsDiv" class="col-sm-12 required" style="display:none;">
														<label class="labelStylereq">Comments</label>
														<s:textarea cssClass="form-control"
															name="verificationComments" id="verificationComments"
															placeholder="Comments" />
													</div>
													
													<div class="col-sm-12 required">
														<s:submit id="consultBackgroundStatusUpdateByCSRbtn" type="button"
															cssClass="cssbutton fa fa-upload pull-right"
															value="Ok" theme="simple"/>
													</div>
													<br>
												
										 <br><br><br> <br><br><br><br><br><br>
										
										</s:form>
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
	
	<!--Consultant Background Status Verification By CSR modal End  -->
	
	<!--  view verification status start -->
	<div class="modal fade" id="viewVerificationStatusDiv" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
      <div class="backgroundcolor">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Verification Status
																 &nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
													
													<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
															<a href="" class="consultResumeAttachment_popup_close"
																data-dismiss="modal" ><i
																class="fa fa-times-circle-o fa-size"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>
      
        <!-- <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div> -->
        <div class="modal-body">
         											<div id="viewVerificationStatusDiv" class="col-sm-12">
														<label class="labelStylereq">Verification Status</label>
														<s:textfield cssClass="form-control"
															name="viewVerificationStatus" id="viewVerificationStatus" readonly="true"/>
													</div>
													
													<div id="viewVerificationCommentsDiv" class="col-sm-12" style="display:none;">
														<label class="labelStylereq"> Verification Comments</label>
														<s:textarea cssClass="form-control"
															name="viewVerificationComments" id="viewVerificationComments" readonly="true"/>
													</div>
													
													<div id="viewCustorVenCommentsDiv" class="col-sm-12" style="display:none;">
														<label class="labelStylereq">Comments</label>
														<s:textarea cssClass="form-control"
															name="viewCustorVenComments" id="viewCustorVenComments" readonly="true"/>
													</div>
													
													
													<br><br><br><br><br><br><br><br><br><br><br><br>
													
													
        </div>
        
      </div>
      
    </div>
  </div>
	
	<!--  view verification status end -->
	
	
	
	
	<footer id="footer">
		<!--Footer-->
		<div class="footer-bottom" id="footer_bottom">
			<div class="container">
				<s:include value="/includes/template/footer.jsp" />
			</div>
		</div>
	</footer>

	<script type="text/javascript"
		src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>
	<script>
		sortables_init();
	</script>
	<script type="text/javascript"
		src="<s:url value="/includes/js/general/dynamicPagination.js"/>"></script>
		<%-- <script type="text/javascript">
		var recordPage = 10;
		function pagerOption() {

			var paginationSize = document.getElementById("paginationOption").value;
			if (isNaN(paginationSize)) {

			}
			recordPage = paginationSize;
			$('#consultantListTable').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);

		};
		
	</script> --%>
	</body>
</html>