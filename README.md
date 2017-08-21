# Example App For Phoenix Bug Report

Demo project to replicate a possible bug with request header handling in Phoenix Framework.

https://github.com/phoenixframework/phoenix/issues/2452

## Issue

This app has a single route that outputs the value of an `authorization` request header.

The `PageControllerTest` shows how a single request with the header value works as expected. However, a second request using the same `conn` doesn't output the header value.

The Phoenix generators `phx.gen.json` and `phx.gen.html` setup controller tests that follow this pattern of making two requests using the same conn.

## How To Replicate

* Install dependencies with `mix deps.get`
* Run the tests with `mix test`

See the test source in `PageControllerTest`.

## Notes

I tried to set the request header for the second request and got a `Plug.Conn.AlreadySentError`.
