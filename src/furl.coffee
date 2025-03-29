import Sublime from "@dashkite/maeve/sublime"

lambda = ( handler ) ->

  ( event ) ->

    console.log { event }

    request =  Sublime.Request.from "furl", event

    console.log { request }

    response = await handler request

    console.log { response }

    final = Sublime.Response.to "furl", response

    console.log { final }

    final


export default lambda