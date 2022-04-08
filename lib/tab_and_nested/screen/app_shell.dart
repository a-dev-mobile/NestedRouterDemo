// Виджет, содержащий адаптивный scaffold
import 'package:flutter/material.dart';
import 'package:nes_route/tab_and_nested/app/router/app_state.dart';
import 'package:nes_route/tab_and_nested/app/router/inner_route_delegate.dart';

/// bottom bar
class AppShell extends StatefulWidget {
  ///
  const AppShell({
    Key? key,
    @required AppState? appState,
  })  : _appState = appState,
        super(key: key);

  final AppState? _appState;
  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late InnerRouterDelegate? _routerDelegate;
  ChildBackButtonDispatcher? _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _routerDelegate = InnerRouterDelegate(widget._appState!);
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _routerDelegate!.appState = widget._appState!;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Отложите диспетчеризацию кнопки "Назад" на дочерний маршрутизатор
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher
        ?.createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    final appState = widget._appState;

    // Приоритет требования, Если есть параллельные суб-маршрутизаторы, вам понадобится
    // чтобы выбрать, какой из них должен быть приоритетным;
    _backButtonDispatcher!.takePriority();

    return Scaffold(
      body: Router(
        routerDelegate: _routerDelegate!,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_score), label: 'о приложении'),
        ],
        currentIndex: appState!.selectedIndex,
        onTap: (newIndex) => appState.selectedIndex = newIndex,
      ),
    );
  }
}
