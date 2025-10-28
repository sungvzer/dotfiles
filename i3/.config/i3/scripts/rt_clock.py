#!/bin/env python3

# Program that prints based on the format in the argument given abiding by the time format spec of time.strftime
# and sleeps for the residual time to make it precise.
import time
import sys

while True:
    now = time.time()
    local_time = time.localtime(now)
    format=sys.argv[1] if len(sys.argv) > 1 else "%H:%M:%S"
    print(time.strftime(format, local_time),flush=True)

    time_to_sleep = 1.0 - (now - int(now))
    # Flush output immediately
    time.sleep(time_to_sleep)

