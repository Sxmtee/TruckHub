import 'dart:ui';

extension HexColor on Color {
  static Color fromHex(String color) {
    final buffer = StringBuffer();
    buffer.write(color.replaceFirst('#', 'FF'));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
