import 'package:filmjy/src/bloc/userbloc/user_bloc.dart';
import 'package:filmjy/src/bloc/userbloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserHistoryList)
          print('the history state is ${state.history.length}');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('change me'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState)
              return CircularProgressIndicator();
            else if (state is UserHistoryList)
              return ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(state.history[index].title));
                },
              );
          },
        ),
      ),
    );
  }
}
