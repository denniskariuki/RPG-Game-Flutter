import 'package:flutter/material.dart';
import 'package:rpg_game/models/character.dart';
import 'package:rpg_game/screens/profile/stats_table.dart';
import 'package:rpg_game/shared/styled_text.dart';

import '../../theme.dart';
class Profile extends StatelessWidget {
  const Profile({
    super.key,
  required this.character,
  });
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset("assets/img/vocations/${character.vocation.image}",
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    
                    ),
                  )

                ],

              ),
            ),
            // Basic Info
            const SizedBox(height: 20),
            Center(child: Icon(Icons.code , color: AppColors.primaryColor)),
            Padding(padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StyledHeading("Slogan"),
                  StyledText(character.slogan),
                  const SizedBox(height: 10),
                  const StyledHeading("Weapon of Choice"),
                  StyledText(character.vocation.weapon),
                  const SizedBox(height: 10),
                  const StyledHeading("Unique Ability"),
                  StyledText(character.vocation.ability),
                  const SizedBox(height: 10),
                ],
              ),
            ),),

            //Stats amd Skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                ]
              ),
            ),


            //Save Button

          ]
        ),
      ),
    );
  }
}
