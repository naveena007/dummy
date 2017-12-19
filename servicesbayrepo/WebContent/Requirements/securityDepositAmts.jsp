<%-- 
    Document   : Security Deposit Amount details
    Created on : Sep 14, 2017, 05:50:23 PM
    Author     : Manikanta
--%>

<%@ page contentType="text/html; charset=UTF-8"
	errorPage="../../exception/403.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.mss.msp.util.ApplicationConstants"%>
<!DOCTYPE html>
<html>
<head>
<!-- new styles -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ServicesBay ::
	Security&nbsp;Deposit&nbsp;Amounts&nbsp;Page</title>

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
<link rel="stylesheet" type="text/css"
	href='<s:url value="/includes/css/general/addAccountStyles.css"/>'>

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

<script language="JavaScript"
	src='<s:url value="/includes/js/general/sortable.js"/>'></script>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						document.getElementById("loadingSecurityDepositAmts").style.display = "none";

					});
	function sortables_init() {
		// Find all tables with class sortable and make them sortable
		if (!document.getElementsByTagName)
			return;
		tbls = document.getElementById("securityDepositAmountsResults");
		sortableTableRows = document
				.getElementById("securityDepositAmountsResults").rows;
		sortableTableName = "securityDepositAmountsResults";
		for (ti = 0; ti < tbls.rows.length; ti++) {
			thisTbl = tbls[ti];
			if (((' ' + thisTbl.className + ' ').indexOf("sortable") != -1)
					&& (thisTbl.id)) {
				ts_makeSortable(thisTbl);
			}
		}
	};
</script>
</head>
<body oncontextmenu="return false" style="overflow-x: hidden" onload="return getSecurityDepositAmountsListLoad();">
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

				<div class="container">
					<div class="row">
						<s:include value="/includes/menu/LeftMenu.jsp" />
						<!-- content start -->
						<div class="col-sm-12 col-md-9 col-lg-9 right_content"
							style="background-color: #fff">
							<div class="features_items">
								<div class="col-lg-12 ">
									<div class="" id="profileBox"
										style="float: left; margin-top: 5px">

										<div class="backgroundcolor">
											<div class="panel-heading">
												<h4 class="panel-title">


													<font color="#ffffff">Security Deposit&nbsp;Amounts</font>
													<i id="updownArrow"
														onclick="toggleContent('getSecurityDepositAmountsList')"
														class="fa fa-minus"></i>
												</h4>
											</div>

										</div>
										<!-- content start -->


										<div class="row">
											<s:form action="/Requirements/getSecurityDepositAmountsList"
												theme="simple">
												<%-- <div class="col-sm-6">
                                                            <label class="labelStylereq" style="color:#56a5ec;">Security deposit Title</label>
                                                            <s:textfield id="securityDepositTitle"
                                                                         cssClass="form-control"
                                                                         name="securityDepositTitle"
                                                                         tabindex="3"
                                                                         placeholder="Security Deposit Title" 
                                                                          value="%{securityDepositTitle}"
                                                                         /> 
                                                   </div> --%>

												<br>

												<div class="col-sm-2 pull-right">

													<s:submit type="button" cssStyle="margin:5px 0px;"
														id="accAuthSearchButton"
														cssClass="add_searchButton form-control" tabindex="3"
														value="">
														<i class="fa fa-search"></i>&nbsp;Search</s:submit>
												</div>
												<!-- <div class="col-sm-2 pull-right">
                                                         <div align="right">
                                                                <button type="button" id="accAuthAddButton" style="margin: 5px 0px;" tabindex="4" class="add_searchButton form-control addAuthAccOverlay_popup_open cssbutton" onclick="addAuthAccOverlayFun();addOrUpdateSecurityChecking('a');clearSecurityDepositValuesForAdd();"  style=""><i class="fa fa-plus-square"></i>&nbsp;Add</button>
                                                        </div>
                                                        </div> -->



											</s:form>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div id="loadingSecurityDepositAmts" class="loadingImg">
													<span id="LoadingContent"> <img
														src="<s:url value="/includes/images/Loader1.gif"/>"></span>
													></span>
												</div>
												<s:form>
													<div class="emp_Content" id="emp_div" align="center"
														style="display: none">
														<table id="securityDepositAmountsResults"
															class="responsive CSSTable_task sortable" border="5"
															cell-spacing="2">
															<tbody>
																<tr>
																  <s:if test="#session.typeOfUsr=='AC'">
																  <th class="unsortable">Vendor Name</th> 
																  
																  <th class="unsortable">Security Deposit Total Amount</th>

																	<th class="unsortable">Remaining Amount</th>	

																	<th class="unsortable">Vendor Total Amount</th>

																	<th class="unsortable">Vendor Remaining Amount</th>
																  </s:if>
																  <s:else>
																  
																  <th class="unsortable">Customer Name</th>
																  
																  <th class="unsortable">Security Deposit Total Amount</th>

																	<th class="unsortable">Remaining Amount</th>
													
																	<th class="unsortable">Vendor Total Amount</th>

																	<th class="unsortable">Vendor Remaining Amount</th>
																  </s:else>
																	
																	<!-- <th class="unsortable">Comments</th> -->

																	<!-- <th class="unsortable">Last Activity By</th> -->
																	
																	<th class="unsortable">Last Activity On</th>
																</tr>
						
															</tbody>
														</table>
														<br />
														
															<label> Display <select id="paginationOption"
																tabindex="5" class="disPlayRecordsCss"
																onchange="pagerOption()" style="width: auto">
																	<option>10</option>
																	<option>15</option>
																	<option>25</option>
																	<option>50</option>
															</select> Security deposit amounts per page
															</label>
														
														<div align="right" id="pageNavPosition"
															style="margin-right: 0vw; display: none"></div>
													</div>
												</s:form>


											</div>
										</div>
										<%--</s:form>--%>
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
	</div>
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

	<!--/Footer-->
	<script>
		sortables_init();
	</script>

	<script type="text/javascript"
		src="<s:url value="/includes/js/general/pagination.js"/>"></script>

	<script type="text/javascript">
		var recordPage = 10;
		function pagerOption() {
			var paginationSize = document.getElementById("paginationOption").value;
			if (isNaN(paginationSize)) {
			}
			recordPage = paginationSize;
			$('#securityDepositAmountsResults').tablePaginate({
				navigateType : 'navigator'
			}, recordPage);
		};
		$('#securityDepositAmountsResults').tablePaginate({
			navigateType : 'navigator'
		}, recordPage);
	</script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/placeholders.min.js"/>"></script>
	<script language="JavaScript"
		src='<s:url value="/includes/js/Ajax/GeneralAjax.js"/>'></script>
	<script type="text/JavaScript"
		src="<s:url value="/includes/js/general/popupoverlay.js"/>"></script>
	<div
		style="display: none; position: absolute; top: 170px; left: 320px; overflow: auto; z-index: 1900000"
		id="menu-popup">
		<table id="completeTable" border="1" bordercolor="#e5e4f2"
			style="border: 1px dashed gray;" cellpadding="0" class="cellBorder"
			cellspacing="0" />
	</div>

</body>
</html>