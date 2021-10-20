refreshFrequency: false

render: () -> """
  <form method="get" action="#" class="search_container">
  <input type="text" size="25" id="keyword" placeholder="word or URL here">
  <input type="submit" id="enter" value="->">
</form>
"""
afterRender: (enter) ->
  $(enter).on 'click', '#enter', =>
    str = document.getElementById('keyword').value
    result1 = str.indexOf("http")
    result2 = str.indexOf('.')
    result3 = str.indexOf("<scri")
    if result1 != -1 && result2 = -1 && result3 = -1
        marker = str.indexOf(':')
        url = str.substr(marker + 3)
        @run "open 'https://'" + url
    else if result1 = -1 && result2 != -1 && result3 = -1
        @run "open 'https://'" + str
    else if result1 = -1 && result2 = -1 && result3 = -1
        targetStr = ' '
        regExp = new RegExp(targetStr, 'g')
        search = str.replace(regExp, '+')
        @run "open 'https://duckduckgo.com/'" + "?q=" + search
    else if result1 = -1 && result2 = -1 && result3 != -1
        str = ""
    return

style: """
.search_container{
  position: relative;
  top: 550px;
  left: 390px;
  box-sizing: border-box;
  //display: block;
  //padding: 0px 10px;
  //border-radius: 20px;
  height: 2.2em;
  width: 500px;
  overflow: hidden;
  background: rgba(#fff, 0.3);
  //box-shadow: 2px 2px 6px rgba(0,0,0,0.9) inset;
  z-index:10;
}
.search_container input[type="text"]{
  border: none;
  height: 1.5em;
  background: none;
  width: 400px;
  padding-left: 0.5em;
  //color: #4E4B48;
  color: rgba(#fff, 0.95);
  font-family: Antro Vectra;
  font-size: 1.5em;
}
.search_container input[type="text"]:focus {
  outline: 0;
}
.search_container input[type="submit"]{
  cursor: pointer;
  font-family: Antro Vectra;
  font-size: 1.3em;
  border: none;
  background: none;
  //color: #4E4B48;
  color: rgba(#fff, 0.9);
  position: absolute;
  height: 2.5em;
  right: 8px;
  top: -10px;
  outline : none;
}
.search_container ::-webkit-input-placeholder {
  //color: #4E4B48;
  color: rgba(#fff, 0.95);
}

"""