import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool isListView = true;
bool isNoteEmpty = true;
int? colorFilter;
List<Color> colorList = [
  Colors.white, // 0
  Color(0xFFFF9E9E), // 1
  Color(0xFFFFB347), // 2
  Color(0xFFFFF599), // 3
  Color(0xFF91F48F), // 4
  Color(0xFF9EFFFF), // 5
  Color(0xFFFD99FF), // 6
  Color(0xFFB69CFF), // 7
  Color(0xFF624AF2), // 8
  Color(0xFFFCDDEC), // 9
  Color(0xFFF1F1F1), // 10
  Color(0xFFC4C4C4), // 11
];
List<Map<String, dynamic>> notes = [
  //TODO: no hard code notes
  {
    'type': 'note',
    'title': 'UI concepts worth exsisting',
    'describe': '',
    'date': '3 days ago', //TODO: no hard code time
    'color': 6,
  },
  {
    'type': 'note',
    'title': 'Book Review : The Design of Everyday Things by Don Norman',
    'describe':
        'The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two.\n\nNorman is aware of the durability of his work and the applicability of his principles to multiple disciplines. \n\nIf you know the basics of design better than anyone else, you can apply them flawlessly anywhere.',
    'date': '6 days ago',
    'color': 0,
  },
  {
    'type': 'note',
    'title': 'Animes produced by Wit Studio',
    'describe': '',
    'date': '6 days ago',
    'color': 4,
  },
  {
    'type': 'note',
    'title': 'Mangas planned to read',
    'describe': '',
    'date': '10 days ago',
    'color': 3,
  },
  {
    'type': 'note',
    'title': 'Awesome tweets collection',
    'describe': '',
    'date': '10 days ago',
    'color': 5,
  },
  {
    'type': 'note',
    'title': 'List of free & open source apps',
    'describe': '',
    'date': '10 days ago',
    'color': 7,
  },
  {
    'type': 'to-do',
    'task': ['Prepare breakfast', 'Meetings at 10AM', 'Revision'],
    'completion': [false, false, false],
    'date': '10 days ago',
    'color': 4,
  },
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    notes.isEmpty ? isNoteEmpty = true : isNoteEmpty = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 82,
        title: Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),
        ),
        actions: [
          IconButton(
            onPressed: () => colourFilter(context),
            icon: Icon(Icons.color_lens, color: Colors.black, size: 24),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
            icon: Icon(
              isListView ? Icons.grid_view : Icons.view_stream,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
      body:
          isNoteEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/pic4.png'),
                    Text(
                      'Create your first note !',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              )
              : isListView
              ? buildListView()
              : buildGridView(),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x66000000),
              offset: Offset(-5, 5),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
          color: Color(0xFFFFB347),
        ),
        child: TextButton(
          onPressed: () {
            editorSelection(context);
          },
          child: Icon(Icons.add, color: Colors.white, size: 48),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 82,
        decoration: BoxDecoration(
          color: Color(0xFFF1F1F1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SizedBox(
          width: 384,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      color: Colors.black,
                      size: 24,
                      Icons.sticky_note_2_outlined,
                    ),
                    Text(
                      'Notes',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      color: Colors.black,
                      size: 24,
                      Icons.image_search_outlined,
                    ),
                    Text(
                      'OCR',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(color: Colors.black, size: 24, Icons.help_outline),
                    Text(
                      'Help',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(color: Colors.black, size: 24, Icons.person_outline),
                    Text(
                      'Me',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        itemCount:
            colorFilter == null
                ? notes.length
                : notes.where((i) => i['color'] == colorFilter).toList().length,
        itemBuilder: (context, index) {
          Map note = {};
          if (colorFilter == null) {
            note = notes[index];
          } else {
            note =
                notes.where((i) => i['color'] == colorFilter).toList()[index];
          }
          return Container(
            margin: EdgeInsets.only(bottom: 25),
            padding: EdgeInsets.fromLTRB(0, 22, 29, 11),
            decoration: BoxDecoration(
              color: colorList[note['color']],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: note['color'] == 0 ? Colors.black : Color(0x00000000),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                note['type'] == 'note'
                    ? Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: 46, right: 37),
                      child: Text(
                        note['title'],
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                    : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: note['task'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            SizedBox(width: 33),
                            Checkbox(
                              value: note['completion'][index],
                              onChanged: (value) {
                                setState(() {
                                  note['completion'][index] = value ?? false;
                                });
                              },
                            ),
                            Text(
                              note['task'][index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                SizedBox(height: 8),
                Text(
                  note['date'],
                  style: TextStyle(fontSize: 14),
                ), //TODO: no hard code
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: MasonryGridView.count(
        itemCount:
            colorFilter == null
                ? notes.length
                : notes.where((i) => i['color'] == colorFilter).toList().length,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        itemBuilder: (context, index) {
          Map note = {};
          if (colorFilter == null) {
            note = notes[index];
          } else {
            note =
                notes.where((i) => i['color'] == colorFilter).toList()[index];
          }
          return TextButton(
            onPressed: () {
              // TODO: Editor
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorList[note['color']],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: note['color'] == 0 ? Colors.black : Color(0x00000000),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  note['type'] == 'note'
                      ? SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          note['title'],
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                      : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: note['task'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: note['completion'][index],
                                  onChanged: (value) {
                                    setState(() {
                                      note['completion'][index] =
                                          value ?? false;
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  note['task'][index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                  SizedBox(height: 8),
                  Text(
                    note['date'],
                    style: TextStyle(fontSize: 14),
                  ), //TODO: no hard code
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> colourFilter(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Filter by colour'),
          content: SizedBox(
            width: 393,
            height: 488,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 13.5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: Size(100, 40),
                            side: BorderSide(),
                          ),
                          onPressed: () {
                            setState(() {
                              colorFilter = null;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Reset'),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(child: Container(width: 100)),
                      SizedBox(width: 15),
                      Expanded(child: Container(width: 100)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 13.5),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    colorFilter = index * 3;
                                  });
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorList[index * 3],
                                  fixedSize: Size(100, 40),
                                  side: index == 0 ? BorderSide() : null,
                                  elevation: 0,
                                ),
                                child: Container(),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    colorFilter = index * 3 + 1;
                                  });
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorList[index * 3 + 1],
                                  fixedSize: Size(100, 40),
                                  elevation: 0,
                                ),
                                child: Container(),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    colorFilter = index * 3 + 2;
                                  });
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorList[index * 3 + 2],
                                  fixedSize: Size(100, 40),
                                  elevation: 0,
                                ),
                                child: Container(),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> editorSelection(BuildContext content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 414,
            height: 164,
            child: Column(
              children: [
                Text(
                  'New',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Add note
                        Navigator.of(context).pop();
                      },
                      label: Text(
                        'Add note',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      icon: Icon(Icons.keyboard, color: Colors.black, size: 24),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Add to-do
                        Navigator.of(context).pop();
                      },
                      label: Text(
                        'Add to-do',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      icon: Icon(
                        Icons.check_box,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
