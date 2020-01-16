class LiveAuth {
  String client_id = '';
  String redirect_uri = '';
  String client_secret = '';
  String code = '';
  String grant_type = '';

  LiveAuth(
    this.client_id,
    this.redirect_uri,
    this.client_secret,
    this.code,
    this.grant_type,
  );

  LiveAuth.fromJson(Map<String, dynamic> json) {
    client_id = json['street'];
    redirect_uri = json['city'];
    client_secret = json['state'];
    code = json['state'];
    grant_type = json['state'];
  }
}
