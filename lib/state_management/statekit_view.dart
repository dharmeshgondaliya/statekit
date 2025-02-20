part of "../statekit.dart";

abstract class StatekitView<T extends StateController> extends StateBuilderBase<T> {
  StatekitView({super.key, super.tag});

  @override
  void initState() {}

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context);
}
