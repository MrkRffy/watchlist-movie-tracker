import 'package:flutter/material.dart';
import 'package:watchlist/presentation/animations/skeletons/movie_card_skeleton.dart';
import 'package:watchlist/presentation/animations/skeletons/movie_grid_skeleton.dart';

class MovieCardLoadingAnimation extends StatefulWidget {
  final String skeleton;

  MovieCardLoadingAnimation({Key key, this.skeleton}) : super(key: key);

  createState() => MovieCardLoadingAnimationState();
}

class MovieCardLoadingAnimationState extends State<MovieCardLoadingAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.skeleton) {
      case 'MovieCard':
        return MovieCardSkeleton(gradientPosition: gradientPosition);
      case 'MovieGrid':
        return MovieGridSkeleton(gradientPosition: gradientPosition);
      default:
        return MovieCardSkeleton(gradientPosition: gradientPosition);
    }
  }
}
