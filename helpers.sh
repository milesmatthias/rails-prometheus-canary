#!/bin/bash

function curlService {
  kubectl port-forward svc/$1 8080:8080 &
  pid=$!

  echo "Started port-forward, sleeping 15..."
  sleep 15

  curl -v http://localhost:8080/
  kill $pid
}

function connectPrometheus {
  kubectl --namespace monitoring port-forward \
    svc/prometheus-operator-prometheus 9090:9090
}
