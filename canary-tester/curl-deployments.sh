#!/bin/bash

while true; do

  curl http://ex-rails-prometheus.default:8080
  curl http://ex-rails-canary.default:8080
  curl http://ex-rails-baseline.default:8080
  sleep 5

done
