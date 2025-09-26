import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/routes.dart';
import 'anime_card_widget.dart';

class AnimeGridSection extends StatelessWidget {
  final List<AnimeItem> animeList;
  final List<String>? imgList;
  

  const AnimeGridSection({
    super.key,
    required this.animeList,
    this.imgList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          return AnimeCardWidget(
            img: imgList?[index],
            anime: animeList[index],
            onTap: () {
              context.go(Routes.animeDetail, extra: {
                'title': animeList[index].title,
                'description': 'A captivating anime series about ${animeList[index].subtitle}',
                'genres': [animeList[index].subtitle, 'Adventure'],
                'views': '3M',
                'claps': '2K',
                'seasons': '4',
              });
            },
          );
        },
      ),
    );
  }
}