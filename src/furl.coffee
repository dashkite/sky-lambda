import Sublime from "@dashkite/maeve/sublime"

lambda = ( handler ) ->

  ( event ) ->

    console.log { event }

    request =  Sublime.Request.from "furl", event

    console.log { request }

    response = await handler request

    console.log { response }

    Sublime.Response.to "furl", response


export default lambda