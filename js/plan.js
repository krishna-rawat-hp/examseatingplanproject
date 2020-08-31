
//code for fetch subject code, exam date and total Student registered
var  std_cnt;
var request;
function myFunction() {
	 
	  var x = document.getElementById("plan");
	  var sub = document.getElementById("subcode").value;
	  var date = document.getElementById("exmdate").value;
	  if(sub != "" && date != ""){
		  var v1 = sub;
		  var url = "./ajax/plan_ajax.jsp?sub="+v1;
		  
		  if (window.XMLHttpRequest) {
		        // code for modern browsers
		        request = new XMLHttpRequest();
		    } else {
		        // code for old IE browsers
		        request = new ActiveXObject("Microsoft.XMLHTTP");
		    } 
		  try{
			  request.onreadystatechange = getInfo;
			  request.open("GET",url,true);
			  request.send();
		  }catch(e){ alert("Exception Occured.........");}
		  
		  if (x.style.display === "none") {
	    		x.style.display = "block";
	  	  }
	  }else{
		  alert("must Fill date and sub");
	  }
		 document.getElementById("test").innerHTML = sub;
		 document.getElementById("test1").innerHTML = date;
		 document.getElementById("std_end").value = "";
	}

	function getInfo(){
		if(request.readyState === 4 && request.status === 200){
			var v1 = request.responseText.trim();
			if(v1 == ""){
				alert("Wrong Subject Id");
				window.location="./create_plan.jsp";
			}else{
				std_cnt = v1;
				document.getElementById("test3").innerHTML = v1;
			}
		}
	}
	
	
// code for fetching subject name using subject code
	
	var request1;
	function getSubName(){
		var x = document.getElementById("plan");
		  var sub = document.getElementById("subcode").value;
		  var date = document.getElementById("exmdate").value;
		  if(sub != "" && date != ""){
			  var v1 = sub;
			  var url = "./ajax/plan_ajax1.jsp?sub1="+v1;
			  
			  if (window.XMLHttpRequest) {
			        // code for modern browsers
			        request1 = new XMLHttpRequest();
			    } else {
			        // code for old IE browsers
			        request1 = new ActiveXObject("Microsoft.XMLHTTP");
			    } 
			  try{
				  request1.onreadystatechange = sendInfo;
				  request1.open("GET",url,true);
				  request1.send();
			  }catch(e){ alert("Exception Occured.........");}
			  
			  if (x.style.display === "none") {
		    		x.style.display = "block";
		  	  }
		  }else{
			  alert("must Fill date and sub");
		  }
	}
	
	function sendInfo(){
		if(request1.readyState === 4 && request1.status === 200){
			var val = request1.responseText.trim();
			document.getElementById("test2").innerHTML = val;
		}
	}
	
	
