import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lms/app/app.dart';
import 'package:lms/app/core/constants/supabase_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/core/services/database/online/supabase_auth_local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await Supabase.initialize(
    url: SupabaseConstants.url,
    anonKey: SupabaseConstants.anonKey,
    authOptions: FlutterAuthClientOptions(
      autoRefreshToken: true,
      authFlowType: AuthFlowType.pkce,
      localStorage: SupabaseAuthLocalStorage(),
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.debug,
    ),
    storageOptions: const StorageClientOptions(retryAttempts: 10),
  );

  runApp(const App());
}
