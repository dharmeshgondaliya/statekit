part of '../statekit.dart';

typedef StateViewBuilder<T> = Widget Function(T value);
typedef StateViewPLatformBuilder<T> = Widget Function(T value, Widget? child);

abstract class _StateViewWidget<T extends _St> extends StatefulWidget {
  const _StateViewWidget({super.key, required this.value});
  final T value;

  @override
  State<_StateViewWidget> createState() => _StateViewWidgetState();

  @protected
  Widget build(BuildContext context);
}

class _StateViewWidgetState extends State<_StateViewWidget> {
  @override
  void initState() {
    super.initState();
    widget.value._addCallbackFunction(_updateWidgetTree);
  }

  @override
  void dispose() {
    widget.value._removeCallbackFunction(_updateWidgetTree);
    super.dispose();
  }

  void _updateWidgetTree() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
