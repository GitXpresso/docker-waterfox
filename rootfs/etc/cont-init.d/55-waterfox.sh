#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Make sure some directories are created.
mkdir -p /config/downloads
mkdir -p /config/log/waterfox
mkdir -p /config/profile

# Generate machine id.
if [ ! -f /config/machine-id ]; then
    echo "generating machine-id..."
    cat /proc/sys/kernel/random/uuid | tr -d '-' > /config/machine-id
fi

# Clean/optimize Firefox databases.
#if [ -d /config/.mozilla/waterfox ] && [ -d /config/profile ]; then
#    [ -f /config/.mozilla/waterfox/profiles.ini ] || cp /defaults/profiles.ini /config/.mozilla/waterfox/
#    env HOME=/config /usr/bin/profile-cleaner f
#fi

# Initialize log files.
for LOG_FILE in /config/log/waterfox/output.log /config/log/waterfox/error.log
do
    touch "$LOG_FILE"

    # Make sure the file doesn't grow indefinitely.
    if [ "$(stat -c %s "$LOG_FILE")" -gt 1048576 ]; then
       echo > "$LOG_FILE"
    fi
done

# vim:ft=sh:ts=4:sw=4:et:sts=4
