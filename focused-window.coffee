command: "echo $(/usr/local/bin/kwmc query space active tag)"

refreshFrequency: 1000 # ms

render: (output) ->
  """
    <span class="icon"></span>
    <span class="message"></span>
    <div class="gradient"></div>
  """

update: (output, el) ->
    $(el).find("span.message").text("  #{output}")
    $icon = $(".icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-bars")
#-webkit-font-smoothing: antialiased

style: """
  -webkit-font-smoothing: antialiased
  color: #d5c4a1
  font: 13px Lucida Grande
  left: 10px
  position: absolute
  overflow: hidden
  //text-overflow: ellipsis
  word-break: break-all
  white-space: nowrap
  line-height: 20px
  width: 40%

  span.fa {
    margin-right: 5px;
  }
  .gradient {
    position: absolute;
    right: 0;
    top: 0;
    width: 30px;
    height: 22px;
    background: linear-gradient(to right, rgba(22, 22, 22, 0), rgba(22, 22, 22, 255))
  }
"""
