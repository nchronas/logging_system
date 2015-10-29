logger = require './log'

log = logger.log "main"

log.info "hello"
console.log "hello"

out = () ->
	log.info "well nothing happened"
	log.debug "this should only appear in the file"

setInterval out, 10000