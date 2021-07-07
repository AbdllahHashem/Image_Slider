
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_slider/states.dart';

class ImageCubit extends Cubit<ImageStates>{

  ImageCubit() : super(InitialState());

  static ImageCubit get(context)=> BlocProvider.of(context);

  List<String> animals=[
    "images/animal1.jpg",
    'images/animal2.jpg',
    'images/animal3.jpeg',
    'images/image.jpg'
  ];

  int currentIndex=0;

   void changeImageIndexBack()
   {
     if (currentIndex >0 )
      currentIndex-- ;
     else
       currentIndex=animals.length-1;

     emit(ChangeImageBackState());
   }
  void changeImageIndexForward()
  {
    if (currentIndex < animals.length-1 )
      currentIndex++ ;
    else
      currentIndex=0;

    emit(ChangeImageForwardState());
  }

}

