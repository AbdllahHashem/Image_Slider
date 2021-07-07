import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_slider/states.dart';

import 'cubit.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ImageCubit(),
      child: BlocConsumer<ImageCubit,ImageStates>(
       listener: (context,state){},
        builder: (context,state){
         var cubit=ImageCubit.get(context);
         return Scaffold(
           appBar: AppBar(
             title: Text(
               'Image Slider',
               style:TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20.0,
               ),
             ),
           ),
           body: Center(
             child: Column(
               //mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                     height: 280.0,
                     width: double.infinity,
                     child:Image(
                       image: AssetImage(
                         cubit.animals[cubit.currentIndex],
                       ),
                       fit:BoxFit.cover,
                     )

                 ),
                 SizedBox(
                   height: 20.0,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround  ,
                   children: [
                     IconButton(
                       onPressed: (){
                         cubit.changeImageIndexBack();
                       },
                       icon: Icon(Icons.arrow_back),
                       iconSize: 40.0,
                       color: Colors.pink,
                     ),

                     IconButton(
                       onPressed: (){
                         cubit.changeImageIndexForward();
                       },
                       icon: Icon(Icons.arrow_forward),
                       iconSize: 40.0,
                       color: Colors.pink,
                     ),

                   ],
                 ),

               ],
             ),
           ),
         );
        },
      ),
    );
  }
}
