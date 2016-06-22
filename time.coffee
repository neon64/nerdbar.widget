command: "date +\"%H:%M:%S\""

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="time"
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".time span:first-child", el).text("  #{output}")
    $icon = $(".time span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-clock-o")

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 13px Lucida Grande
  right: 10px
  top: 1px
"""
