import 'package:get_it/get_it.dart';
import 'package:testingnewapp/Server/Apiserver.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
