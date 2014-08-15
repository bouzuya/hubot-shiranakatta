# hubot-shiranakatta

A Hubot script that display "知らなかった　そんなの……"

## Installation

    $ npm install git://github.com/bouzuya/hubot-shiranakatta.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-shiranakatta.git#TAG'

## Sample Interaction

    bouzuya> hubot help 知らなかった
    hubot> 知らなかった　そんなの…… - display "知らなかった　そんなの……"

    bouzuya> 知らなかった　そんなの……
    hubot> http://s3-ap-northeast-1.amazonaws.com/shiranakatta/sonnano.jpg

See [`src/scripts/shiranakatta.coffee`](src/scripts/shiranakatta.coffee) for full documentation.

## Development

### Run test

    $ npm test

### Run robot

    $ npm run robot

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][mail]&gt; ([http://bouzuya.net][url])

## Badges

[![Build Status][travis-badge]][travis]
[![Dependencies status][david-dm-badge]][david-dm]

[travis]: https://travis-ci.org/bouzuya/hubot-shiranakatta
[travis-badge]: https://travis-ci.org/bouzuya/hubot-shiranakatta.svg?branch=master
[david-dm]: https://david-dm.org/bouzuya/hubot-shiranakatta
[david-dm-badge]: https://david-dm.org/bouzuya/hubot-shiranakatta.png
[user]: https://github.com/bouzuya
[mail]: mailto:m@bouzuya.net
[url]: http://bouzuya.net
