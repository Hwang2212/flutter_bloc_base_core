import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wesplit/common/core/core.dart';

class SupabaseServices {
  static initialiseSupabase() async {
    await Supabase.initialize(
        url: SupabaseConstants.supabaseUrl, anonKey: SupabaseConstants.anonKey);
  }

  static final supabase = Supabase.instance.client;
}
