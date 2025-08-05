#!/system/bin/sh

MODDIR=${0%/*}
APK="$MODDIR/system/priv-app/com.duanlab.npsclient/com.duanlab.npsclient.apk"

SO_PATH=""
for base in /data/app/com.duanlab.npsclient*; do
  if [ -d "$base/lib" ]; then
    SO_PATH=$(find "$base/lib" -name libnpc.so 2>/dev/null | head -n1)
    [ -n "$SO_PATH" ] && break
  fi
done

while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done

sleep 2

if [ ! -f "$SO_PATH" ]; then
  log -t NPS-MODULE "[INFO] libnpc.so not found, installing APK..."
  pm install -r "$APK"
else
  log -t NPS-MODULE "[INFO] libnpc.so found: $SO_PATH"
fi
