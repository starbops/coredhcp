#!/bin/bash
set -e

exec tini -- coredhcp "${@}"
