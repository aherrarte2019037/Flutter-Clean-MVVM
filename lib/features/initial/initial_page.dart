import 'package:flutter/material.dart';
import 'package:tutapp/features/initial/initial_page_presentation_model.dart';
import 'package:tutapp/features/initial/initial_page_presenter.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/widgets/status_bar/dark_status_bar.dart';
import 'package:tutapp/utils/extensions/bloc_extension.dart';

class InitialPage extends StatefulWidget with HasPresenter<InitialPagePresenter> {
  const InitialPage({
    super.key,
    required this.presenter,
  });

  @override
  final InitialPagePresenter presenter;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with PresenterState<InitialPageViewModel, InitialPagePresenter, InitialPage> {
  @override
  void initState() {
    super.initState();
    presenter.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return DarkStatusBar(
      child: Scaffold(
        backgroundColor: ColorTheme.blackWhite.shade100,
      ),
    );
  }
}
