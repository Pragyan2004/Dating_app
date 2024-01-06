import 'package:dating_app/functions/alert.dart';
import 'package:dating_app/widgets/appbar.dart';
import 'package:dating_app/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 List <SwipeItem> _swipeitems = <SwipeItem>[];
 MatchEngine? _matchEngine;
 List <String> names =  ['Andrew','master','christan','grannys','alex'];

@override
void initState(){
  for (int i=0;i<names.length;i++){
    _swipeitems.add(SwipeItem(content: Content(text: names[i]),
    likeAction: (){
      actions(context, names[i], 'liked');
    },
      nopeAction: (){
      actions(context, names[i], 'rejected');
      },
      superlikeAction: (){
      actions(context, names[i], 'superliked');
      },
    ));
    }
  _matchEngine=MatchEngine(swipeItems: _swipeitems);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Column(
        children: [
          SizedBox(height: 70),
          TopBar(),
          Expanded(child: Container(
            child: SwipeCards(matchEngine: _matchEngine!,
            itemBuilder:(BuildContext context,int index){
              List images=[
                'images/2.jpeg',
                'images/3.jpeg',
                'images/4.jpeg',
                'images/4.webp',
                'images/5.webp',
              ];
              return Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    Text(names[index],
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),

                  ],
                ),

              );
          },
            onStackFinished:(){
              return ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:Text('List is over')));
            } ,
            ),
          )),
          BottomBar(),
        ],
      ),
      ),
    );
  }
}

class Content {
  final String? text;
  Content ({this.text});
}