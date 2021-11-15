import {
  getRequest
  getURL
  getMethod
  getHeaders
  setResponseStatusCode
  setResponseStatusDescription
  setResponseHeaders
  setResponseBody
  setResponseBodyIsBase64Encoded
} from "@dashkite/maeve/edge"

lambda = (handler) ->

  ({ event, callback }) ->

    _request = getRequest event

    request =
      url: getURL _request
      method: getMethod _request
      headers: getHeaders _request

    response = await handler request

    callback null,
      statusCode: setResponseStatus response
      statusDescription: setResponseStatusDescription response
      headers: setResponseHeaders response
      body: setResponseBody response
      isBase64Encoded: setResponseBodyIsBase64Encoded response


export default lambda