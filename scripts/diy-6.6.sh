#!/bin/bash
set -euo pipefail

sed -i "s|option mediaurlbase '/luci-static/bootstrap'|option mediaurlbase '/luci-static/argon'|" \
  feeds/luci/modules/luci-base/root/etc/config/luci

mkdir -p package/base-files/files/etc/uci-defaults
cat > package/base-files/files/etc/uci-defaults/99-enable-flow-offload <<'EOF'
#!/bin/sh
[ -n "$(uci -q get firewall.@defaults[0])" ] || exit 0
uci -q set firewall.@defaults[0].flow_offloading='1'
uci -q set firewall.@defaults[0].flow_offloading_hw='1'
uci -q commit firewall
exit 0
EOF
chmod 0755 package/base-files/files/etc/uci-defaults/99-enable-flow-offload
