// Виджет, содержащий адаптивный scaffold
import 'package:flutter/material.dart';
import 'package:nes_route/router/book_app_state.dart';
import 'package:nes_route/router/inner_route_delegate.dart';

class AppShell extends StatefulWidget {
  final BooksAppState? appState;

  AppShell({
    @required this.appState,
  });

  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  InnerRouterDelegate? _routerDelegate;
  ChildBackButtonDispatcher? _backButtonDispatcher;

  void initState() {
    super.initState();
    _routerDelegate = InnerRouterDelegate(widget.appState!);
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _routerDelegate!.appState = widget.appState!;
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
    var appState = widget.appState;

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
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: appState!.selectedIndex,
        onTap: (newIndex) {
          appState.selectedIndex = newIndex;
        },
      ),
    );
  }
}
