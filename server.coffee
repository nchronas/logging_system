
express = require 'express'

logger = require './log'

log = logger.log "server"

log.info "server has started"

app = express();

app.listen(80);

app.get '/', (req, res) ->
  log.debug("Got / request")
  file = req.query.file
  if file?
    res.sendFile('/data/' + file)
  else
    links = ""
    files = fs.readdirSync('/data');
    for i in files
      log.debug('File: ' + i)
      links += '''<a href="files?file=''' + i + '''">''' + i + '''</a></br>'''
    res.send(links)