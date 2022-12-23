abstract class BaseViewModel {
  //Shared variables and functions that will be used by any view model
}

abstract class BaseViewModelInputs {
  void init(); //Called when view model is initializing
  void dispose(); //Called when view model is being disposed
}

abstract class BaseViewModelOutputs {}
