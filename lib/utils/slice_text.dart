/// If more than [lengthLimit], text will be sliced to [lengthLimit]
String sliceText(String text, int lengthLimit) {
  return text.length > lengthLimit
      ? '${text.substring(0, lengthLimit)}...'
      : text;
}
