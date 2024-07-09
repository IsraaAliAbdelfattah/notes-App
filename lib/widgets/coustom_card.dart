import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Container(
            height: 200,
            width: double.infinity,
            child: Card(
              color: Color(0xffFFCC80),
            ),
          ),
        ),
        Positioned(
          left: 30,
          top:20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Flutter Tips',style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                  ),),
                  SizedBox(
                    width: 140,
                  ),
                  IconButton(onPressed: (){},
                   icon: Icon(Icons.delete,color: Colors.black,),),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('Build Your Career With',style: TextStyle(
                color: Colors.black.withOpacity(.3),
                fontSize: 18
              ),),
              Text('Tharwat Samy',style: TextStyle(
                color: Colors.black.withOpacity(.3),
                fontSize: 18
              ),),
              Padding(
                padding: const EdgeInsets.only(left: 210,top: 20),
                child: Text('Jul 9,2024',style: TextStyle(
                color: Colors.black.withOpacity(.3),
                  fontSize: 15
                ),),
              )
            ],
          )),
      ],
    );
  }
}