enum Env {
  PROD,
  DEV,
  LOCAL,
}

class Config {
  static Env env;

  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return "http://yuanxuxu.com";
      case Env.DEV:
        return "http://develop.yuanxuxu.com";
      case Env.LOCAL:
      default:
        return "http://127.0.0.1:9090";
    }
  }
}