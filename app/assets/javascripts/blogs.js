// function used to toggle the edit options for a comment
window.onload = function(){
	var editComment = document.getElementsByClassName('edit_comment')
	var editor = document.getElementsByClassName("editor")

	for(let i=0;i<editor.length;i++){
		editor[i].addEventListener('click', function(event){
			showForm(i)
		})
	}

	function showForm(x){
		event.preventDefault()
		editComment[x].style.display = "block";
	}

}