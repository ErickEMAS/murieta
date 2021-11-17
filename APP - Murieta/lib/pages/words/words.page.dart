import 'package:flutter/material.dart';
import 'package:murieta/custom_widgets/app_box_list_item.dart';
import 'package:murieta/custom_widgets/app_scaffold.dart';
import 'package:murieta/pages/words/words.controler.dart';
import 'package:murieta/themes/app_dimensions.dart';
import 'package:murieta/themes/app_icon.dart';

class WordsPage extends StatefulWidget {
  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  final wordsController = new WordsController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarText: "Minhas Frases",
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: appWidth(context: context),
          child: ListView.builder(
            itemCount: wordsController.words.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  AppBoxListItem(
                    content: wordsController.words[i][0][0], 
                    onTap: () => {}, 
                    header: true,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: wordsController.words[i].length,
                    itemBuilder: (context, j) {
                      return AppBoxListItem(
                        content: wordsController.words[i][j], 
                        onTap: () => {}, 
                        header: false,
                      );
                    }
                  ),
                  SizedBox(height: i == wordsController.words.length - 1 ? 16 : 0),
                ],
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
