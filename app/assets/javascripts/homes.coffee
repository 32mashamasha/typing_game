$ ->
    wordLists = []

    timeLimit = 30
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
      currentWord = wordLists[score][0]
      if(chr.toUpperCase() == currentWord[0].toUpperCase())
        wordLists[score][0] = wordLists[score][0].substr(1)
        currentWord = currentWord.substr(1)
        $("#target").text(currentWord)
        if(currentWord.length == 0)
          score += 1
          $("#target").text(wordLists[score][0])
          $("#description").text(wordLists[score][1])
          $("#answer_text").val('')
          if(score == quest_count)
            $("#target").text("FINISH!")
            $.ajax(
              '/games/'
              type: 'post'
              data: {game: {score: score, letter_count: count, miss_count: miss}}
            )
      else
        str = $("#answer_text").val()
        str = str.substr(0, str.length-1)
        console.log(str)
        $("#answer_text").val(str)
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
      category_id = $('#category_id').val()
      $.ajax(
        '/words/'
        type: 'get'
        data: {category_id: category_id }
        dataType: "json"
        success: (data) ->
          wordLists = data
          $("#target").text(wordLists[0][0])
          $("#description").text('('+wordLists[0][1]+')')
        error: (data) ->
          startFlg = false
          return
      )
      startFlg = true
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
      $("#description").text('')
      alert("finish score:#{score} letter_count:#{count} miss_count:#{miss}")