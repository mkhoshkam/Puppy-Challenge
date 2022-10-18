import 'package:get/get.dart';

class Page {
  late final String? _route;
  late final GetView? _page;
  late final Bindings? _binding;

  Page(this._route,this._page,this._binding);

  Bindings? get binding => _binding;

  GetView? get page => _page;

  String? get route => _route;
}