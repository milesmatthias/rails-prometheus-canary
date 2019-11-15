#!/bin/bash

while true; do

  curl http://ex-rails-prometheus.default:8080
  curl http://ex-rails-prometheus-canary.default:8080
  curl http://ex-rails-prometheus-baseline.default:8080
  sleep 1

done
