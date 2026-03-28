
$(document).ready(function () {


$("#QtyInut").keyup(function(event){
  var qty = parseInt($("#QtyInut").val());
  var maxValue = parseInt($('#QtyInut').attr('max'));
  if(qty < 1 || qty > maxValue){
    alert("please Enter value between 1 and " + maxValue);
    $("#QtyInut").val(1); 
  }
});




$("#revSubBtn").click(function(event){
  event.preventDefault();
  var review = $("#comment-review-text").val();
  if(review == ""){
    alert("Please Enter Your review first.");
  }else
  {
    var rating = 0;
    $('.lli').each(function(index) {
      if($(this).find('i').hasClass('fa-star')){
        rating++;
      }
    });
      var productID = $("#productID").val();
      var userID = $("#userID").val();
      var ordersID = $("#ordersID").val();
      var formData = new FormData();
      formData.append('userID', userID);
      formData.append('productID', productID);
      formData.append('ordersID', ordersID);
      formData.append('review', review);
      formData.append('rating', rating);
   // Send the form data to the PHP server
     $.ajax({
      url: 'pages/phpProces/addToRev.php',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(response) {
        if(response >= 0 ){
          
          window.location.href = "reviewSuccessMsg.php";
          return;
        }else{
          alert("you have been submited your review");
        }
        // Handle the server response
      },
      error: function(error) {
        alert('Error: ' + error); // Handle any errors
      }
    });
  }

});





var selected = false;
$('.sr').mouseenter(function(event) {
  if (!selected) {
  var cindex = $('.sr').index(this);
    $('.lli').each(function(index) {
      if(index <= cindex){
        $(this).find('i').removeClass('fa-star-o');
        $(this).find('i').addClass('fa-star');
      }
    });
  }
}).mouseleave(function(event) {
  if (!selected) {
    var cindex = $('.sr').index(this);
    $('.lli').each(function(index) {
      if(index <= cindex){
        $(this).find('i').removeClass('fa-star');
        $(this).find('i').addClass('fa-star-o');
      }
    });
  }
}).click(function(event) {
  event.preventDefault();
  selected = true;
  $(this).off('mouseleave');

  var cindex = $('.sr').index(this);
    $('.lli').each(function(index) {
      if(index <= cindex){
        $(this).find('i').removeClass('fa-star-o');
        $(this).find('i').addClass('fa-star');
      }else{
        $(this).find('i').removeClass('fa-star');
        $(this).find('i').addClass('fa-star-o');
      }
  });
});


  $('#orPrBtn').click(function(event) {
    event.preventDefault();
    $("#orderForm").submit();
  });

  $(".update_Q_btn").click(function(event){
    var flag = 1;
    $('.product_quantity .product_Q_I').map(function() {
      var qty = parseInt( $(this).val());
      var carttid = parseInt($(this).data("carttid"));
      var formData = new FormData();
      formData.append('qty', qty);
      formData.append('carttid', carttid);

      $.ajax({
        url: 'pages/phpProces/update_q_c.php',
       type: 'POST',
       data: formData,
       processData: false,
       contentType: false,
       success: function(response) {
        if(response == -1){
          flag = -1;
        }
       },
       error: function(error) {
          flag = -1;
         alert('Error: ' + error); // Handle any errors
       }
     });
     if (flag === -1) {
      return false; // Break the loop
    }
    });
    if (flag == -1) {
      alert("Can't be added to the database");
    } else if (flag == 1) {
      $.ajax({
        url: window.location.href,
        method: 'GET',
        success: function() {
          location.reload(); // Reload the page after the AJAX request is successful
        }
      });
    }
    
  });
 
    //add to cart btn from index product \\
    $(".addPFI").click(function(event){
      event.preventDefault();
      var userID = $(this).data("userid");
      if(userID < 0){
          window.location.href = "login.php";
          return;
      }
      var quantity = 1;
      var productID = $(this).data("productid");
      var productIMG = $(this).data("productimg");
      var productName = $(this).data("productname");
      var formData = new FormData();
      formData.append('userID', userID);
      formData.append('productID', productID);
      formData.append('productIMG', productIMG);
      formData.append('productName', productName);
      formData.append('quantity', quantity);
      var me = $(this);
   // Send the form data to the PHP server
     $.ajax({
       url: 'pages/phpProces/addtocart.php',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(response) {
        if(response >= 0 ){
          $(".cart-count").html(response);
          me.off('click');
          me.html('View Cart');
          me.removeClass('id');
        }else{
          alert("Can't Add to Cart");
        }
        // Handle the server response
      },
      error: function(error) {
        alert('Error: ' + error); // Handle any errors
      }
    });
      
  });
    //add to cart btn from product details \\
    $("#addToCartBtn").click(function(event){
        event.preventDefault();
        var userID = $(this).data("userid");
        if(userID < 0){
            window.location.href = "login.php";
            return;
        }
        var quantity = $("#QtyInut").val();
        if(quantity <= 0){
          alert("Please Enter a valid value!");
          return;
        }
        var productID = $(this).data("productid");
        var productIMG = $(this).data("productimg");
        var productName = $(this).data("productname");
        var formData = new FormData();
        formData.append('userID', userID);
        formData.append('productID', productID);
        formData.append('productIMG', productIMG);
        formData.append('productName', productName);
        formData.append('quantity', quantity);
        var me = $(this);
      // Send the form data to the PHP server
       $.ajax({
         url: 'pages/phpProces/addtocart.php',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          if(response >= 0 ){
            $(".cart-count").html(response);
            me.off('click');
            me.html('View Cart');
            me.removeAttr('id');
          }else{
            alert("Can't Add to Cart");
          }
          // Handle the server response
        },
        error: function(error) {
          alert('Error: ' + error); // Handle any errors
        }
      });
        
    });
 
    //Remove favorate product from wishlist\\
    $(".product_R_F_w").click(function(event) {
        event.preventDefault();
        var userID = $(this).data("userid");
        if(userID < 0){
            window.location.href = "login.php";
            return;
        }
        var productID = $(this).data("productid");
        var formData = new FormData();
        formData.append('userID', userID);
        formData.append('productID', productID);
        var rowIndex = $(this).closest('tr').index();
        var row = $('tr').eq(rowIndex + 1);
      // Send the form data to the PHP server
      $.ajax({
        url: 'pages/phpProces/reFrWish.php',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          if(response >= 0 ){
            if(response == 0){
                window.location.href = "../../pages/user/wishlist.php";
            }else{
                row.css("transition", "height 0.5s").css("height", "0").fadeOut("slow", function() {
                    row.remove(); // Remove the row after it fades out
                    $(".wishlist-count").html(response);
                });
            }
          }else{
            alert("Can't Add to wishlist");
          }
          // Handle the server response
        },
        error: function(error) {
          alert('Error: ' + error); // Handle any errors
        }
      });
    });

    //Remove product from cart\\
    $(".product_R_F_C").click(function(event) {
      event.preventDefault();
      var userID = $(this).data("userid");
      if(userID < 0){
          window.location.href = "login.php";
          return;
      }
      var productID = $(this).data("productid");
      var formData = new FormData();
      formData.append('userID', userID);
      formData.append('productID', productID);
      var rowIndex = $(this).closest('tr').index();
      var row = $('tr').eq(rowIndex + 1);
    // Send the form data to the PHP server
    $.ajax({
      url: 'pages/phpProces/reFrCart.php',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(response) {
        if(response >= 0 ){
          if(response == 0){
              window.location.href = "cart.php";
          }else{
              row.css("transition", "height 0.5s").css("height", "0").fadeOut("slow", function() {
                  row.remove(); // Remove the row after it fades out
                  $(".cart-count").html(response);
              });
          }
        }else{
          alert("Can't Delete from Cart");
        }
        // Handle the server response
      },
      error: function(error) {
        alert('Error: ' + error); // Handle any errors
      }
    });
  });


