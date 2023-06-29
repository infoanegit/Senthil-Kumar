<cfoutput>
<!DOCTYPE html>
<html>
   <head>
		<title>Table Entry</title>
		<link rel="icon" type="imageicon" href="./assets/images/table.png">
		<link rel="stylesheet" href="./assets/css/style.css">
		<script src="./assets/js/jquery.min.js"></script>
   </head>
   <cfif structKeyExists(form,"LogoutBtn")>
        <cfset StructClear(Session)>
		<cfdump  var="#form#">
        <cflocation url="index.cfm" addToken="false">
    </cfif>

    <cfset dataOBJ= createObject("component","tagcloud")>
	<cfset dataInfo = dataOBJ.getformData()> 
	<cfif structKeyExists(url,"id")>
		<cfset empInfo = dataOBJ.deleteData("#url.id#")> 
		<cflocation url="list.cfm" addToken="false">
	</cfif>
	 
	<body>
	<form method="post">
		<div class="text-center mx-auto mt-4"><input type="submit" value="Logout" name="LogoutBtn" id="logout" class="btn btn-danger btn-md"></div>
	</form>
    	<div class="col-sm-12 bg-muted text-white w-25 mt-3 p-3 mx-auto text-center"><h5>List of Details</h5></div>
		<table class="table table-hover table-bordered w-50 table-fixed mx-auto text-center mt-2">
			<thead>
				<tr class="table-info">
					<th>Page Name</th>
					<th>Description</th>
					<cfif session.role eq "Editor" OR session.role eq "Admin">
						<th colspan = "2">Actions</th>
					</cfif>
				</tr>
			</thead>
			<tbody>
				<cfloop query="#datainfo#">
					<tr class="table-dark">
						<td>#datainfo.Name#</td>
						<td>#datainfo.Description#</td>
						<cfif session.role eq "Admin">
							<td><a href="form.cfm?id=#dataInfo.id#" class="btn btn-warning">Edit</a></td>
							<td><input type="button" class="btn btn-danger delete_btn btn-md" id="delete_btn" data-id="#dataInfo.ID#" value="Delete"></td>
						<cfelseif session.role eq "Editor">
							<td><a href="form.cfm?id=#dataInfo.id#" class="btn btn-warning btn-md">Edit</a></td>
						<cfelse>
						</cfif>
					</tr>
				</cfloop>
			</tbody>
		</table>
		<cfif session.role eq "Admin" || session.role eq "Editor">
			<div class= "text-center mx-auto"  >
				<a href="form.cfm" class="btn btn-info btn-md">ADD NEW</a>
			</div>
		</cfif>
			
		
		
    <body>
	<style>
		body {
				background-image: linear-gradient(to right, ##0099f7, ##f11712);
		}
     </style>
	
</html>
<!--- <cfdump  var="#arguments#"> --->
</cfoutput>


<script>
	$(".delete_btn").on("click",function(){
		var tblId = $(this).data('id'); 
		if (confirm("You Sure you want to delete?") == true) {
			window.location.href = `${window.location.href.split('?')[0]}?id=${tblId}`;
		} else {
			window.location.href = window.location.href;
		}
	});
</script>  

