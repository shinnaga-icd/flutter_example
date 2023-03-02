import 'package:envied/envied.dart';

part 'env.g.dart';

const dotenvFilePath =
    String.fromEnvironment('dotenv_file_path', defaultValue: 'env/.env.dev');

void main(List<String> args) {
  final config =
      args.firstWhere((arg) => arg.startsWith('config='), orElse: () => '');
  if (config.isEmpty) throw Exception('config parameter is missing');
}

@Envied(path: dotenvFilePath)
abstract class Env {
  @EnviedField(varName: 'API_KEY')
  static final val1 = _Env.val1;
  @EnviedField(varName: 'VAL2')
  static final val2 = _Env.val2;
}