//add wishlist
$(".add-wishlist-btn").click(function(event) {
  event.preventDefault();

  var userID = $(this).data("userid");
  if (userID < 0) {
    window.location.href = "../../pages/user/login.php";
    return;
  }

  var productID = $(this).data("productid");
  var productIMG = $(this).data("productimg");
  var productName = $(this).data("productname");

  var formData = new FormData();
  formData.append('userID', userID);
  formData.append('productID', productID);
  formData.append('productIMG', productIMG);
  formData.append('productName', productName);

  var nextElement = $(this).find('i');

  // Send the form data to the PHP server
  $.ajax({
    url: 'pages/phpProces/addToWishlist.php',
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(response) {
      if (response >= 0) {
        $(".wishlist-count").html(response);

        if (nextElement.hasClass('text-danger')) {
          nextElement.removeClass('text-danger');
        } else {
          nextElement.addClass('text-danger');
        }
      } else {
        alert("Can't Add to wishlist");
      }
    },
    error: function(xhr, status, error) {
      var errorMessage = xhr.status + ': ' + xhr.statusText;
      alert('AJAX Error: ' + errorMessage);
    }
  });
});



    var navbar = $('.navbar');
    var brandName = $('.brand_name');
    setHeader();


    $(document).on('scroll', function () {
        setHeader();
    });


    function setHeader() {
        var w = window.innerWidth
            || document.documentElement.clientWidth
            || document.body.clientWidth;
        if ( w > 786 ) {
            if ($(window).scrollTop() > 127) {
                navbar.addClass('scrolled-up');
                navbar.removeClass('scrolled-down');
                brandName.slideUp(300);
            }
            else {
                navbar.removeClass('scrolled-up');
                navbar.addClass('scrolled-down');
                brandName.slideDown(300);
            }
        }
    }

    $(window).on('resize', function () {
        navbar.removeClass('scrolled-up');
        navbar.removeClass('scrolled-down');
    });

    $(".custom-file-input").change(function (event) {
        var tmpPath = URL.createObjectURL(event.target.files[0]);
        $(".imagepreview").fadeIn("slow").attr('src', URL.createObjectURL(event.target.files[0]));
        var fileName = $(this).val().split("\\").pop();
        $(this).next('.custom-file-label').html(fileName);
    });



    $("#quantity_input").keyup(function () {
        var v = $("#quantity_input").val();
        if (isNaN(v)) {
            alert("Total Package can not be string");
            $("#quantity_input").val(1);
        } else if (v == "") {
            alert("Total Package can not be empty");
            $("#quantity_input").val(1);
        } else if (v <= 0) {
            alert("Total Package can not be zero or less than zero");
            $("#quantity_input").val(1);
        } else if (v >= 200) {
            alert("You can not buy more than 200 package for more information Please contact with us");
            $("#quantity_input").val(1);
        } else {
            var price = $("#priceOfPackage").text();
            var p = price.substring(0, price.length - 4);
            var subtotalPrice = p * v;
            $("#subtotal").text(subtotalPrice + " Afg");
        }
    });
    

  
    $("#quantity_input").change(function () {
        var v = $("#quantity_input").val();
        if (v <= 0) {
            alert("Total Package can not be zero or less than zero");
            $("#quantity_input").val(1);
        } else if (v >= 200) {
            alert("You can not buy more than 200 package for more information Please contact with us");
            $("#quantity_input").val(1);
        } else {
            var price = $("#priceOfPackage").text();
            var p = price.substring(0, price.length - 4);
            var subtotalPrice = p * v;
            $("#subtotal").text(subtotalPrice + " Afg");
        }
    });


      function setValue(v) {
        var price = $("#priceOfPackage").text();
        var p = price.substring(0, price.length - 4);
        var subtotalPrice = p * v;
        $("#subtotal").text(subtotalPrice + " Afg");
    }


    //quick view model
