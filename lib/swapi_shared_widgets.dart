import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BusyState extends StateNotifier<bool> {
  BusyState() : super(false);
  static final provider = StateNotifierProvider.autoDispose((_) => BusyState());
  void busy() => state = true;
  void notBusy() => state = false;
}

class BusyCircularProgressIndicator extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final busy = useProvider(BusyState.provider.state) ?? false;

    return busy
        ? Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )),
          )
        : SizedBox.shrink() ?? SizedBox.shrink();
  }
}

class BottomUrlContainer extends StatelessWidget {
  const BottomUrlContainer({Key key, this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text('$url'),
    );
  }
}
