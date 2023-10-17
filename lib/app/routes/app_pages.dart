import 'package:get/get.dart';

import '../modules/add_projects/bindings/add_projects_binding.dart';
import '../modules/add_projects/views/add_projects_view.dart';
import '../modules/add_properties/bindings/add_properties_binding.dart';
import '../modules/add_properties/views/add_properties_view.dart';
import '../modules/chat_screen/bindings/chat_screen_binding.dart';
import '../modules/chat_screen/views/chat_screen_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/edit_properties/bindings/edit_properties_binding.dart';
import '../modules/edit_properties/views/edit_properties_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/requests/bindings/requests_binding.dart';
import '../modules/requests/views/requests_view.dart';
import '../modules/view_request/bindings/view_request_binding.dart';
import '../modules/view_request/views/view_request_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROPERTIES,
      page: () => const AddPropertiesView(),
      binding: AddPropertiesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROPERTIES,
      page: () => const EditPropertiesView(),
      binding: EditPropertiesBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SCREEN,
      page: () => const ChatScreenView(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROJECTS,
      page: () => const AddProjectsView(),
      binding: AddProjectsBinding(),
    ),
    GetPage(
      name: _Paths.REQUESTS,
      page: () => const RequestsView(),
      binding: RequestsBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_REQUEST,
      page: () => const ViewRequestView(),
      binding: ViewRequestBinding(),
    ),
  ];
}