// $(".quickView").click(function(event) {


//   var userID = $(this).data("userid");

//   var productID = $(this).data("productid");

//   var formData = new FormData();
//   formData.append('userID', userID);
//   formData.append('productID', productID);

//   // var nextElement = $(this).find('i');

//   // Send the form data to the PHP server
//   $.ajax({
//     url: 'pages/phpProces/quickview.php',
//     type: 'POST',
//     data: formData,
//     processData: false,
//     contentType: false,
//     success: function(response) {
//       if (response >= 0) {
//         $(".wishlist-count").html(response);

//         if (nextElement.hasClass('text-danger')) {
//           nextElement.removeClass('text-danger');
//         } else {
//           nextElement.addClass('text-danger');
//         }
//       } else {
//         alert("Can't Add to wishlist");
//       }
//     },
//     error: function(xhr, status, error) {
//       var errorMessage = xhr.status + ': ' + xhr.statusText;
//       alert('AJAX Error: ' + errorMessage);
//     }
//   });
// });


$(document).on('input', '.product_Q_I_C', function(event) {
  var flag = 1;
  var qty = parseInt($(this).val());
  var carttid = parseInt($(this).data("carttid"));
  // alert(qty + " : " + carttid);
  var formData = new FormData();
  formData.append('qty', qty);
  formData.append('carttid', carttid);

  $.ajax({
    url: 'pages/phpProces/update_q_i_c.php',
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(response) {
      if (response === -1) {
        flag = -1;
      }
    },
    error: function(error) {
      flag = -1;
      alert('Error: ' + error); // Handle any errors
    }
  });

  if (flag === -1) {
    alert("Can't be added to the database");
  } else if (flag === 1) {
    $.ajax({
      url: window.location.href,
      method: 'GET',
      success: function() {
        location.reload(); // Reload the page after the AJAX request is successful
      }
    });
  }
});





    

});























