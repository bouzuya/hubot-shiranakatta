# Description
#   A Hubot script that display "知らなかった　そんなの……"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   知らなかった　そんなの…… - display "知らなかった　そんなの……"
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  robot.hear /[し知]らなかった.*そんなの/, (res) ->
    res.send 'http://s3-ap-northeast-1.amazonaws.com/shiranakatta/sonnano.jpg'
