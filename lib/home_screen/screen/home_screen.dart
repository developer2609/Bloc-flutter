import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../bloc/home_bloc.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


 class _HomeScreenState extends State<HomeScreen>{
   Future<void> _handlerrefresh() async{
      return await Future.delayed(Duration(seconds: 1),);

 }
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HomeBloc>(context).add(HomeLoadingData());
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dasrurchi mobile bloc"),
      ),
      body:LiquidPullToRefresh(
        onRefresh: _handlerrefresh,
      color: Colors.deepPurple,
      height: 100,
      backgroundColor: Colors.deepPurple[200],
      animSpeedFactor: 2,
      showChildOpacityTransition: false,
      child:BlocBuilder<HomeBloc,HomeState>(
        builder: (context,state){
          if(state is HomeSucces){
           return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: state.productlist.length,

                itemBuilder:(context,index){
                  return Card(
                    child: GridTile(

                      child: Image.network(state.productlist[index].image!),
                      footer: GridTileBar(
                        title: Text(state.productlist[index].title!),
                        backgroundColor: Colors.black,
                      ),
                      header: GridTileBar(
                        backgroundColor: Colors.black45,
                        title: Text(state.productlist[index].price.toString()),
                      ),
                    ),
                  );
                });
          }
          if(state is HomeError){
            return Center(child: Icon(Icons.error,size: 120,),);
          }

            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder:(context,index){
                return Card();
              });
        }
      ),
      )

    );
  }
  
 }

