
express = require 'express'

fs = require 'fs'

logger = require './log'

log = logger.log "server"

log.info "server has started"

app = express();

app.listen(80);

app.get '/', (req, res) ->
  log.debug("Got / request")
  file = req.query.file
  if file?
    res.setHeader('Content-disposition', 'attachment; filename=' + file)
    res.sendFile('/data/' + file)
  else
    links = ""
    files = fs.readdirSync('/data')
    for i in files
      if i.indexOf(".log") isnt -1
        log.debug('File: ' + i)
        links += '''<a href="?file=''' + i + '''">''' + i + '''</a></br>'''
    res.send(links)