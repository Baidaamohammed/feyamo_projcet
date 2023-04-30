import 'package:feyamo_projcet/modules/archived_screen/archived_tasks_screen.dart';
import 'package:feyamo_projcet/modules/done_screen/done_tasks_screen.dart';
import 'package:feyamo_projcet/modules/tasks_screen/new_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget
{
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
{
  int currentIndex=0;
  List<Widget> screen=
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),

  ];
  Database ?database ;
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false ;
  IconData FabIcon= Icons.edit ;
  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  @override
  void initState() {
    super.initState();
    CreatDatabase();
  }
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      key: Scaffoldkey,
      appBar: AppBar(
        title: Text(
            titles[currentIndex],
        ),
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if (isBottomSheetShown)
          {
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              FabIcon = Icons.lock;
            });
          }
          else {
            Scaffoldkey.currentState?.showBottomSheet(
                    (context) =>
                    Column(
                      children: [
                        
                      ],
                    )
            );
            isBottomSheetShown= true;
            setState(() {
              FabIcon = Icons.edit;
            });
          }
          },
        child: Icon(
          FabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 50.0,
        currentIndex: currentIndex,
        onTap: (index)
        {
          setState(() {
            currentIndex=index;
          });

        },
        items: [
          BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.apple ),
            label: 'New Tasks',
          ),
          BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.heart),
            label: 'Done Tasks',
          ),
          BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.moon ),
            label: 'Moon Tasks',
          ),
        ],
      ),
    );
  }

 Future<String> getName() async
  {
    return 'Baidaa ';
  }

  void CreatDatabase () async
  {
     database = await openDatabase(
      'todo .db',
      version: 1,
        onCreate: (database , version)
        async {
          print('Database is Created');
         await database.execute(
             'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)'
         );

        },
      onOpen: (database)
      {
        print('Database is Opened');
      },

    );

  }
  void InsertToDatabase ()
  {
    database?.transaction((txn)
    {
      txn.rawInsert('INSERT INTO tasks (title,date,time, status) VALUE("First task","0232","20:00","new")')
          .then((value){}).catchError((error)
      {
        print('Error when Insert table ${error.toString()}');
      });
      return null!;
    });
  }
}
