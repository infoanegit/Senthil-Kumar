<cfoutput>
	<cfparam name="dataInfo.Name" default="">
	<cfparam name="dataInfo.Description" default="">
	<html>
		<head>
			<title>Simple CMS</title>
			<link rel="icon" type="imageicon" href="./assets/images/form.png">
			<link rel="stylesheet" href="./assets/css/style.css">
			<script src="./assets/js/jquery.min.js"></script>
		</head>
		<cfif structKeyExists(URL,"id")>
			<cfset dataInfo = APPLICATION.dataOBJ.getformdata("#URL.id#")> 
		</cfif>
		<cfif structKeyExists(FORM,"submit")>
			<cfif structKeyExists(URL,"id")>
				<cfset APPLICATION.dataOBJ.updateformData(id=URL.id,pageName=FORM.pageName,desc=FORM.description)>
			<cfelse>
				<cfset APPLICATION.dataOBJ.insertformData(pageName=FORM.pageName,desc=FORM.description)>
			</cfif>
			<cflocation url="list.cfm" addToken="false">
		</cfif>
		<body>
			<form name="newform" method="post" onSubmit="return validateform();" class="mt-5" id="myform">
				<div class=" container-fluid mx-auto w-50 rounded">
					<div class="row text-center">
						<div class="col-sm-12 bg-dark text-warning shadow-lg w-50 p-3 mx-auto text-center"><h3>Enter Page Details</h3></div>
					</div>
					<div class="container  mx-auto mt-0 p-3 bg-dark text-white rounded">
						<div class="row p-2">
							<h5 for="Name" class="form-label text-info"> Page Name:*</h5><br />
						</div>
						<div class="row">
							<div class="col-sm-12">
								<input type="text" placeholder="enter the pagename" class="form-control" name="pageName" id="pageName" value="#dataInfo.Name#"/>
							</div>
						</div>
						<div class="row p-2" >
							<h5 for="Description" class="form-label text-info"> Description:*</h5><br />
						</div>
						<div class="row">
							<div class="col-sm-12">
								<textarea class="form-control" name="description"id="desc" placeholder="Give your Description" >#dataInfo.Description#</textarea>
								<br/>
							</div>   
						</div>                   
					</div>
					<div class="row mt-4 text-center">
						<div class="col-sm-12">
							<input type="submit" value="submit" name="submit" class="btn-lg btn-success shadow-lg">
						</div>   
					</div>
				</div>
			</form>
		</body>
	</html>
	<style>
		body {
			background-image: linear-gradient(to right, ##4FE6F1, ##A6A6DE,##ED90CF);
		}   
	</style>
</cfoutput>
