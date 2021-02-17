import 'package:xml/xml.dart';

import '../../util/xml.dart';

class ItunesOwner {
  final String name;
  final String email;

  ItunesOwner({this.name, this.email});

  factory ItunesOwner.parse(XmlElement element) {
    if (element == null) return null;
    return ItunesOwner(
      name: findFirstElement(element, 'itunes:name')?.text?.trim(),
      email: findFirstElement(element, 'itunes:email')?.text?.trim(),
    );
  }
}
