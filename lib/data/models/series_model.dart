import 'package:watchlist/data/models/show_model.dart';

class Series extends Show {
  final int season;

  Series({
    poster,
    backdrop,
    title,
    id,
    year,
    numOfRatings,
    criticsReview,
    metascoreRating,
    rating,
    genre,
    plot,
    cast,
    this.season,
  });
}
