command: "/usr/local/bin/kwmc query space active name"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="ac">
    <span class="icon"></span>
    <span class="message"></span>
  </div>
  """

update: (output, el) ->
    $(el).find(".message").text("  #{output}")
    $icon = $(el).find(".icon")
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@icon(output)}")

icon: (status) =>
    return if status.substring(0, 4) == "term"
        "fa-terminal"
    else if status.substring(0, 4) == "code"
        "fa-code"
    else if status.substring(0, 3) == "web"
        "fa-chrome"
    else if status.substring(0, 3) == "rnd"
        "fa-random"
    else if status.substring(0, 5) == "games"
        "fa-gamepad"
    else if status.substring(0, 5) == "files"
        "fa-files"
    else if status.substring(0, 4) == "chat"
        "fa-comments"
    else
        "fa-times"

style: """
  -webkit-font-smoothing: antialiased
  text-align: right
  color: #d5c4a1
  text-align: center
  left: 25%
  font: 13px Lucida Grande
  height: 16px
  overflow: hidden
  text-overflow: ellipsis
  top: 1px
  width: 50%

  .icon {
    margin-right: 5px;
  }
"""
