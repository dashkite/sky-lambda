import {
  getRequest
  getNormalizedRequest
  getDenormalizedResponse
} from "@dashkite/maeve/edge"

lambda = (handler) ->

  ( event, context, callback ) ->

    console.log "event:", JSON.stringify event, null, 2

    request = getNormalizedRequest event

    console.log "normalized request:", request

    response = await handler request

    console.log "normalized response:", response

    response = getDenormalizedResponse response

    console.log "denormalized response:", response

    callback null, response


export default lambda