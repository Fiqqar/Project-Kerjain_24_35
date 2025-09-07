import 'package:get/get.dart';
import 'package:kerjain/controllers/addtodo_controller.dart';


class AddTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(() => AddTodoController());
  }
}