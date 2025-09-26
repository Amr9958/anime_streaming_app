import 'package:anime_streaming_app/core/constants/image_Names.dart';
import 'package:flutter/material.dart';
import '../widgets/category_tabs_widget.dart';
import '../widgets/anime_grid_section.dart';
import '../widgets/top_characters_section.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/anime_card_widget.dart';
import '../widgets/character_card_widget.dart';

class AnimeHomePage extends StatefulWidget {
  const AnimeHomePage({super.key});

  @override
  State<AnimeHomePage> createState() => _AnimeHomePageState();
}

class _AnimeHomePageState extends State<AnimeHomePage> {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'All',
    'Popular',
    'Trending',
    'New Releases',
    'Top Rated'
  ];

  final List<AnimeItem> animeList = [
    AnimeItem(
      title: 'Detective Conan',
      subtitle: 'Mystery',
      rating: 5.0,
      imageUrl: AppImages.Konan,
      isNew: true,
    ),
    AnimeItem(
      title: 'Hunter x Hunter',
      subtitle: 'Adventure',
      rating: 5.0,
      imageUrl: AppImages.HunterxHunter,
    ),
  ];

  final List<String> imgList = [
    AppImages.Konan,
    AppImages.HunterxHunter,
    AppImages.Naroto,
    AppImages.Lofy,
  ];

  final List<Character> topCharacters = [
    Character(
      name: 'Gon Freecss',
      anime: 'Hunter x Hunter',
      imageUrl: AppImages.HunterxHunter,
    ),
    Character(
      name: 'Naruto Uzumaki',
      anime: 'Naruto',
      imageUrl: AppImages.Naroto,
    ),
    Character(
      name: 'Luffy',
      anime: 'One Piece',
      imageUrl: AppImages.Lofy,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container with background decoration for main content
            Expanded(
              child: Stack(children: [
                Positioned(
                  right: -200,
                  top: -100,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.Star),
                        fit: BoxFit.contain,
                        opacity: 0.5,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Where Anime Comes Alive',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Category tabs
                          CategoryTabsWidget(
                            categories: categories,
                            selectedIndex: selectedCategoryIndex,
                            onCategorySelected: (index) {
                              setState(() {
                                selectedCategoryIndex = index;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    // Content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Featured anime grid
                            AnimeGridSection(
                                animeList: animeList, imgList: imgList),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            // TopCharactersSection outside the background decoration
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, -4),
                  ),
                ]),
                child: TopCharactersSection(characters: topCharacters)),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
