function formatTime(num) {
    var sec_num = parseInt(num, 10); 
    var minutes = Math.floor(sec_num / 60);
    var seconds = sec_num - (minutes * 60);

    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = minutes+':'+seconds;
    return time;
};

var opps = {
    "player1": {
        "count": null,
        "value": 300
    },
    "player2": {
        "count": null,
        "value": 300
    }
}

$(document).ready(function() { 
              
    
    function checkGameTime() {
        if (opps.player1.value <= 0 || opps.player2.value <= 0) {
            gameEnded();
        }
    }

    function gameEnded() {
        clearIntervals();
        $('#hidden_redirect').toggleClass('hidden');
        $('.time').unbind('click');       
    }
    
    function clearIntervals() {
         clearInterval(opps.player1.count);
         clearInterval(opps.player2.count); 
    }
    
    function getOpponent(player) {
        if (player.id == "player1") {
            return $('#player2');
        } else {
            return $('#player1');
        }
    }
 
    function playerClick() {
        var opponent = getOpponent(this);
        var o = opponent[0].id; 
        /*
        opponent = jquery object
        o = value "player1" or "player2", so you can use
            opps[o] to play with the object 

        */
        clearIntervals();

        $('.time').unbind('click');
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