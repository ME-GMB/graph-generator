#!/bin/bash

export cpus=4
export memory=4
export nodes=3
export profile=product

minikube start --cpus=$cpus --memory=$memory --nodes=3 --profile $profile
minikube enable addons ingress

