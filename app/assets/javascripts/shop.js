$(function() {
 function readURL(input) {
   if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
       $('.reviewImage').attr('src', e.target.result);
       $('.trimImage').css('display','block')
     }
     reader.readAsDataURL(input.files[0]);
   }
 }
 $("#shop_image").change(function(){
   readURL(this);
 });
});