// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

String? getLocalValue(String key) {
  return html.window.localStorage[key];
}

void setLocalValue(String key, String value) {
  html.window.localStorage[key] = value;
}

void removeLocalValue(String key) {
  html.window.localStorage.remove(key);
}
