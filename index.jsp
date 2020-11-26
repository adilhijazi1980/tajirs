<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String pageBodyAdditionalClass = "index_page";
%>
<%-- <%@ page import="com.etn.lang.ResultSet.Set, com.etn.sql.escape"%> --%>
<%@ page import="javax.sql.rowset.CachedRowSet"%>
<%-- <jsp:useBean id="Etn" scope="session" class="com.etn.beans.Contexte" /> --%>
<jsp:useBean id="Taj" scope="session" class="com.tajirs.beans.Context" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Pakistan's most reliable Business Directory | Tajirs.com</title>

<meta name="robots" content="index, follow">
<link href="http://www.tajirs.com/" rel="canonical" />

<meta name="description"
	content="Tajirs.com offers Pakistan's most reliable online business directory. Listing suppliers, traders, services, indenting agents, manufacturers, exporters & importers.">

<meta name="keywords"
	content="Tajirs.com, Tajirs, Trade, Trade in Pakistan, Traders, Traders in Pakistan, Pakistan, Business, Businesses, Business in Pakistan, Businesses in Pakistan, Pakistan's, most, reliable, in Pakistan,
Pakistan's most reliable, directory, directories, services, listing, business listing, traders, traders in Pakistan, directory, directories, traders directory, trader's directory, trader's directory, trader's directories,
traders services, trader's services, services in Pakistan, indenting agents, indenting agents in Pakistan, indenting agents directory, indenting agents directory, exporters, exporters in Pakistan, importers,
importers in Pakistan, importers and exporters, importers and exporters in Pakistan, import and export in Pakistan, services directory, manufacturers, manufacturers in Pakistan,
manufacturers directory, exporters directory, importers directory, exporters listing, importers listing, supplier, suppliers, suppliers in Pakistan, supplier listing, suppliers listing, traders listing, manufacturers listing, services listing, indenting agents listing.">
<!-- <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> -->

