# Description:
#   Shorts
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot can i wear shorts
#   hubot mag ik een korte broek aan
#   hubot shorts?
#
# Author:
#   Marthyn (@Marthyn)

module.exports = (robot) ->
  robot.respond /can i wear shorts/, (msg) ->
    getTemperature(msg, robot)
  robot.respond /mag ik een korte broek aan/, (msg) ->
    getTemperature(msg, robot)
  robot.respond /shorts\?/, (msg) ->
    getTemperature(msg, robot)

getTemperature = (msg, robot) ->
  url = "http://api.openweathermap.org/data/2.5/forecast/daily
         ?q=Rotterdam,nl&units=metric&cnt=1"
  robot.http(url).get() (err, res, body) ->
    data = JSON.parse body
    if data.list[0].main.temp_max
      temp = data.list[0].main.temp_max
      if temp >= 30
        msg.send "Yes, the temperature is #{temp}! Show them legs!"
      else
        msg.send "No, it's only #{temp}, please show some respect"
