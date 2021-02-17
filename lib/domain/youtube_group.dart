import 'package:xml/xml.dart';

import 'media/community.dart';
import 'media/content.dart';
import 'media/description.dart';
import 'media/thumbnail.dart';
import 'media/title.dart';

class YoutubeGroup {
  final Title title;
  final Content content;
  final Thumbnail thumbnail;
  final Description description;
  final Community community;

  YoutubeGroup({
    this.title,
    this.content,
    this.thumbnail,
    this.description,
    this.community,
  });

  factory YoutubeGroup.parse(XmlElement element) {
    if (element == null) {
      return null;
    }
    return YoutubeGroup(
      title: Title.parse(element.findElements('media:title').single),
      content: Content.parse(element.findElements('media:content').single),
      thumbnail: Thumbnail.parse(element.findElements('media:thumbnail').single),
      description: Description.parse(element.findElements('media:description').single),
      community: Community.parse(element.findElements('media:community').single),
    );
  }
}