<%@ include file="include/head_includes.jsp"%>
<!-- <link rel="stylesheet" href="css/index.css"> -->
</head>
<%@ page import="java.sql.SQLException"%>
<%@ include file="include/header.jsp"%>
<main>
<div class="container bg-white">
	<div class="rslides_container">
		<ul class="rslides">
			<%
				// 				String hrefListingTextile = "listing.jsp?catalog_id=56&page_no=1";
				// 					String hrefListingMiscellaneous = "listing.jsp?catalog_id=40&page_no=1";
				// 					String hrefListingAutomobile = "listing.jsp?catalog_id=3&page_no=1";

				String hrefListingTextile = updatedRequestContextPath + "/category/TEXTILE?catalog_id=56&page_no=1";
				String hrefListingMiscellaneous = updatedRequestContextPath
						+ "/category/MISCELLANEOUS?catalog_id=40&page_no=1";
				String hrefListingAutomobile = updatedRequestContextPath + "/category/AUTOMOBILE?catalog_id=3&page_no=1";

				// 					if (isPROD) {
				// 						hrefListingTextile = "/category/56/1/TEXTILE";
				// 						hrefListingMiscellaneous = "/category/40/1/MISCELLANEOUS";
				// 						hrefListingAutomobile = "/category/3/1/AUTOMOBILE";
				// 					}
			%>
			<li><a href="<%=hrefListingTextile%>"><img
					src="<%=updatedRequestContextPath%>/images/textile.jpg"
					alt="textile"></a></li>
			<li><a href="<%=hrefListingMiscellaneous%>"><img
					src="<%=updatedRequestContextPath%>/images/miscellaneous.jpg"
					alt="miscellaneous"></a></li>
			<li><a href="<%=hrefListingAutomobile%>"><img
					src="<%=updatedRequestContextPath%>/images/automobile.jpg"
					alt="automobile"></a></li>
		</ul>
	</div>
	<h1
		style="font-size: 14px; padding-top: 9px; margin-bottom: 9px; text-align: center; clear: both">
		Tajirs: Listing more than <span style="color: #2ab5e8;">16000
			suppliers</span> across Pakistan.
	</h1>
	<div style="height: 200px;" class="row">
		<div style="height: 100%"
			class="col-sm-4 col-xs-12 popular-categories">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">Popular Categories</h3>
				</div>
				<div class="list-group">
					<%
						// String popCatSelectQuery = "SELECT pc.category_type, sequence_number, pc.category_id, "
						//+ "CASE WHEN pc.category_type = 'catalog' THEN c.name "
						//+ "ELSE f.name END AS name FROM (tajirs_popular_categories pc "
						//+ "LEFT OUTER JOIN catalogs c ON pc.category_id = c.id) LEFT OUTER JOIN "
						//+ "familie f ON pc.category_id = f.id ORDER BY sequence_number ASC";
						String popCatSelectQuery = "select c.name, p.catalog_id, count(p.catalog_id) from tajirs_suppliers_detail_product tsdp "
								+ "inner join products p on p.id=tsdp.product_id " + "inner join catalogs c on p.catalog_id=c.id "
								+ "group by p.catalog_id order by count(p.catalog_id) desc limit 5";
						CachedRowSet popCatDropdownCRS = Taj.executeSelectCachedRowSet(popCatSelectQuery);
						if (popCatDropdownCRS != null) {
							while (popCatDropdownCRS.next()) {
								String hrefListingCatalog = updatedRequestContextPath + "/category/"
										+ encodeURI(parseNull(popCatDropdownCRS.getString("name"))) + "?catalog_id="
										+ parseNull(popCatDropdownCRS.getString("catalog_id")) + "&page_no=1";
								// 									if (isPROD) {
								// 										hrefListingCatalog = "/category/"
								// 												+ parseNull(popCatDropdownCRS.getString("catalog_id")) + "/1/"
								// 												+ encodeURI(parseNull(popCatDropdownCRS.getString("name")));
								// 									}
					%><a class="list-group-item" href='<%=hrefListingCatalog%>'><%=parseNull(popCatDropdownCRS.getString("name"))%></a>
					<%
						}
						}
					%>
				</div>
			</div>
		</div>
		<%
			String hrefListingElectricAndAppliances = updatedRequestContextPath
					+ "/category/ELECTRIC_AND_APPLIANCES?catalog_id=19&page_no=1";
			String hrefListingFoodAndAllied = updatedRequestContextPath
					+ "/category/FOOD_AND_ALLIED?catalog_id=23&page_no=1";
			// 			if (isPROD) {
			// 				hrefListingElectricAndAppliances = "/category/19/1/ELECTRIC_AND_APPLIANCES";
			// 				hrefListingFoodAndAllied = "/category/23/1/FOOD_AND_ALLIED";
			// 			}
		%>
		<div style="height: 100%" class="col-sm-4 col-xs-12">
			<a href="<%=hrefListingElectricAndAppliances%>"
				style="height: 100%; background-image: url(<%=updatedRequestContextPath%>/images/electric_appliances.jpg); display: block"
				class="image-cover"></a>
		</div>
		<div style="height: 100%" class="col-sm-4 col-xs-12">
			<a href="<%=hrefListingFoodAndAllied%>"
				style="height: 100%; background-image: url(<%=updatedRequestContextPath%>/images/food_allied.jpg); display: block"
				class="image-cover"></a>
		</div>
	</div>
	<ul
		style="list-style: none; padding-top: 30px; margin-left: 0; padding-left: 0; float: left">
		<li class="pull-left" style="margin-right: 15px; padding: 5px;">Follow
			Tajirs on</li>
		<li class="pull-left" style="margin-right: 15px;"><a
			target="_blank" href="https://www.facebook.com/NewTajirsPortal"><img
				src="<%=updatedRequestContextPath%>/images/facebook.png"
				alt="facebook"></a></li>
		<li class="pull-left" style="margin-right: 15px;"><a
			target="_blank" href="https://www.linkedin.com/company/tajirsportal"><img
				src="<%=updatedRequestContextPath%>/images/linkedin.png"
				alt="linkedin" /></a></li>
		<li class="pull-left"><a target="_blank"
			href="https://twitter.com/TajirsPortal"><img
				src="<%=updatedRequestContextPath%>/images/twitter.png"
				alt="twitter" /></a></li>
	</ul>
</div>
</main>
<%@ include file="include/footer.jsp"%>