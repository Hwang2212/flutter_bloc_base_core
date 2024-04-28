class SupabaseConstants {
  static const anonKey = 'ANON_KEY';
  static const supabaseUrl = 'SUPABASE_URL';
}

class ApiStatusCodes {
  static const success = 200;
  static const tokenExpired = 401;
  static const forbidden = 403;
}

class ApiDefaults {
  // TODO DEVELOPER: Change Base Url of API Service.
  static const baseUrl = 'API_BASE_URL';
  static const sendTimeoutInMilliseconds = 30 * 1000;
  static const connectTimeoutInMilliseconds = 30 * 1000;
  static const receiveTimeoutInMilliseconds = 30 * 1000;
  static const defaultOffset = 0;
  static const defaultLimit = 20;
}
