import 'package:xml/xml.dart';

import '../util/datetime.dart';
import '../util/xml.dart';
import 'atom_link.dart';
import 'atom_person.dart';
import 'youtube_group.dart';

class YoutubeItem {
  final String id;
  final String title;
  final AtomLink link;
  final AtomPerson author;
  final DateTime published;
  final DateTime updated;
  final YoutubeGroup group;

  YoutubeItem({
    this.id,
    this.title,
    this.link,
    this.author,
    this.published,
    this.updated,
    this.group,
  });

  factory YoutubeItem.parse(XmlElement element) {
    return YoutubeItem(
      id: findFirstElement(element, 'id').text,
      title: findFirstElement(element, 'title').text,
      link: AtomLink.parse(findFirstElement(element, 'link')),
      author: AtomPerson.parse(findFirstElement(element, 'author')),
      published: parseDateTime(findFirstElement(element, 'published').text),
      updated: parseDateTime(findFirstElement(element, 'updated').text),
      group: YoutubeGroup.parse(findFirstElement(element, 'media:group')),
    );
  }
}
