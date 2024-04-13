import 'package:blocs_cubit_sample/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:blocs_cubit_sample/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalAuthScreen extends StatelessWidget {
  const LocalAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: LocalAuthScreenView(),
    );
  }
}

class LocalAuthScreenView extends StatelessWidget {
  const LocalAuthScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAuth = false;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Auth'),
          actions: [
            context.select((AuthCubit value) => IconButton(
                onPressed: () => {value.reset()},
                icon: const Icon(Icons.refresh_outlined)))
          ],
        ),
        body: Center(
          child: context.select(
            (AuthCubit value) => Center(
                child: Column(
              children: [
                Text('Estado :  ${value.state.isAuth}'),
                TextButton(
                    onPressed: () async =>
                        {value.changeAuth(await Auth.authenticate())},
                    child: const Text('Verificar...'))
              ],
            )),
          ),
        ));
  }
}
