jQuery(function ()
{
    jQuery("#f_elem_city").autocomplete({
        source: function (request, response) {
            jQuery.getJSON(
                "http://gd.geobytes.com/AutoCompleteCity?callback=?&q="+request.term,
                function (data) {
                    response(data);
                }
            );
        },
        minLength: 3,
        select: function (event, ui) {
            var selectedObj = ui.item;
            jQuery("#f_elem_city").val(selectedObj.value);
            getcitydetails(selectedObj.value);
            return false;
        },
        open: function () {
            jQuery(this).removeClass("ui-corner-all").addClass("ui-corner-top");
        },
        close: function () {
            jQuery(this).removeClass("ui-corner-top").addClass("ui-corner-all");
        }
    });
    jQuery("#f_elem_city").autocomplete("option", "delay", 100);
});



$( document ).ready(function() {

    // GET REQUEST
    function refresh() {
        if (location.pathname.localeCompare("/messages") === 0) {
            var url_string = window.location.href;
            var url = new URL(url_string);
            var receiverId = url.searchParams.get("id");
            ajaxGet(receiverId);
        }
        setTimeout(refresh, 1000);
    };
    refresh();

    // DO GET
    function ajaxGet(receiverId){
        $.ajax({
            url : "/api/messages?id="+receiverId,
            type : "GET",
            success : function(response) {
                displayMissingMessage(response.messages, response.firstName, response.lastName);
                //console.log( response );
            },
            error : function(xhr, status, error) {
                console.log(xhr.responseText);
                console.log("ERROR: ", error);
            }
        });
    }

    function displayMissingMessage(data, firstName, lastName) {
        $.each(data, function (k, data) {
            console.log(data);
            var isMissing = true;
            $("div.received_withd_msg").find("p").each(function( i, e ) {
                if (data.messageContent === $(e).text()) {
                    isMissing = false;
                }
                //console.log( $( e ).text() );
            });
            if (isMissing) {
                var htmlToAdd = "<div class='incoming_msg'>" +
                    "<div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>"+
                    "<div class='received_msg'>"+
                    "<div class='received_withd_msg'>"+
                    "<p>"+data.messageContent+"</p>"+
                    "<span class='time_date'>"+firstName+" "+lastName+" at "+data.sentDate+"</span>"+
                    "</div> </div> </div>";
                $( "div.msg_history" ).append( htmlToAdd );
            }
        });
    }
})