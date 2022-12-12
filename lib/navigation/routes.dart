enum Routes {
  splash(path: '/splash', name: 'splash'),
  home(path: '/home', name: 'home'),
  register(path: '/register', name: 'register'),
  login(path: '/login', name: 'login'),
  onboarding(path: '/onboarding', name: 'onboarding'),
  forgotPassword(path: '/forgot-password', name: 'forgotPassword');

  const Routes({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
  
}
