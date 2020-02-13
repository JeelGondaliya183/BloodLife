
<div class="sidebar" data-color="black" data-active-color="danger">
	<!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
	<div class="logo" style="text-align: center">
		<a href="/homepage" class="simple-text logo-normal"> Blood Life </a>
	</div>
	<div class="sidebar-wrapper">
		<ul class="nav">

			<% 
				//if the user is a donor then don't display all the options to the user.
				if(session.getAttribute("role")!=null){
				String role=session.getAttribute("role").toString();
		 	   if(role.equals("organization")){
			%>
			<li id="dashboard"><a href="dashboardPage"> <i
					class="fas fa-clipboard-list"></i>
				<p>Dashboard</p>
			</a></li>
			<li id="donorJsp"><a href="/donorPage"> <i
					class="fas fa-procedures"></i>
					<p>Donor</p>
			</a></li>
			<li id="receiverJsp"><a href="/receiverPage"> <i
					class="fas fa-user-injured"></i>
					<p>Receiver</p>
			</a></li>

			<li id="reportJsp"><a href="report"> <i
					class="fas fa-chart-bar"></i>
					<p>Report</p>
			</a></li>
			<li id="eventsJsp"><a href="/eventsManagement"> <i
					class="fas fa-star-of-david"></i>
					<p>events</p>
			</a></li>
			<li id="galleryJsp"><a href="/galleryManagement"> <i
					class="fas fa-images"></i>
					<p>Gallery</p>
			</a></li>
			<%} 
			}
			%>
			<%

				if(session.getAttribute("role")!=null){
					String role=session.getAttribute("role").toString();
					if(role.equals("admin")){
			%>
			<li id="organizationJsp"><a href="/organizationPage"> <i
				class="fa fa-hospital-o"></i>
			<p>Organization</p>
			<li id="orgUsersJsp"><a href="/usersPage"> <i
					class="fa fa-hospital-o"></i>
				<p>Users</p>
			</a></li>
			<%}
			}
			%>
		</ul>
	</div>
</div>