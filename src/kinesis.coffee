

lambda = (handler) ->
  
  (event, context, callback) ->
    try
      # console.log "event:", event

      if ( _data = event.Records?[0]?.kinesis?.data )?
        data = JSON.parse ( Buffer.from _data, "base64" ).toString()

      # console.log "extracted content:", data

      result = await handler data, { _: event }
      result ?= "success"

      console.log "result:", result

      callback null, result
    
    catch error
      callback error

export default lambda