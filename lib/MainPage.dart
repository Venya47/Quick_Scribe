import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_scribe/new_or_edit_note_page.dart';
import 'package:quick_scribe/widgets/note_icon_button.dart';
import 'package:quick_scribe/widgets/note_icon_button_outlined.dart';
import 'constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> ddoptions=["Date modified","Date created"];
  late String ddvalue=ddoptions.first;
  bool isDesc=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Quick Scribe...",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),)),
        actions: [
          NoteIconButtonOutlined(
              icon: FontAwesomeIcons.rightFromBracket,
              onPressed: (){}
          ),
        ],
        backgroundColor: Colors.yellow[300],
      ),
      floatingActionButton: FloatingActionButton.large(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>NewOrEditNotePage()));},
        child: FaIcon(FontAwesomeIcons.plus),backgroundColor: primary,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText:'Search notes...' ,
                hintStyle: TextStyle(fontSize: 12),
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                fillColor: white,
                filled: true,
                isDense:true,
                contentPadding: EdgeInsets.zero,
                prefixIconConstraints: BoxConstraints(minHeight: 42,minWidth: 42),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: primary)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: primary))
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  NoteIconButton(size:18,Icon: isDesc? FontAwesomeIcons.arrowDown:FontAwesomeIcons.arrowUp, onPressed: (){setState(() {
                    isDesc=!isDesc;
                  });}),
                  SizedBox(width: 16,),
                  DropdownButton(
                      value:ddvalue,
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FaIcon(FontAwesomeIcons.arrowDownWideShort,size: 18,color: gray700,),
                      ),
                      underline: SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(12),
                      isDense: true,
                      items: ddoptions.map((e)=>DropdownMenuItem(
                          value:e,child: Row(
                            children: [
                              Text(e),
                              if(e==ddvalue)...[
                              SizedBox(width: 8,),
                              Icon(Icons.check),
                            ],
                          ]))).toList(),
                      selectedItemBuilder: (context)=>ddoptions.map((e)=>Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(e),
                      )).toList(),
                      onChanged:(newValue)
                      {
                        setState(() {
                          ddvalue=newValue!;
                        });
                      }
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    setState(() {
                      //isGrid=!isGrid;
                    });
                  },
                      icon:FaIcon(FontAwesomeIcons.bars),
                    padding: EdgeInsets.only(right: 16),
                    visualDensity: VisualDensity.compact,
                    constraints: BoxConstraints(),
                    style: IconButton.styleFrom(tapTargetSize:MaterialTapTargetSize.shrinkWrap ),
                    iconSize: 18,
                    color: gray700,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 4,mainAxisSpacing: 4),
                  itemBuilder: (context,int ind){
                    return Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: primary,width: 2),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(
                            color:primary,
                            offset: Offset(4, 4)
                        )],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("This is going to be a title",
                          maxLines: 1,
                          overflow:TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: gray900),),
                          SizedBox(height: 4,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:List.generate(3,(index)=>
                                Container(
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color:gray100,
                                  ),
                                  padding:EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                  margin: EdgeInsets.only(right: 4),
                                  child:Text("First chip",style: TextStyle(fontSize: 10,color:gray700 ),),
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Expanded(child: Text("Some content")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('02 Nov 2025',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: gray500),),
                              FaIcon(FontAwesomeIcons.trash,color:gray500,size: 16,),
                            ],
                          )
                        ],
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}