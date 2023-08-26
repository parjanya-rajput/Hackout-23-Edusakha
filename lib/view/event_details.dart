import 'studentHome.dart';
import 'login_screen_student.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EventPageStudent extends StatefulWidget {
  const EventPageStudent({Key? key}) : super(key: key);

  @override
  State<EventPageStudent> createState() => _EventPageStudentState();
}

class _EventPageStudentState extends State<EventPageStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){ Navigator. push(context, MaterialPageRoute(builder: (context) => HomePageStudent()));
            },
            icon:Icon(Icons. arrow_back_ios),
          ),//replace with our own icon data. ) ,
          title: Text(
            "Event",
            style: TextStyle(color: Colors.white),),
          centerTitle: true,

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,


        ),
        bottomNavigationBar: Container(
          color: Color(0xffB9E9FC),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [

              EventJoin().wh(120,50),
            ],
          ).p32(),
        ),
        body: SafeArea(
          bottom: false,

          child: Expanded(
            child: Column(
              children: [
                EventHeader(),
                15.heightBox,

                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.".text.xs.textStyle(context.captionStyle).make().p16(),

              ],
            ).py64(),
          ),
        )


    );

  }
}

class EventHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Event Name".text.xl5.bold.make(),


        ]
    );
  }
}

class EventJoin extends StatelessWidget {
  const EventJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator. push(context, MaterialPageRoute(builder: (context) => LoginScreenStudent()));
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Colors.purple; //<-- SEE HERE
              return null; // Defer to the widget's default.
            },
          )
      ),
      child: Text("Join Code"),


    );
  }
}