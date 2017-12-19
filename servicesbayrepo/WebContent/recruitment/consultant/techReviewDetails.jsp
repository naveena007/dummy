<%-- 
       Document   : All Requirement List
    Created on : May 7, 2015
    Author     : Praveen<pkatru@miraclesoft.com>
--%>

<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay :: Tech review details page</title>
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
	href='<s:url value="/includes/css/general/profilediv.css"/>'>
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar.css"/>'
	type="text/css">
<link rel="stylesheet"
	href='<s:url value="/includes/css/general/dhtmlxcalendar_omega.css"/>'
	type="text/css">
<link rel="stylesheet" type="text/css"
	href='<s:url value="/includes/css/general/requirementStyle.css"/>'>
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/vendorDetailsStyles.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/taskiframe.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/general/sweetalert.css"/>">
<link rel="stylesheet" type="text/css"
	href="<s:url value="/includes/css/responsive_queries.css"/>">



<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/GridNavigation.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/jquery.js"/>"></script>

<script type="text/JavaScript"
	src="<s:url value="/includes/js/bootstrap.min.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/main.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/general/jquery.toggle.js"/>"></script>
<script type="text/JavaScript"
	src="<s:url value="/includes/js/CountriesAjax.js"/>"></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/dhtmlxcalendar.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/EmployeeProfile.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/requirement.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/vendorAjax.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/ConsultantAjax.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/Ajax/techReviewAjax.js"/>'></script>
<script language="JavaScript"
	src='<s:url value="/includes/js/general/sweetalert.min.js"/>'></script>

<%-- <script>
         
            var pager;
            function techReview(){
                var paginationSize = 10;
                pager = new EmpPager('techReviewTable', paginationSize);
                pager.init();
                pager.showPageNav('pager', 'pageNavPosition');
                pager.showPage(1);
            };
           
        </script> --%>
<style>
@media only screen and (max-width: 1023px) {
	div.table-wrapper div.scrollable {
		overflow: hidden !important;
		overflow-y: hidden !important;
	}
	.pinned table {
		width: 100%;
		display: none !important;
	}
}

