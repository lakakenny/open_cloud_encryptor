import 'package:mobx/mobx.dart';

part 'auth.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  // disposers
  List<ReactionDisposer> _disposers;

  // store variables
  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  int count = 0;

  @action
  Future inc() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 2000)).then((future) {
      count++;

      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;

      print(e);
    });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
