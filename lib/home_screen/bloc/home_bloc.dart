import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../api/product_model.dart';
import '../api/product_repisotory.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeLoadingData>((event, emit) async{
      emit(HomeLoading());
      try{

        final result = await  ProductRepository().getData();
        if(result !=[]){
          emit(HomeSucces(productlist:result));
        }else{
          emit(HomeError());
        }
      }catch(e){
        emit(HomeError());

      }
      // TODO: implement event handler
    });
  }
}


