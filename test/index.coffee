import { test, success } from "@dashkite/amen"
import print from "@dashkite/amen-console"
import assert from "@dashkite/assert"
import * as _ from "@dashkite/joy"
import alb from "../src/alb"
import edge from "../src/edge"

import albRequest from "./data/alb-request"
import albResponse from "./data/alb-response"
import edgeRequestEvent from "./data/edge-request-event"
import edgeResponse from "./data/edge-response"

handler = (request) ->
  if request.target == "/lambda?query=1234ABCD" && request.method == "get"
    status: 200
    description: "200 OK"
    headers:
      "content-type": [ "text/html" ]
    content: "<h1>Hello from Lambda!</h1>"

do ->

  print await test "Sky Lambda", [

    test "ALB adapter", [

      test "basic test", ->
        f = alb handler
        f
          event: albRequest
          callback: (error, response) ->
            assert.deepEqual albResponse, response

    ]

    test "Edge Adapter", [

      test "basic test", ->
        f = edge handler
        f edgeRequestEvent, {}, (error, response) ->
          assert.deepEqual edgeResponse, response

    ]

  ]

  process.exit success