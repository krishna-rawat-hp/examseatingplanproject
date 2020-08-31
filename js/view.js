var req;
function viewPlan(){
	var x = document.getElementById('plan');
	var date = document.getElementById('examdate').value;
	if(date != ""){
		
		var url = "./ajax/getSubject.jsp?date="+date;
		
		if(window.XMLHttpRequest){
			req = new XMLHttpRequest();
		}else{
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		try{
			req.onreadystatechange = getData;
			req.open("GET",url,true);
			req.send();
		}catch(e){ alert("Exception Occured.....");}
		
		if(x.style.display === "none"){
			x.style.display = "block";
		}
	
	}else{
		alert("Must Select Date First!!");
	}
	
}

function getData(){
	if(req.readyState === 4 && req.status === 200){
		var v1 = req.responseText.trim();
			alert(v1);
			var a = v1.split("*");
			var copy = new Array();
			var cnt = {};
			var gta = {};
			var count = 1;
			var gtc = 0;
			var cl=0;
			var t = 0;
			var k=0;
			while(k<a.length){
				for(let j=k+6;j<a.length;j=j+6){
					copy[cl] = a[k];
					gtc = gtc+parseInt(a[j-1]);
					if(a[k] == a[j]){
						count++;
					}else{
						cl++;
						break;
					}	
				}
				k = k+(count*6);
				cnt[t] = count;
				gta[t] = gtc;
				t++;
				count = 1;
				gtc = 0;
			}
			
			var i = 0;
			var x = 0;
			var v1=0;
			while(v1<copy.length){
			if(cnt[x]>1){
				var stop = 0;
				var val1 = cnt[x];
				var gtotal = gta[x];
				while(cnt[x]>=1){
					var roomno = a[i];
					var subcode = a[i+1];
					var bcode = a[i+3];
					var s1 = a[i+2];
					var s2 = a[i+4];
					var total = a[i+5];
					
					var student = s2+s1;
					
					var tbl = document.getElementById("gettab");
					var row = tbl.insertRow();
					row.style.fontWeight="bold";
					row.style.textAlign="left";
					row.style.border = "2px solid black";
					
					if(stop == 0){
						var cell1 = row.insertCell();
						cell1.style.border = "1px solid black";
						
						cell1.rowSpan = val1;
						cell1.innerHTML = roomno;
					}
					
					var cell2 = row.insertCell();
					var cell3 = row.insertCell();
					var cell4 = row.insertCell();
					var cell5 = row.insertCell();
					
					cell2.style.border = "1px solid black";
					cell3.style.border = "1px solid black";
					cell4.style.border = "1px solid black";
					cell5.style.border = "1px solid black";
					
					cell2.innerHTML = subcode;
					cell3.innerHTML = bcode;
					cell4.innerHTML = student;
					cell5.innerHTML = total;
					
					if(stop == 0){
						var cell6 = row.insertCell();
						cell6.style.border = "1px solid black";
						
						cell6.rowSpan = val1;
						cell6.innerHTML = gtotal;
					}
					stop++;
					i=i+6;
					cnt[x]--;
				}
				x++;
			}else{
				var roomno = a[i];
				var subcode = a[i+1];
				var bcode = a[i+3];
				var s1 = a[i+2];
				var s2 = a[i+4];
				var total = a[i+5];
				var gtotal = a[i+5];
				
				var student = s2+s1;
				
				
				var tbl = document.getElementById("gettab");
				var row = tbl.insertRow();
				row.style.fontWeight="bold";
				row.style.textAlign="left";
				row.style.border = "2px solid black";
				
				var cell1 = row.insertCell();
				var cell2 = row.insertCell();
				var cell3 = row.insertCell();
				var cell4 = row.insertCell();
				var cell5 = row.insertCell();
				var cell6 = row.insertCell();
				
				cell1.style.border = "1px solid black";
				cell2.style.border = "1px solid black";
				cell3.style.border = "1px solid black";
				cell4.style.border = "1px solid black";
				cell5.style.border = "1px solid black";
				cell6.style.border = "1px solid black";
				
				cell1.innerHTML = roomno;
				cell2.innerHTML = subcode;
				cell3.innerHTML = bcode;
				cell4.innerHTML = student;
				cell5.innerHTML = total;
				cell6.innerHTML = gtotal;
				
				i=i+6;
				x++;
			}
			v1++;
		}
	}
}