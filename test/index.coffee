import { test, success } from "@dashkite/amen"
import print from "@dashkite/amen-console"
import assert from "@dashkite/assert"
import * as _ from "@dashkite/joy"
import alb from "../src/alb"
import edge from "../src/edge"
import furl from "../src/furl"

import albRequest from "./data/alb-request"
import albResponse from "./data/alb-response"
import edgeRequestEvent from "./data/edge-request-event"
import edgeResponse from "./data/edge-response"
import furlRequest from "./data/furl/request"
import furlResponse from "./data/furl/response"

handler = (request) ->
  if request.target == "/lambda?query=1234ABCD" && request.method == "get"
    status: 200
    description: "200 OK"
    headers:
      "content-type": [ "text/html" ]
    content: "<h1>Hello from Lambda!</h1>"

do ->

  print await test "Sky Lambda", [

    # test "ALB adapter", [

    #   test "basic test", ->
    #     f = alb handler
    #     f
    #       event: albRequest
    #       callback: (error, response) ->
    #         assert.deepEqual albResponse, response

    # ]

    # test "Edge Adapter", [

    #   test "basic test", ->
    #     f = edge handler
    #     f edgeRequestEvent, {}, (error, response) ->
    #       assert.deepEqual edgeResponse, response

    # ]

    test "Furl Adapter", [

      test "basic test", ->
           
        f = furl ( request ) ->
          # quick check to see if this looks like a Sublime response
          # full test is in Maeve
          assert request.url?
          assert request.origin?
          assert request.target?
          status: 201
          description: "ok"
          headers:
            "content-type": [ "application/json" ]
          content:
            greeting: "hello, world!"
        
        assert.deepEqual furlResponse, await f furlRequest, {}

      

    ]

  ]

  process.exit if success then 0 else 1