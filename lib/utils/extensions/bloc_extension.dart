import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ignore: prefer-match-file-name
mixin PresenterState<M, P extends Cubit<M>, T extends HasPresenter<P>> on State<T> {
  P get presenter => widget.presenter;

  M get state => presenter.state;

  Widget stateObserver({
    required BlocWidgetBuilder<M> builder,
    BlocBuilderCondition<M>? buildWhen,
  }) {
    return BlocBuilder<P, M>(
      bloc: presenter,
      buildWhen: buildWhen,
      builder: builder,
    );
  }

  Widget stateListener({
    required BlocWidgetListener<M> listener,
    BlocListenerCondition<M>? listenWhen,
    Widget? child,
  }) {
    return BlocListener<P, M>(
      bloc: presenter,
      listener: listener,
      listenWhen: listenWhen,
      child: child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    presenter.close();
  }
}

mixin HasPresenter<P> on StatefulWidget {
  P get presenter;
}
