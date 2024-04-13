import 'package:blocs_cubit_sample/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/cubits', builder: (context, state) => const CubitCounterScreen()),
  GoRoute(
      path: '/blocs', builder: (context, state) => const BlocCounterScreen()),
  GoRoute(path: '/auth', builder: (context, state) => const LocalAuthScreen())
]);
