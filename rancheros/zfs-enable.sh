#!/usr/bin/env bash

ros zfs install
ros service enable zfs
ros service up zfs &
ros service logs --follow zfs
