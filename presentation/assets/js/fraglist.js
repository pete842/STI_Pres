var groups = document.getElementsByClassName('fraglist')

for (var i = 0; i < groups.length; i++){
  var lis = groups[i].getElementsByTagName("li");
  for (var j = 0; j < lis.length; j++){
    lis[j].classList.add('fragment');
  }
}
