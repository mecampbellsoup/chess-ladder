function formatTime(num) {
    var sec_num = parseInt(num, 10); 
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = minutes+':'+seconds;
    return time;
};

$(document).ready(function() { 
    
    var Opponents = [$('#player1time'), $('#player2time')];
          
    var interval = 1000,
        player1count = null,
        player2count = null,
        player1value = 10,
        player2value = 10;
 
    $("#player1time").html(formatTime(player1value));
    $("#player2time").html(formatTime(player2value));
    
    function isGameOver() {
        if (player2value <= 0) {
            clearIntervals();
            $('#hidden_redirect').toggleClass('hidden');
            $('body').unbind('click');
        } else if (player1value <= 0) {
            clearIntervals();
            $('body').unbind('click');
            // call a function which POSTs data
            // passing in the winner and the loser
        }
    }
    
    function clearIntervals() {
         clearInterval(player1count);
         clearInterval(player2count); 
    }
    
    function getOpponent(object) {
        if (object == Opponents[0][0]) {
           return Opponents[1][0];
        } else {
           return Opponents[0][0];
        }
    }
    
    $('#player1time').bind('click', playerOneClicked);
    $('#player2time').bind('click', playerTwoClicked);
 
    function playerOneClicked() {
        $(this).unbind('click');
        $('#player2time').bind('click', playerTwoClicked);
        clearIntervals();
        player2count = setInterval(function() {
            isGameOver();
            player2value -= 1;
            $('#player2time').html(formatTime(player2value));
        }, interval);
    }
    
    function playerTwoClicked() {
        $(this).unbind('click');
        $('#player1time').bind('click', playerOneClicked);
        clearIntervals();
        player1count = setInterval(function() {
            isGameOver();
            player1value -= 1;
            $('#player1time').html(formatTime(player1value));
        }, interval);
    }
   
});