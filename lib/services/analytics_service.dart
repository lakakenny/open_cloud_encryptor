class AnalyticsService {
  static AnalyticsService get instance => AnalyticsService();
  static final AnalyticsService _singleton = AnalyticsService._init();

  factory AnalyticsService() => _singleton;

  AnalyticsService._init();

  void setUser() {
    // TODO: identify user in the analytics service
  }

  void unsetUser() {
    // TODO: clear user in the analytics service
  }
}