// code for fetch table 
	
	var request2;
	function getTable(){
		var x = document.getElementById("plan");
		  var sub = document.getElementById("subcode").value;
		  var date = document.getElementById("exmdate").value;
		  if(sub != "" && date != ""){
			  var v1 = sub;
			  var v2 = date;
			  var url = "./ajax/ajax_table.jsp?sub="+v1+"&exmdate="+v2;
			  
			  if (window.XMLHttpRequest) {
			        // code for modern browsers
			        request2 = new XMLHttpRequest();
			    } else {
			        // code for old IE browsers
			        request2 = new ActiveXObject("Microsoft.XMLHTTP");
			    } 
			  try{
				  request2.onreadystatechange = getTbl;
				  request2.open("GET",url,true);
				  request2.send();
			  }catch(e){ alert("Exception Occured.........");}
			  
			  if (x.style.display === "none") {
		    		x.style.display = "block";
		  	  }
		  }else{
			  alert("must Fill date and sub");
		  }
	}
	var d =0;
	function getTbl(){
		if(request2.readyState === 4 && request2.status === 200){
			
			var val = request2.responseText.trim();
			if(val.length >=7){
				var a = null;
				a = val.split("*");
				
				var lastval = a[a.length-4];
				var p1 = parseInt(lastval);
				
				var rem = std_cnt-p1;
				document.getElementById("test3").innerHTML = rem;
				if(rem == 0){
					document.getElementById("std_begin").value = "";
					document.getElementById("std_end").value = "";
				}else{
					document.getElementById("std_begin").value = p1+1;
				}
			}else{
				var reg_std = document.getElementById("test3").innerText;
				document.getElementById("test3").innerHTML = reg_std;
				document.getElementById("std_begin").value = 1;
			}
			
			if(a == null){
				alert("No Plan Exist !!");
			}else{
			for(var i=0;i<(a.length-1);i=i+7){
				d++;
				var sno = a[i];
				var subcode = a[i+1];
				var date = a[i+2];
				var begin = a[i+3];
				var end = a[i+4];
				var room = a[i+5];
				var total = a[i+6];
				
				
				var tbl = document.getElementById("Mytable");
				var row = tbl.insertRow();
				row.style.fontWeight="bold";
				var c1 = row.insertCell();
				var c2 = row.insertCell();
				var c3 = row.insertCell();
				var c4 = row.insertCell();
				var c5 = row.insertCell();
				var c6 = row.insertCell();
				var c7 = row.insertCell();
				
				c1.innerHTML = sno;
				c2.innerHTML = subcode;
				c3.innerHTML = date;
				c4.innerHTML = begin;
				c5.innerHTML = end;
				c6.innerHTML = room;
				c7.innerHTML = total;
			}
			}
		}
	}
	
	
	function addRooms(roomEle, roomno){
	    var room = document.getElementById(roomEle);
	    var option = document.createElement("option");
	    option.value = roomno;
	    option.text = roomno;
	    room.add(option); 
	}

	function clearRooms(roomEle){
	    var select = document.getElementById(roomEle);
	    var length = select.options.length;
	    for (i = length; i>=0; i--) {
	        select.remove(i);
	    }
	}
	
	var request3;
	function getDrowpdown(){
		var x = document.getElementById("plan");
		  var sub = document.getElementById("subcode").value;
		  var date = document.getElementById("exmdate").value;
		  if(sub != "" && date != ""){
			  var v1 = sub;
			  var url = "./ajax/ajax_drowp.jsp?sub2="+v1;
			  
			  if (window.XMLHttpRequest) {
			        // code for modern browsers
			        request3 = new XMLHttpRequest();
			    } else {
			        // code for old IE browsers
			        request3 = new ActiveXObject("Microsoft.XMLHTTP");
			    } 
			  try{
				  request3.onreadystatechange = drowpInfo;
				  request3.open("GET",url,true);
				  request3.send();
			  }catch(e){ alert("Exception Occured.........");}
			  
			  if (x.style.display === "none") {
		    		x.style.display = "block";
		  	  }
		  }else{
			  alert("must Fill date and sub");
		  }
	}
	function drowpInfo(){
		if(request3.readyState === 4 && request3.status === 200){
			var val = request3.responseText;
			var arr = val.split("*");
			clearRooms("room");
            addRooms("room","Select Room");
            for (let i = 0; i < (arr.length)-1; i++) {
                addRooms("room", arr[i]);
            }
		}
	}
	
	
	
	var request4;
	function getCapacity(){
		var x1 = document.getElementById("room").value;
		var x = document.getElementById("plan");
		  var sub = document.getElementById("subcode").value;
		  var date = document.getElementById("exmdate").value;
		  if(sub != "" && date != "" && x1 !="Select Room"){
			  var url = "./ajax/room_cap.jsp?roomno="+x1;
			  
			  if (window.XMLHttpRequest) {
			        // code for modern browsers
			        request4 = new XMLHttpRequest();
			    } else {
			        // code for old IE browsers
			        request4 = new ActiveXObject("Microsoft.XMLHTTP");
			    } 
			  try{
				  request4.onreadystatechange = getCap;
				  request4.open("GET",url,true);
				  request4.send();
			  }catch(e){ alert("Exception Occured.........");}
			  
			  if (x.style.display === "none") {
		    		x.style.display = "block";
		  	  }
		  }else{
			  alert("Select Room");
		  }
	}
	
	var cap;
	function getCap(){
		if(request4.readyState === 4 && request4.status === 200){
			var val = request4.responseText;
			var val1 = parseInt(val);
			cap = val;
			var caphalf = val1/2;
			
			var reg_std = document.getElementById("test3").innerText;
			var comp_rem = parseInt(reg_std);
			
			var std = document.getElementById("std_begin").value;
			var std1 = parseInt(std);
			
			if(comp_rem == 0){
				document.getElementById("std_end").value = "";
			}else if(comp_rem>=caphalf){
				document.getElementById("std_end").value = (std1+caphalf)-1;
			}else{
				document.getElementById("std_end").value = (std1+comp_rem)-1;
			}
		}
	}
	
// function for clear the table data
	function clearTbl(){
			document.getElementById("Mytable").deleteRow(1);
	}
	
	
// function for adding plan
	
	var request5;
	function addPlan(){
		var x = document.getElementById("plan");
		  var sub = document.getElementById("subcode").value;
		  var date = document.getElementById("exmdate").value;
		  var std_beg = document.getElementById("std_begin").value;
		  var std_end = document.getElementById("std_end").value;
		  var room = document.getElementById("room").value;
		  var a = parseInt(std_beg);
		  var b = parseInt(std_end);
		  var total_std = (b-a)+1;
		  
		  if(sub != "" && date != "" && room !="Select Room" && std_beg != "" && std_end != ""){
			  var url = "./ajax/addplane_db.jsp?sub="+sub+"&date="+date+"&std_beg="+std_beg+"&std_end="+std_end+"&room="+room+"&total="+total_std+"&cap="+cap;
			  
			  if (window.XMLHttpRequest) {
			        // code for modern browsers
			        request5 = new XMLHttpRequest();
			    } else {
			        // code for old IE browsers
			        request5 = new ActiveXObject("Microsoft.XMLHTTP");
			    } 
			  try{
				  request5.onreadystatechange = getDetail;
				  request5.open("GET",url,true);
				  request5.send();
			  }catch(e){ alert("Exception Occured.........");}
			  
			  if (x.style.display === "none") {
		    		x.style.display = "block";
		  	  }
		  }else{
			  alert("Select Room or No student remaining");
		  }
	}
	
	function  getDetail(){
		if(request5.readyState === 4 && request5.status === 200){
			var val = request5.responseText.trim();
			
			if(val == "1"){
				alert("Record Inserted Successfully :)");
				document.getElementById("std_end").value = "";
				getTable();
				for(let i=0;i<=d;i++){
					clearTbl();
				}
				
			}else if(val == "2"){
				alert("Sorry Duplicate Record !!!");
			}else if(val == "3"){
				alert("Sorry Room Capacity Is Full !!");
			}else{
				alert("Unable to Insert Record :(");
			}
		}
	}