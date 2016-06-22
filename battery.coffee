command: "pmset -g batt" # egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 15000 # ms

render: (output) ->
  """
    <span class="message"></span>
    <span class="fa-stack">
      <i class="fa fa-bolt fa-stack-1x" style="font-size: 0.7em"></i>
      <i class="battery-icon fa fa-stack-1x"></i>
    </span>
  """

update: (output, el) ->
    lines = output.split("\n")
    parts = lines[1].trim().split(" ")
    percent = parts[1].replace(";", "")
    charging = parts[2].replace(";", "") == "charging"
    if charging
      $(".fa-bolt", el).css("display", "inline-block")
    else
      console.log("hide bolt")
      $(".fa-bolt", el).css("display", "none")

    bat = parseInt(percent.replace("%", ""))
    $(".message", el).text("  #{percent}")

    batteryIcon = if charging then "fa-battery-empty" else @icon(bat)
    $(el).find(".battery-icon").addClass("fa #{batteryIcon}")

icon: (output) =>
  return if output > 90
    "fa-battery-full"
  else if output > 70
    "fa-battery-three-quarters"
  else if output > 40
    "fa-battery-half"
  else if output > 20
    "fa-battery-quarter"
  else
    "fa-battery-empty"

style: """
  -webkit-font-smoothing: antialiased
  font: 13px Lucida grande
  top: 1px
  right: 190px
  color: #d5c4a1

  .fa-stack {
    line-height: 20px
    height: 20px
    width: 20px
  }
"""
