import 'package:flutter/material.dart';

class ImmutableHolder<T> with ChangeNotifier {
  T _value;

  bool _isLoading = false;

  String _errorMsg;

  T get value => _value;
  bool get isLoading => _isLoading;
  String get errorMsg => _errorMsg;

  bool get isValueValid => _value != null;
  bool get hasError => _errorMsg != null;
}

class Holder<T> extends ImmutableHolder<T> {
  set value(T newValue) {
    _isLoading = false;
    _value = newValue;
    notifyListeners();
  }

  set isLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  set errorMsg(String message) {
    _isLoading = false;
    _errorMsg = message;
    notifyListeners();
  }
}

typedef HolderBuilderListener<T> = Widget Function(
    BuildContext context, ImmutableHolder<T> holder);

class HolderBuilder<T> extends StatefulWidget {
  final HolderBuilderListener<T> builder;
  final T initialData;
  final ImmutableHolder<T> holder;

  HolderBuilder({
    Key key,
    this.initialData,
    @required this.holder,
    @required this.builder,
  }) : super(key: key);

  @override
  _HolderBuilderState<T> createState() => _HolderBuilderState<T>();
}

class _HolderBuilderState<T> extends State<HolderBuilder<T>> {
  bool refresh = false;

  @override
  Widget build(BuildContext context) {
    return this.widget.builder(context, widget.holder);
  }

  @override
  void dispose() {
    widget.holder.dispose();
    super.dispose();
  }
}
