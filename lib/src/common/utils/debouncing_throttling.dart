import 'dart:async';

class DeBouncing {
  DeBouncing(this._duration);

  final Duration _duration;
  Timer? _timer;

  Future<void> handler(Future<void> Function() func) async {
    _timer?.cancel();

    _timer = Timer(_duration, () async => await func());
  }

  void dispose() {
    _timer?.cancel();
  }
}

/// TODO(Miracle): Write this for searching API's

mixin Throttling {}
