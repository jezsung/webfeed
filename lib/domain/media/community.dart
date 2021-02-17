import 'package:xml/xml.dart';

import '../../util/xml.dart';
import 'star_rating.dart';
import 'statistics.dart';
import 'tags.dart';

class Community {
  final StarRating starRating;
  final Statistics statistics;
  final Tags tags;

  Community({
    this.starRating,
    this.statistics,
    this.tags,
  });

  factory Community.parse(XmlElement element) {
    if (element == null) {
      return null;
    }
    return Community(
      starRating: StarRating.parse(
        findFirstElement(element, 'media:starRating'),
      ),
      statistics: Statistics.parse(
        findFirstElement(element, 'media:statistics'),
      ),
      tags: Tags.parse(
        findFirstElement(element, 'media:tags'),
      ),
    );
  }
}
