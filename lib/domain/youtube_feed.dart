import 'package:xml/xml.dart';

import '../util/datetime.dart';
import '../util/xml.dart';
import 'atom_link.dart';
import 'atom_person.dart';
import 'youtube_item.dart';

class YoutubeFeed {
  final String id;
  final String title;
  final List<YoutubeItem> items;

  final List<AtomLink> links;
  final AtomPerson author;
  final DateTime published;

  YoutubeFeed({
    this.id,
    this.title,
    this.links,
    this.author,
    this.published,
    this.items,
  });

  factory YoutubeFeed.parse(String xmlString) {
    var document = XmlDocument.parse(xmlString);
    XmlElement feedElement;
    try {
      feedElement = document.findElements('feed').first;
    } on StateError {
      throw ArgumentError('feed not found');
    }

    return YoutubeFeed(
      id: findFirstElement(feedElement, 'id')?.text,
      title: findFirstElement(feedElement, 'title')?.text,
      items: feedElement.findElements('entry').map((element) {
        return YoutubeItem.parse(element);
      }).toList(),
      links: feedElement.findElements('link').map((element) {
        return AtomLink.parse(element);
      }).toList(),
      author: AtomPerson.parse(findFirstElement(feedElement, 'author')),
      published: parseDateTime(findFirstElement(feedElement, 'published')?.text),
    );
  }
}
