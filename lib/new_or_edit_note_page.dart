
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_scribe/constants.dart';
import 'package:quick_scribe/widgets/note_icon_button.dart';
import 'package:quick_scribe/widgets/note_icon_button_outlined.dart';

class NewOrEditNotePage extends StatefulWidget {
  const NewOrEditNotePage({super.key});

  @override
  State<NewOrEditNotePage> createState() => _NewOrEditNotePageState();
}

class _NewOrEditNotePageState extends State<NewOrEditNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteIconButtonOutlined(
              icon: FontAwesomeIcons.chevronLeft,
              onPressed: (){}),
        ),
        title: Text('New Node'),
        actions: [
          NoteIconButtonOutlined(
              icon: FontAwesomeIcons.pen,
              onPressed: (){}),
          NoteIconButtonOutlined(
              icon: FontAwesomeIcons.check,
              onPressed: (){})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                  hintText: "Tile here ",
                  hintStyle: TextStyle(color: gray300),
                  border: InputBorder.none,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                    child: Text("Last Modified",
                      style: TextStyle(fontWeight: FontWeight.bold,color: gray300),)),
                Expanded(
                  flex: 5,
                    child: Text("7 Dec 2020, 3:35PM",
                      style: TextStyle(fontWeight: FontWeight.bold,color: gray300),
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                    child: Text("Created at",
                      style: TextStyle(fontWeight: FontWeight.bold,color: gray300),)),
                Expanded(
                  flex: 5,
                    child: Text("6 Dec 2019, 3:35PM",
                      style: TextStyle(fontWeight: FontWeight.bold,color: gray300),))
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Text("Tags",
                        style: TextStyle(fontWeight: FontWeight.bold,color: gray300),),
                      NoteIconButton(size: 14, Icon: FontAwesomeIcons.circlePlus, onPressed: (){})
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                    child: Text("No tags added",
                      style: TextStyle(fontWeight: FontWeight.bold,color: gray300),)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(color: gray500,thickness: 2,),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Note here..."),
            )
          ],
        ),
      ),
    );
  }
}
