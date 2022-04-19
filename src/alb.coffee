import {
  getNormalizedRequest
  getDenormalizedResponse
} from "@dashkite/maeve/alb"

# TODO do we want this wrapped in a try-catch?
# so we can pass the error to the callback?

lambda = (handler) ->

  (event, context, callback) ->

    request = getNormalizedRequest event

    response = await handler request

    _response = getDenormalizedResponse response
    
    callback null, _response

export default lambda