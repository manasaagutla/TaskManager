<!-- ViewTasks.jsp -->
<%-- This JSP retrieves user tasks based on 
whichever emailid the user login --%>
<%@ page import="java.sql.*" %>
<p align="right"><a href="LogoutServlet">Logout</a></p>
<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");	
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",
		"todo", "todo");
		Statement stmt=con.createStatement();
		String email=(String)session.getAttribute("email");
		ResultSet rs=stmt.executeQuery("select * from task where regid=(select regid from register where email='"+email+"')");

		out.println("<table align='center' width='75%' border='1'>");
		out.println("<tr>");
		out.println("<th>Task ID</th>");
		out.println("<th>Task Name</th>");
		out.println("<th>Task Date</th>");
		out.println("<th>Task Status</th>");
		out.println("</tr>");
		
		while(rs.next()) {
			int taskid=rs.getInt(1);
			String taskName=rs.getString(2);
			String taskDate=rs.getString(3);
			int taskStatus=rs.getInt(4);
			out.println("<tr>");
			out.println("<td>"+taskid+"</td>");
			out.println("<td>"+taskName+"</td>");
			out.println("<td>"+taskDate+"</td>");
			/*if(taskStatus==1) {
				out.println("<td><font color='red'><a href='TaskCompletedServlet?taskid="+taskid+">Completed</a></font></td>");
			} else if(taskStatus==3) {
				out.println("<td><strike>Completed</strike></td>");
			} else {}*/
			out.println("<td>"+taskStatus+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		rs.close(); stmt.close(); con.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<fieldset style="margin:auto 30%;">
	<legend>New Task</legend>
	<form method="post" action="./NewTaskServlet">
		<table border='1' align='center' width='40%'>
			<tr>
				<th>Task Name</th>
				<td><input type="text" name="taskName" size="20"></td>
			</tr>
			<tr>
				<th>Task Date</th>
				<td><input type="text" name="taskDate" placeholder="30-4-2024"></td>
			</tr>
			<tr>
				<th>Task Status</th>
				<td>
					<select name="taskStatus" size="1" readonly>
						<option value="1">Not Yet Started</option>
						<option value="2">Pending</option>
						<option value="3">Completed</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="Add"></td>
				<td><input type="reset" name="reset" value="Clear"></td>
			</tr>
		</table>
	</form>
</fieldset>
