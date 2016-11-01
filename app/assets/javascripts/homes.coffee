$ ->
    wordLists = ['apple', 'mario', 'arashi', 'test', 'macbook', "alfa", "bravo", "charlie", "delta", "echo", "foxtrot", "golf", "hotel", "india",
                "juliett", "kilo", "lima", "mike", "november", "oscar", "papa", "quebec", "romeo",
                "sierra", "tango", "uniform", "victor", "whiskey", "x-ray", "yankee", "zulu"]
    timeLimit = 10
    timer = 0
    timeLeft = 0
    startFlg = false

    quest_count = wordLists.length
    score = 0
    miss = 0
    count = 0
    $("#count").text(count)
    $("#miss").text(miss)

    $(document).on 'keyup', '#answer_text', (e) ->
        if(startFlg==false)
            alert('StartButtonを押してください')
            $("#answer_text").val('')
            return
        count += 1
        $("#count").text(count)
        if(e)
            kc = e.keyCode
        else
            kc = event.keyCode
        chr = String.fromCharCode(kc)
        currentWord = wordLists[score]
        if(chr.toUpperCase() == currentWord[0].toUpperCase())
            wordLists[score] = wordLists[score].substr(1)
            currentWord = currentWord.substr(1)
            $("#target").text(currentWord)
            if(currentWord.length == 0)
                score += 1
                $("#target").text(wordLists[score])
                $("#answer_text").val('')
                if(score == quest_count)
                    $("#target").text("FINISH!")
                    $.ajax(
                        '/games/'
                        type: 'post'
                        data: {game: {score: score, letter_count: count, miss_count: miss}}
                    )
        else
            miss += 1
            $("#miss").text(miss)
            $("#count").text(count)


    $(document).on 'change', '.game-sort', ->
        condition = $(this).val()
        $.ajax(
            '/homes/sort/'
            type: 'get'
            data: {condition: condition}
        )

    $(document).on 'click', '.start-button', ->
        startFlg = true
        $("#target").text(wordLists[0])
        $('.start-button').css('display', 'none')
        $('#timer').show()
        $("#answer_text").focus()
        timeLeft = timeLimit
        $(this).countDown()
        timer = setInterval("$(this).countDown()", 1000)

    $.fn.countDown = () ->
        if(timeLeft <= 0)
            $(this).stopGame()
            return
        $("#timer").text(timeLeft + " sec.")
        timeLeft--

    $.fn.stopGame = () ->
        $.ajax(
            '/games/'
            type: 'post'
            data: {game: {score: score, letter_count: count, miss_count: miss}}
        )
        clearInterval(timer)
        $('.start-button').show()
        $('#timer').css('display', 'none')
        $("#answer_text").val('')
        $("#target").text('')
        alert("finish score:#{score} letter_count:#{count} miss_count:#{miss}")