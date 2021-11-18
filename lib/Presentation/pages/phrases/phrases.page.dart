import 'package:flutter/material.dart';
import 'package:murieta/Presentation/custom_widgets/app_box_list_item.dart';
import 'package:murieta/Presentation/custom_widgets/app_scaffold.dart';
import 'package:murieta/Presentation/pages/phrases/phrases.controler.dart';
import 'package:murieta/core/themes/app_dimensions.dart';

class PhrasesPage extends StatefulWidget {
  @override
  _PhrasesPageState createState() => _PhrasesPageState();
}

class _PhrasesPageState extends State<PhrasesPage> {
  final phrasesController = new PhrasesController();

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
            itemCount: phrasesController.phrases.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  AppBoxListItem(
                    content: phrasesController.phrases[i][0][0], 
                    onTap: () => {}, 
                    header: true,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: phrasesController.phrases[i].length,
                    itemBuilder: (context, j) {
                      return AppBoxListItem(
                        content: phrasesController.phrases[i][j], 
                        onTap: () => {}, 
                        header: false,
                      );
                    }
                  ),
                  SizedBox(height: i == phrasesController.phrases.length - 1 ? 16 : 0),
                ],
              );
            }
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
