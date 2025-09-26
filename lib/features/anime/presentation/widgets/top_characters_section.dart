import 'package:flutter/material.dart';
import 'character_card_widget.dart';

class TopCharactersSection extends StatelessWidget {
  final List<Character> characters;

  const TopCharactersSection({
    super.key,
    required this.characters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Top Characters',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterCardWidget(character: characters[index]);
            },
          ),
        ),
      ],
    );
  }
}