table#techReviewTable {
	display: block;
	overflow-x: auto;
}
</style>
</head>
<body style="overflow-x: hidden" oncontextmenu="return false"
	onload="doOnLoad();getSearchTechReviewList('1');">
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
		<div id="main">
			<section id="generalForm">
				<!--form-->
				<div class="container">
					<div class="row">
						<s:include value="/includes/menu/LeftMenu.jsp" />

						<!-- content start -->
						<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">
							<div class="features_items">
								<div class="col-sm-12 ">
									<div class="" id="profileBox"
										style="float: left; margin-top: 5px">
										<div class="backgroundcolor">
											<div class="panel-heading">
												<h4 class="panel-title">
													<font color="#ffffff"> <s:if
															test="#session.primaryrole == 16">
			                                                        Tech Reviews
			                                                        </s:if> <s:else>
			                                                        Tech Review Consultants List
			                                                        </s:else>

													</font> <i id="updownArrow"
														onclick="toggleContent('techReviewDetailsForm')"
														class="fa fa-minus"></i>
												</h4>
											</div>
										</div>
										<!-- content start -->
										<span id="techReviewValidation"></span>

										<div id="loadingTechReviewSearch" class="loadingImg">
											<span id="LoadingContent"> <img
												src="<s:url value="/includes/images/Loader1.gif"/>"></span>
										</div>
										<div class="col-sm-12">
											<s:form theme="simple" id="techReviewDetailsForm">
												<br>
												<s:hidden id="pageFlag" name="pageFlag" value="%{pageFlag}" />
												<div class="inner-reqdiv-elements">
													<div class="row">
														<div class="col-sm-3">
															<label class="labelStylereq" style="color: #56a5ec">Interview&nbsp;Type</label>
															<s:select cssClass="SelectBoxStyles form-control"
																name="interviewTypes" id="interviewTypes"
																list="#@java.util.LinkedHashMap@{'Face to Face':'Face to Face','Telephonic':'Telephone','Skype':'Skype','Written':'Written','hr':'Hr','Online':'Online','Psychometric':'Psychometric','WebEx':'WebEx'}"
																headerKey="-1" headerValue="All"
																onchange="setLocationForFaceToFace();" />
														</div>
														<div class="col-sm-3">
															<label class="labelStylereq" style="color: #56a5ec;">From
															</label>
															<div class="calImage">
																<s:textfield cssClass="form-control "
																	name="reviewStartDate" id="reviewStartDate"
																	placeholder="From Date" tabindex="1"
																	onkeypress="return enterTechDateRepository(this);"
																	autocomplete="off"
																	onfocus="return removeErrorMsgForTechieConsultant();">
																	<i class="fa fa-calendar"></i>
																</s:textfield>
															</div>
														</div>
														<div class="col-sm-3">
															<label class="labelStylereq" style="color: #56a5ec;">To
															</label>
															<div class="calImage">
																<s:textfield cssClass="form-control "
																	name="reviewEndDate" id="reviewEndDate"
																	placeholder="To Date" tabindex="2"
																	onkeypress="return enterTechDateRepository(this);"
																	autocomplete="off"
																	onfocus="return removeErrorMsgForTechieConsultant();">
																	<i class="fa fa-calendar"></i>
																</s:textfield>
															</div>
														</div>

														<div class="col-sm-3">
															<label class="labelStylereq" style="color: #56a5ec;">Status
															</label>
															<s:select cssClass="SelectBoxStyles form-control"
																name="techReviewStatus" id="techReviewStatus"
																tabindex="3" headerKey="-1" headerValue="All"
																list="#@java.util.LinkedHashMap@{'Processing':'Processing','ShortListed':'ShortListed','Rejected':'Rejected','Selected':'Selected'}" />
														</div>
														<s:if test="#session.primaryrole ==1||#session.primaryrole ==11">
															<div class="col-sm-3">
															<label style="color: #56a5ec;">Interview Notification Status
															</label>
															<s:select cssClass="SelectBoxStyles form-control"
																name="interviewNotificationStatus" id="interviewNotificationStatus"
																tabindex="3" headerKey="-1" headerValue="All"
																list="#@java.util.LinkedHashMap@{'CSRPending':'CSRPending','ConPending':'Consultant Pending','VenPending':'Vendor Pending','Accepted':'Accepted','Rejected':'Rejected'}" />
														</div>
														</s:if>
														<div class="col-sm-2 pull-right">
															<label class="labelStylereq" style="color: #56a5ec;"></label>
															<s:submit type="button"
																cssClass="add_searchButton form-control " tabindex="4"
																id="techReviewListSearch" value=""
																onclick="return getSearchTechReviewList('1')"
																cssStyle="margin:5px">
																<i class="fa fa-search"></i>&nbsp;Search</s:submit>
															<s:hidden name="techSearch" id="techSearch"
																value="%{techSearch}" />
															<s:hidden name="downloadFlag" id="downloadFlag"
																value="%{downloadFlag}" />
														</div>
													</div>
												</div>

											</s:form>
										</div>
										<div class="row"></div>
										<br>
										<s:form>
											<s:if test='downloadFlag=="noAttachment"'>
												<span id="resume"><font
													style='color: red; font-size: 15px;'>No Attachment
														exists !!</font></span>
											</s:if>
											<s:if test='downloadFlag=="noFile"'>
												<span id="resume"><font
													style='color: red; font-size: 15px;'>File Not Found
														!!</font></span>
											</s:if>
											<div class="task_content" id="task_div" align="center"
												style="display: none">

												<div>
													<div>
													<s:hidden name="pgNo" id="pgNo" />
													<s:hidden name="techReviewTotalRecords" id="techReviewTotalRecords"  />
													
														<table id="techReviewTable"
															class="responsive CSSTable_task"
															style="overflow-x: auto;" border="5" cell-spacing="2">
															<tbody>
																<tr>
																	<th>Job Id</th>
																	<th>Name</th>
																	<th>Email</th>
																	<th>Phone</th>
																	<th>Interview Type</th>
																	<th>Interview Date&Time</th>
																	<s:if
																		test="#session.primaryrole == 3||#session.primaryrole == 13||#session.primaryrole == 1||#session.primaryrole == 5">
																		<th>Forwarded By</th>
																	</s:if>
																	<s:elseif test="#session.primaryrole == 11">
																		<th>Customer Name</th>
																	</s:elseif>
																	<s:if test="#session.primaryrole ==1">
																		<th>Customer Name</th>
																	</s:if>

																	<s:if test="#session.primaryrole == 1">
																		<th>Vendor Name</th>
																	</s:if>

																	<th>Status</th>
																	<th>Resume</th>

																	<s:if test="#session.primaryrole == 16">
																		<th>Exam Link</th>
																	</s:if>
																	<s:else>
																		<th>Review</th>
																	</s:else>

																	<th>Interview Notification Status</th>


																</tr>
															</tbody>
														</table>
														<br /> <label class="page_option "> Display <select
															id="paginationOption" class="disPlayRecordsCss"
															onchange="pageroption()" style="width: auto">
																<option>10</option>
																<option>15</option>
																<option>25</option>
																<option>50</option>
														</select> Reviews per page
														</label>
														<span id="techReview_pagination"></span>
													</div>
													<%-- <script type="text/javascript">
                                                            var pager = new EmpPager('techReviewTable', 8); 
                                                            pager.init(); 
                                                            pager.showPageNav('pager', 'pageNavPosition'); 
                                                            pager.showPage(1);
                                                        </script> --%>
												</div>
											</div>
										</s:form>
									</div>
								</div>
								<div id="Forwarded_popup">
									<div id="recruiterBox" class="marginTasks">
										<div class="backgroundcolor">
											<table>
												<tr>
													<td><h4 style="font-family: cursive">
															<font class="titleColor">&nbsp;&nbsp;Forwarded By
																Details&nbsp;&nbsp; </font>
														</h4></td>
													<span class="pull-right">
														<h5>
															&nbsp;&nbsp;&nbsp;&nbsp;<a href=""
																class="Forwarded_popup_close"
																onclick="closeForwardedByOverlay()"><i
																class="fa fa-times-circle-o fa-size"></i></a>
														</h5>
													</span>
											</table>
										</div>
										<div>
											<center>
												<table>
													<s:textfield label="Name" cssClass="form-control "
														id="recruiterNameOverlay" />
													<s:textfield label="Email Id"
														cssClass="form-control margin"
														id="recruiterEmailIdOverlay" />
													<s:textfield label="Phone" placeholder="Phone"
														cssClass="form-control margin" id="recruiterPhoneOverlay" />
												</table>
											</center>
										</div>
										<font style="color: #ffffff">.....................
											..............................
											..........................................</font>
									</div>
								</div>

																<div id="techReview_popup">
									<div id="techReviewBox" class="techReviewPopupStyle">
										<div class="backgroundcolor">
											<table>
												<tr>
													<td><h4 style="font-family: cursive">
															<font class="titleColor">&nbsp;&nbsp;Tech Review
																Process&nbsp;&nbsp; </font>
														</h4></td>
													<span class="pull-right">
														<h5>
															&nbsp;&nbsp;&nbsp;&nbsp;<a href=""
																class="techReview_popup_close"
																onclick="techReviewOverlay()"><i
																class="fa fa-times-circle-o fa-size"></i></a>
														</h5>
													</span>
											</table>
										</div>
										<%--form start from here --%>
										<div class="col-sm-12">
											<div class="pull-right " id="saveButtonReview">
												<s:submit type="button" id="saveTechReview"
													cssClass="add_searchButton fa fa-floppy-o"
													style="width:75px; height:30px"
													onclick="saveTechReviewResults();" value="Save"></s:submit>
											</div>
											<span><e></e></span><br>
											<s:hidden name="consultId" id="consultId" />
											<s:hidden name="requirementId" id="requirementId" />
											<s:hidden name="interviewType" id="interviewType" />
											<s:hidden name="contechId" id="contechId" />

											<label class="headingLabel">Consultant Details:</label>
											<div id="reviewalignBox">
												<div class="inner-techReviewdiv-elements">
													<label class="popuplabel">Name </label>
													<s:textfield type="text" name="consultantName"
														cssClass="techReviewInputStyle" id="consultantName"
														disabled="true" />
													<label class="popuplabel">Title </label>
													<s:textfield type="text" name="consultantJobTitle"
														cssClass="techReviewInputStyle" id="consultantJobTitle"
														disabled="true" />
													<label class="popuplabel tech_lab">Email</label>
													<s:textfield type="text" name="consultantEmail"
														cssClass="techReviewInputStyle" id="consultantEmail"
														disabled="true" />
												</div>
												<div class="inner-techReviewdiv-elements">
													<label class="popuplabel">Mobile </label>
													<s:textfield type="text" name="consultantMobile"
														cssClass="techReviewInputStyle" id="consultantMobile"
														disabled="true" />
													<label class="popuplabel">Sch.Date</label>
													<s:textfield type="text" name="interviewDate"
														cssClass="techReviewInputStyle" id="interviewDate"
														disabled="true" />
													<label class="popuplabel tech_lab">Status</label>

													<s:if test="#session.primaryrole == 6">
														<span id="onlineExam"> <s:select
																cssClass="techReviewSelectStyle"
																name="finalTechReviewStatus" id="finalTechReviewStatus"
																list="#@java.util.LinkedHashMap@{'Rejected':'Rejected','ShortListed':'ShortListed','Processing':'Processing'}" />
														</span>
													</s:if>
													<s:else>
														<span id="onlineExamStatus"> <s:select
																cssClass="techReviewSelectStyle"
																name="finalTechReviewStatus" id="finalTechReviewStatus"
																list="#@java.util.LinkedHashMap@{'Rejected':'Rejected','ShortListed':'ShortListed','Selected':'Selected','Processing':'Processing'}" />
														</span>
													</s:else>

													<span id="examStatus"> </span>
												</div>

											</div>
											<span id="notOnline"> <label class="headingLabel">Skill
													Details:</label>

												<div id="reviewalignBox">
													<div class="inner-techReviewdiv-elements">

														<s:textarea type="text" name="consultantSkill"
															cssClass="reviewareacss" id="consultantSkill"
															disabled="true" />
													</div>

												</div> <label class="headingLabel">Rating
													Details:(**Rating between 1(min) to 10(max))</label> <span
												id="skillValid"></span>
												<div id="reviewalignBox">

													<div class="inner-techReviewdiv-elements required"
														id="skillRate">
														<label class="popuplabel1">Technical Skills </label>
														<s:textfield type="text" name="techSkill"
															cssClass="ratingInputStyle" id="techSkill" value=""
															onkeyup="skillRateValidation()"
															onkeypress="return acceptNumbers(event);" maxLength="11" />

														<label class="popuplabel1">Domain Skills </label>
														<s:textfield type="text" name="domainSkill"
															cssClass="ratingInputStyle" id="domainSkill" value=""
															onkeyup="skillRateValidation()"
															onkeypress="return acceptNumbers(event);" maxLength="11" />
														<label class="popuplabel1">Communication Skills</label>
														<s:textfield type="text" name="comSkill"
															cssClass="ratingInputStyle" id="comSkill" placeholder=""
															value="" onkeyup="skillRateValidation()"
															onkeypress="return acceptNumbers(event);" maxLength="11" />
													</div>
												</div>
											</span>
											<div class="" id="notesDiv">
												<label class="headingLabel">Notes:</label>

												<div id="reviewalignBox">

													<div class="inner-techReviewdiv-elements">

														<s:textarea id="consultantNotes" name="consultantNotes"
															cssClass="reviewareacss" type="text"
															onkeydown="techReviewsComments(this)"
															onblur="removeCommentsRemainMessage()" value=""
															disabled="true" />

													</div>
												</div>
											</div>
											<div class="" id="loctionDiv">
												<label class="headingLabel">Location:</label>

												<div id="reviewalignBox">

													<div class="inner-techReviewdiv-elements">

														<s:textarea id="consultantLocaiton"
															name="consultantLocaiton" cssClass="reviewareacss"
															type="text" placeholder="Enter Comments Here"
															onkeydown="techReviewsComments(this)"
															onblur="removeCommentsRemainMessage()" value=""
															disabled="true" />

													</div>
												</div>
											</div>
											<div class="required" id="CommentsDiv">
												<label class="headingLabel">Comments:</label>

												<div id="reviewalignBox">

													<div class="inner-techReviewdiv-elements">

														<s:textarea id="consultantComments"
															name="consultantComments" cssClass="reviewareacss"
															type="text" placeholder="Enter Comments Here"
															onkeydown="techReviewsComments(this)"
															onblur="removeCommentsRemainMessage()" value="" />
														<div class="charNum" id="remainingCharsDiv"></div>
													</div>
												</div>
											</div>



											<span id="online"> <s:hidden id="contechId"
													name="contechId" /> <s:hidden id="consultantId"
													name="consultantId" value="%{consult_id}" /> <s:hidden
													id="requirementId" name="consultantId"
													value="%{requirementId}" /> <label class="headingLabel">Online
													Exam Details:</label>

												<div class="skillQuestionBox">
													<label class="headingLabel " style="color: #56a5ec">Exam
														Performed On<span id="examsubmittedDate" />
													</label>
													<div class="row">

														<div class="col-sm-3" id="skillDivQuestion1">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion1"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion2">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion2"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion3">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion3"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion4">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion4"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion5">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion5"></span></label>
														</div>
													</div>
													<div class="row">

														<div class="col-sm-3" id="skillDivQuestion6">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion6"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion7">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion7"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion8">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion8"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion9">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion9"></span></label>
														</div>
														<div class="col-sm-3" id="skillDivQuestion10">
															<label class="skillQuestionsLabel"> <span
																id="skillQuestion10"></span></label>
														</div>
													</div>
												</div>

											</span> <span id="examButton"> &nbsp;&nbsp;&nbsp;
												<div class="pull-left ">
													<s:submit type="button" cssClass="cssbutton fa fa-times"
														value="Rejected"
														onclick="saveExamResult(this.value,'reviewDetails');"></s:submit>
												</div>
												<div class="pull-right ">
													<s:submit type="button" cssClass="cssbutton fa fa-check"
														value="ShortListed"
														onclick="saveExamResult(this.value,'reviewDetails');"></s:submit>
												</div>
											</span>
										</div>
									</div>
									<%--close of future_items--%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content end -->
			</section>
			<!--/form-->
		</div>
