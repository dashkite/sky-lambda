import {
  getNormalizedRequest
  getDenormalizedResponse
} from "@dashkite/maeve/alb"


lambda = (handler) ->

  ( event ) ->

    console.log { event }

    request = getNormalizedRequest event

    console.log "request", request

    response = if request.target == "/ping"
      description: "ok" 
    else
      await handler request

    console.log "response", response

    _response = getDenormalizedResponse response
    
    console.log "denormalized response", _response
    _response

export default lambda
