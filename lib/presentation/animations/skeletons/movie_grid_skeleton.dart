import 'package:flutter/material.dart';

class MovieGridSkeleton extends StatelessWidget {
  final Animation gradientPosition;

  MovieGridSkeleton({Key key, this.gradientPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 542.0,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 35.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: 370.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: Alignment(gradientPosition.value, 0),
                        end: Alignment(-1, 0),
                        colors: [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12,
                          Colors.black12,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 200.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      begin: Alignment(gradientPosition.value, 0),
                      end: Alignment(-1, 0),
                      colors: [
                        Colors.black12,
                        Colors.black26,
                        Colors.black12,
                        Colors.black12,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 100.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      begin: Alignment(gradientPosition.value, 0),
                      end: Alignment(-1, 0),
                      colors: [
                        Colors.black12,
                        Colors.black26,
                        Colors.black12,
                        Colors.black12,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 45.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 32.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(gradientPosition.value, 0),
                        end: Alignment(-1, 0),
                        colors: [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12,
                          Colors.black12,
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 32.5,
                  height: 22.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(gradientPosition.value, 0),
                      end: Alignment(-1, 0),
                      colors: [
                        Colors.black12,
                        Colors.black26,
                        Colors.black12,
                        Colors.black12,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 32.5,
                  height: 15.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(gradientPosition.value, 0),
                      end: Alignment(-1, 0),
                      colors: [
                        Colors.black12,
                        Colors.black26,
                        Colors.black12,
                        Colors.black12,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
