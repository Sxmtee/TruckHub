import 'assets_location.dart';

class StaticText {
  StaticText._();

  static const String appTitle = 'Job Search App';
  static const String truckHub = 'Truck Hub';
  static const String embark =
      'Embark on a seamless journey of finding reliable truck drivers for your transportation needs.';
  static const String locate =
      'Locate available truck drivers in your vicinity with our powerful GPS technology. With your location service enabled we will connect you to the nearest driver.';
  static const String enjoy =
      'Enjoy the ease of instant results and experience the convenience of efficient logistics at your fingertips.';
  static const String earn = 'Earn as a driver';
  static const String find = 'Find a truck';
}

class ErrorText {
  static const String enterValidName = "Please enter a valid name";
}

List<Map<String, String>> onBoardingData = [
  {"title": StaticText.embark, "image": Assets.f1},
  {"title": StaticText.locate, "image": Assets.f1},
  {"title": StaticText.enjoy, "image": Assets.f1}
];
