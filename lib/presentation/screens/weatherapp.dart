import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/NosearchingPage.dart';
import 'package:weather_app/presentation/widget/searchingPage.dart';
import 'package:weather_app/presentation/widget/weatherBody.dart';
import 'package:weather_app/services/components/components.dart';
import 'package:weather_app/cubit/weatherCubit/weatherCubit.dart';
import 'package:weather_app/cubit/weatherCubit/weatherstate.dart';

class Weatherapp extends StatelessWidget {
  const Weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.blue,
        title: defulttext(data: "Weather"),
        actions: [
          IconButton(
            onPressed: () {
              navigat(context, widget: Searchingpage());
            },
            icon: Icon(Icons.search, size: 33),
          ),
        ],
      ),
      body: BlocConsumer<Weathercubit, Weatherstate>(
        builder: (context, state) {
          if (state is weatherIntialState) {
            return NosearchingPage();

          }
          if (state is GetweatherState) {
            return Weatherbody(model: state.weathermodel,);
          } else if (state is weatherErrorState) {
            return Center(child: defulttext(data: "${state.error}"));
          } 
           else if (state is weatherLodingState) {
            return Center(child: CircularProgressIndicator());
          }
          else {
            return defulttext(data: " opps there was an dio error");
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
