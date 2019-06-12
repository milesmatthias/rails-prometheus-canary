# README

This is a simple Rails application that exposes:

* `/` - sets a custom Gauge Prometheus metric
* `/metrics` - Prometheus metrics endpoint

See `app/controllers/home_controller.rb` to see how the metric value is decided and set.

## Generating traffic

There's a simple image you can run on your cluster alongside this application in `canary-tester` that will curl the canary, baseline, and regular services every 15 seconds.

The "production" or "regular" service/deployment is labeled `ex-rails-prometheus`.

## Canary Config

See `canary-config-default.json` to use the `default` type. (Currently works)
See `canary-config-promql.json` to use the `PromQL` type. (Currently does not work)

## Canary Pipeline

See `canary-pipeline.json`.

## Disclaimer

You will need to replace the names of accounts and registries to run this in your own Spinnaker instance.
