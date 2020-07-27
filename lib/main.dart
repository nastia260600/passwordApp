import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_password/password_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Password'),
          ),
          body: Center(
            child: PasswordScreen(),
          )),
    );
  }
}

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<PasswordScreen> {
  PasswordBloc _bloc;

  final _passwordController = TextEditingController();

  @override
  void initState() {
    this._bloc = PasswordBloc();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      return PasswordBloc();
    }, child: BlocBuilder<PasswordBloc, bool>(builder: (context, state) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              obscureText: state,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: InkWell(
                    onTap: () {
                      print('click');
                      context.bloc<PasswordBloc>().toggleShowPassword();
                    },
                    child: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
