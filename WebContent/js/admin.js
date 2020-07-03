function member() {
		$.ajax({
			type : "post",
			url : "/shop/admin?cmd=memberList",
			dataType : "json"
		}).done(function(result) {
			alert(result);
			renderMembers(result);
			
			$(document).ready(function() {
				  $('#dataTable').DataTable();
				});

		}).fail(function(error) {
			alert("실패..");
		});
	
	function renderMembers(members){
		for(var member of members){
			$("#content__body").append(makeMember(member));
		}
	}
	function makeMember(member){
		var html = `<tr role="row" class="odd">`;
		html += `<td class="sorting_${status.count}">${member.username}</td>`;
		html += `<td>${member.name}</td>`;
		html += `<td>${member.birthdate}</td>`;
		html += `<td>${member.gender}</td>`;
		html += `<td>${member.address}</td>`;
		html += `<td>${member.phone}</td>`;
		html += `<td>${member.email}</td>`;
		html += `<td>${member.agreement}</td>`;
		html += `<td>`;
		html += `<a href="#" class="btn btn-danger btn-circle btn-sm">`;
		html += `<i class="fas fa-trash"></i>`;
		html += `</a>`;
		html += `</td>`;
		html += `</tr>`;
		return html;
	}
}