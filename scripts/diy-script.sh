#!/bin/bash
set -euo pipefail

sed -i 's/192\.168\.[0-9]*\.[0-9]*/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i -E 's|^root:[^:]*:|root::|' package/base-files/files/etc/shadow