<div id="conRejectCommentsDiv" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header backgroundcolor">
        <button type="button" class="close consultResumeAttachment_popup_close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:#ffffff">Rejection Comments</h4>
      </div>
      <div class="modal-body">
        <p id="conRejComments"></p>
      </div>
    </div>
  </div>
</div>

<!-- consultant Interview notification accept or reject overlay start -->

								<div class="modal fade" id="InterviewNotificationStatus_popup" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
      <div class="backgroundcolor">
											<table>
												<tr>
													<td style=""><h4>
															<font color="#ffffff">&nbsp;&nbsp;Interview
																Notification Status
																 &nbsp;&nbsp; </font>
														</h4></td>
													<span class=" pull-right"><h5>
													
													<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
															<a href="" class="consultResumeAttachment_popup_close"
																data-dismiss="modal" ><i
																class="fa fa-times-circle-o fa-size" onclick="INSOverlayClose()"></i></a>&nbsp;
														</h5></span>
											</table>
										</div>
      
        <!-- <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div> -->
        <div class="modal-body">
          <s:hidden id="ctId" name="ctId"/>
											<s:hidden id="conINSValue" name="conINSValue"/>
											<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-11">
											<span id="INSresultMessage" style="width: auto"></span>
											</div>
											<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-10">
											Are you attending the Interview?
											</div>
											</div>
											<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-2">
											<div class="radio">
												<label><input type="radio" name="conins"
													id="coninsAccept" value="Accepted" onclick="showOrHideConINSComments();">Yes</label>
											</div>
											</div>
											<div class="col-sm-2">
											<div class="radio">
												<label><input type="radio" name="conins"
													id="coninsReject" value="Rejected" onclick="showOrHideConINSComments();">No</label>
											</div>
											</div>
											<div class="col-sm-7"></div>
											</div>
											<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-10">
											<textarea placeholder="Comments" id="conINSRejectionComments" class="form-control"
												name="conINSRejectionComments" style="display:none"></textarea>
											</div>
											</div>
											<br>
											<div class="row">
											<div class="col-sm-3 pull-right">
											<input type="button" id="conINSSubmit"value="submit" onclick="submitConInterviewNotificatioinStatus();" class="btn btn-primary"/>
											</div>	
											</div>
										
        </div>
        <!-- <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
									<!-- consultant Interview notification accept or reject overlay end -->
		
	</div>
	<footer id="footer">
		<!--Footer-->

		<div class="footer-bottom" id="footer_bottom">
			<div class="container">
				<s:include value="/includes/template/footer.jsp" />
			</div>
		</div>
	</footer>
	<!--/Footer-->


	<%-- <script type="text/javascript">
            var flag=document.getElementById("techSearch").value;
            if(flag=="search")
            {
                // alert("in fi");
                getSearchTechReviewList();
            }
    
        </script> --%>
	<script>
            setTimeout(function(){              
                $('#resume').remove();
            },3000);
        </script>

	<script language="JavaScript"
		src='<s:url value="/includes/js/general/popupoverlay.js"/>'></script>
		<script type="text/javascript"
		src="<s:url value="/includes/js/general/dynamicPagination.js"/>"></script>
		
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/jquery.scrollUp.min.js"/>"></script>

	<script type="text/javascript">
            var recordPage=10;
            function pagerOption(){
                //alert("recordPage")
                var paginationSize = document.getElementById("paginationOption").value;
                if(isNaN(paginationSize))
                {
                       
                }
                recordPage=paginationSize;
                //alert(recordPage)
                $('#techReviewTable').tablesPaginate({navigateType:'navigator'},recordPage,techReviewTable);

            };
            $('#techReviewTable').tablesPaginate({navigateType:'navigator'},recordPage,techReviewTable);
        </script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
</body>
</html>