import 'package:get_it/get_it.dart';
import 'package:stroll/repository/bonfire_repository.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<BonfireRepository>(() => BonfireRepository());
}
