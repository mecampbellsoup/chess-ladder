$(document).ready(function() { 
    
    function formatTime(num) {
    var sec_num = parseInt(num, 10); 
    var minutes = Math.floor(sec_num / 60);
    var seconds = sec_num - (minutes * 60);

    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = minutes+':'+seconds;
    return time;
}

    var gameModeLength = 300;
    
    var opps = {
        "player1": {
            "count": null,
            "value": gameModeLength
        },
        "player2": {
            "count": null,
            "value": gameModeLength
        }
    };
    
    $('#gameModes').change(function() {
        var g = $(this).find( ":selected" ).val();
        gameModeLength = parseInt(g);
        //need on the coming lines to redraw the html based on changes to opps var
        $("#player1").html(formatTime(gameModeLength));
        debugger;
        $("#player2").html(formatTime(gameModeLength));
        alert(gameModeLength);
    });
   
    
    function checkGameTime() {
        if (opps.player1.value <= 0 || opps.player2.value <= 0) {
            gameEnded();
        }
    }

    function gameEnded() {
        clearAndUnbind();
        $('#hidden_redirect').toggleClass('hidden');
    }
    
    function clearAndUnbind() {
        $('.time').unbind('click');
         clearInterval(opps.player1.count);
         clearInterval(opps.player2.count); 
    }
    
    function getOpponent(player) {
        var p = (player.id == "player1") ?  $('#player2') : $('#player1');
        return p;
    }
 
    function playerClick() {
        var opponent = getOpponent(this);
        var o = opponent[0].id; 
        /*
        opponent = jquery object
        o = value "player1" or "player2", so you can use
            opps[o] to play with the object 

        */
        clearAndUnbind();
        opponent.bind('click', playerClick);

        opps[o].count = setInterval(function() {
            opps[o].value =  opps[o].value - 1,
            checkGameTime();
            opponent.html(formatTime(opps[o].value));
        }, 1000);
    }

    $("#player1").html(formatTime(opps.player1.value));
    $("#player2").html(formatTime(opps.player2.value));
    $('.time').bind('click', playerClick);

});