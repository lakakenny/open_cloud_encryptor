class LiveOauth {
  String client_id = '';
  String redirect_uri = '';
  String client_secret = '';
  String code = '';
  String grant_type = '';

  LiveOauth(
    this.client_id,
    this.redirect_uri,
    this.client_secret,
    this.code,
    this.grant_type,
  );

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};

    data['client_id'] = client_id;
    data['redirect_uri'] = redirect_uri;
    data['client_secret'] = client_secret;
    data['code'] = code;
    data['grant_type'] = grant_type;

    return data;
  }
}
