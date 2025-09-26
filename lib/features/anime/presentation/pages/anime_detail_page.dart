import 'package:flutter/material.dart';
import '../widgets/anime_detail_background.dart';
import '../widgets/anime_detail_top_nav.dart';
import '../widgets/anime_detail_content.dart';

class AnimeDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> genres;
  final String views;
  final String claps;
  final String seasons;
  
  const AnimeDetailPage({
    super.key,
    this.title = 'DEMON SLAYER',
    this.description = 'A tale of courage, family, and fierce battles',
    this.genres = const ['Dark Fantasy', 'Action', 'Adventure'],
    this.views = '3M',
    this.claps = '2K',
    this.seasons = '4',
  });

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          const AnimeDetailBackground(),
          // Content overlay
          AnimeDetailContent(
            title: widget.title,
            description: widget.description,
            genres: widget.genres,
            views: widget.views,
            claps: widget.claps,
            seasons: widget.seasons,
          ),
          // Top navigation
          AnimeDetailTopNav(
            isBookmarked: isBookmarked,
            onBookmarkTap: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
            onBackTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }


}