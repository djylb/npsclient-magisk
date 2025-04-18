install_apk() {
  if [ "$BOOTMODE" != 'true' ]; then
    ui_print '- Skipping APK installation since not running via Magisk Manager'
    return 0
  fi

  ui_print '- Installing CallRecorder APK'
  pm install -r "$MODPATH/system/priv-app/com.github.axet.callrecorder/com.duanlab.npsclient.apk" || true
}


if [ "$API" -lt '24' ]; then
  abort 'This module is for Android 7.0+ only'
fi

install_apk
