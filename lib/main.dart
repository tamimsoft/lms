import 'package:flutter/material.dart';
import 'package:lms/app/app.dart';
import 'package:lms/app/core/constants/api_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/core/services/database/online/supabase_auth_local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: ApiConstants.url,
    anonKey: ApiConstants.anonKey,
    authOptions:FlutterAuthClientOptions(
      autoRefreshToken: true,
      authFlowType: AuthFlowType.pkce,
      localStorage: SupabaseAuthLocalStorage(),
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.debug,
    ),
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),
  );

  runApp(const App());
}

