# README

This is a simple Rails application that exposes:

* `/` - sets a custom Gauge Prometheus metric
* `/metrics` - Prometheus metrics endpoint

See `app/controllers/home_controller.rb` to see how the metric value is decided and set.
