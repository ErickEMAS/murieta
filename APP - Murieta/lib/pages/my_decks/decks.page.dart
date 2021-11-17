import 'package:flutter/material.dart';
import 'package:murieta/custom_widgets/app_box_list_item.dart';
import 'package:murieta/custom_widgets/app_scaffold.dart';
import 'package:murieta/themes/app_dimensions.dart';
import 'package:murieta/themes/app_icon.dart';

import 'decks.controler.dart';

class DecksPage extends StatefulWidget {
  @override
  _DecksPageState createState() => _DecksPageState();
}

class _DecksPageState extends State<DecksPage> {
  final decksController = new DecksController();

  @override
  void initState() {
    decksController.fetchdecks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarText: "Meus Deckes",
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: appWidth(context: context),
          child: ListView.builder(
            itemCount: decksController.decks.length,
            itemBuilder: (context, i) {
              return AppBoxListItem(
                icon: decksController.decks[i].type == 0 ? AppIcons.musica : decksController.decks[i].type == 1 ? AppIcons.cine : AppIcons.outros,
                content: decksController.decks[i].title, 
                onTap: () => {}, 
                header: false,
              );
            },
          ),
        ),
      ),
      
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
