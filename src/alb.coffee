import {
  getNormalizedRequest
  getDenormalizedResponse
} from "@dashkite/maeve/alb"

# TODO do we want this wrapped in a try-catch?
# so we can pass the error to the callback?

lambda = (handler) ->

  ( event, context, callback ) ->

    console.log { event, context, callback }

    request = getNormalizedRequest event

    console.log "request", request

    response = await handler request

    console.log "response", response

    _response = getDenormalizedResponse response
    
    console.log "denormalized response", _response
    callback null, _response

export default lambda
