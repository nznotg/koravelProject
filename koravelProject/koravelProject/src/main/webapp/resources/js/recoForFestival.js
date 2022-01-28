/* 좋아요 */
function like_func(){
  var recoForReload = $('#recoForReload');
  //var searchRecoIdx = $('#searchRecoIdx', recoForReload).val();
  //var readerID = $('#readerID', recoForReload).val();
  //alert("searchRecoIdx, readerID : " + searchRecoIdx +","+ readerID);
  
  $.ajax({
    url: "findReco3.do",
    type: "GET",
    cache: false,
    dataType: "json",
    data: { searchRecoIdx : $('#searchRecoIdx').val() },
    success: function(data) {
		var msg = '';
		var like_img = '';
		msg += data.msgs;
		alert(msg);

      
		if(data.checkRecoTF == 0){
			like_img = "../resources/images/reco/dislike.PNG";
      	} else {
        	like_img = "../resources/images/reco/like.PNG";
      	}      
      	$('#like_img').attr('src', like_img);
      	$('#festivalReco').html(data.festivalReco);
      	$('#checkRecoTF').html(data.checkRecoTF);
    },
    error: function(request, status, error){
    	alert("searchRecoIdx="+$('#searchRecoIdx').val());
    }
  });
}