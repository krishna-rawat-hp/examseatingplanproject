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

var request1;

	function getDropdown(){
			  var url = "./ajax/Invigilator_ajax.jsp";
			  if (window.XMLHttpRequest) {
			        // code for modern browsers
			        request1 = new XMLHttpRequest();
			    } else {
			        // code for old IE browsers
			        request1 = new ActiveXObject("Microsoft.XMLHTTP");
			    } 
			  try{
				  request1.onreadystatechange = dropInfo;
				  request1.open("GET",url,true);
				  request1.send();
			  }catch(e){ alert("Exception Occured.........");}
			  
	}
	function dropInfo(){
		if(request1.readyState === 4 && request1.status === 200){
			var val = request1.responseText;
			alert(val);
			var arr = val.split("*");
			clearRooms("room");
            addRooms("room","Select Room");
			
            for (let i = 0; i < (arr.length)-1; i++) {
                addRooms("room", arr[i]);
            }
		}
	}
		