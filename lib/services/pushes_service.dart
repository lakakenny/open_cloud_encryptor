class PushesService {
  static PushesService get instance => PushesService();

  factory PushesService() => _singleton;
  static final PushesService _singleton = PushesService._init();

  PushesService._init();

  void setUser() {
    // TODO: identify user in the pushes service
  }

  void unsetUser() {
    // TODO: clear user in the pushes service
  }
}
