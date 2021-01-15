import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watchlist/constants/images.dart';
import 'package:watchlist/data/models/show_model.dart';

class MovieDetailPage extends StatelessWidget {
  final dynamic arguments;

  const MovieDetailPage({Key key, @required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Show show = this.arguments['show'];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: '${show?.rawMediaType}-${this.arguments['from']}-${show?.id}',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: show.hasPoster
                          ? CachedNetworkImageProvider(
                              show?.getPosterUrl(size: PosterSize.XLARGE),
                            )
                          : AssetImage("assets/images/no-image.png"),
                    ),
                  ),
                ),
              ),
            ),
            expandedHeight: 400.0,
            actions: [],
          ),
          SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
