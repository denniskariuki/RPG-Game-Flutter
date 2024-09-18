import 'package:flutter/material.dart';
import 'package:rpg_game/screens/create/create.dart';
import 'package:rpg_game/screens/home/character_card.dart';
import 'package:rpg_game/shared/styled_button.dart';
import 'package:rpg_game/shared/styled_text.dart';

import '../../models/character.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const StyledTitle("RPG Game - Your Characters"),
      ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (_ , index){
                      return CharacterCard(characters[index]);
                    },
                  ),
                ),

                StyledButton(
                    onPressed:(){
                      //Navigation to a new Screen
                      Navigator.push(context, MaterialPageRoute(
                          builder: (ctx) => const Create()));
                    },
                  child: const StyledHeading('Create New Character'),
                )
              ],
            )
          ),
    );
  }
}
