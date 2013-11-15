$(document).ready(function() {
    
    function formatTime(num) {
        var sec_num = parseInt(num, 10);
        var minutes = Math.floor(sec_num / 60);
        var seconds = sec_num - (minutes * 60);

        if (seconds < 10) {seconds = "0"+seconds;}
        var time    = minutes+':'+seconds;
        return time;
    }

    var gameModeLength = 180;
    
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
        gameModeLength = parseInt(g, 10);
        //next redraw the html based on changes to opps var
        $("#player1").html(formatTime(gameModeLength));
        $("#player2").html(formatTime(gameModeLength));
        opps.player1.value = gameModeLength;
        opps.player2.value = gameModeLength;
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
        $('.time').off('click tap swipe');
         clearInterval(opps.player1.count);
         clearInterval(opps.player2.count);
    }

    function getOpponent(player) {
        var p = (player.id == "player1") ?  $('#player2') : $('#player1');
        return p;
    }

    function reverseColors(player,opponent) {
        $('.time').removeClass('timer-counting');
        $(player).addClass('timer-waiting');
        opponent.addClass('timer-counting');
    }
 
    function playerClick() {
        var opponent = getOpponent(this);
        var o = opps[opponent[0].id]; //opps object

        reverseColors(this, opponent);
        clearAndUnbind();
        opponent.on('click tap swipe', playerClick);

        o.count = setInterval(function() {
            o.value -= 1,
            checkGameTime();
            opponent.html(formatTime(o.value));
        }, 1000);
    }

    $("#player1").html(formatTime(gameModeLength));
    $("#player2").html(formatTime(gameModeLength));
    $('.time').on('click tap swipe', playerClick);
});