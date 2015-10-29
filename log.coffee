bunyan = require 'bunyan'

exports.log = (name) ->
  log = bunyan.createLogger {
    name: name,
    streams: [
      {
        level: 'info',
        stream: process.stdout            # log INFO and above to stdout
      },
      {
          level: 'trace',
          path: '/data/testing.log'
      }
    ]
  }