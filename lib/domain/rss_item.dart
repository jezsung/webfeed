import 'package:xml/xml.dart';

import '../util/datetime.dart';
import '../util/xml.dart';
import 'dublin_core/dublin_core.dart';
import 'itunes/itunes.dart';
import 'media/media.dart';
import 'rss_category.dart';
import 'rss_content.dart';
import 'rss_enclosure.dart';
import 'rss_source.dart';

class RssItem {
  final String title;
  final String description;
  final String link;

  final List<RssCategory> categories;
  final String guid;
  final DateTime pubDate;
  final String author;
  final String comments;
  final RssSource source;
  final RssContent content;
  final Media media;
  final RssEnclosure enclosure;
  final DublinCore dc;
  final Itunes itunes;

  RssItem({
    this.title,
    this.description,
    this.link,
    this.categories,
    this.guid,
    this.pubDate,
    this.author,
    this.comments,
    this.source,
    this.content,
    this.media,
    this.enclosure,
    this.dc,
    this.itunes,
  });

  factory RssItem.parse(XmlElement element) {
    return RssItem(
      title: findFirstElement(element, 'title')?.text,
      description: findFirstElement(element, 'description')?.text,
      link: findFirstElement(element, 'link')?.text,
      categories: element
          .findElements('category')
          .map((e) => RssCategory.parse(e))
          .toList(),
      guid: findFirstElement(element, 'guid')?.text,
      pubDate: parseDateTime(findFirstElement(element, 'pubDate')?.text),
      author: findFirstElement(element, 'author')?.text,
      comments: findFirstElement(element, 'comments')?.text,
      source: RssSource.parse(findFirstElement(element, 'source')),
      content: RssContent.parse(findFirstElement(element, 'content:encoded')),
      media: Media.parse(element),
      enclosure: RssEnclosure.parse(findFirstElement(element, 'enclosure')),
      dc: DublinCore.parse(element),
      itunes: Itunes.parse(element),
    );
  }
}
