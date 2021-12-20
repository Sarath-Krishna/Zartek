import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zartek/model/dish_model.dart';

Future<List<Category_dishes>> fetchData() async {
  List<Category_dishes> dishes = [];
  List<Table_menu_list> tableMenu = [];

  var url = Uri.parse('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    List<DishModel> restaurants = jsonResponse.map((data) => DishModel.fromJson(data)).toList();
    await Future.forEach<DishModel>(restaurants, (restaurant) async {
      await Future.forEach<Table_menu_list>(restaurant.tableMenuList!,
          (tableMenuListItem) async {
        tableMenu.add(tableMenuListItem);
        await Future.forEach<Category_dishes>(tableMenuListItem.categoryDishes!,
            (dish) {
          dishes.add(dish);
        });
      });
    });
    return dishes;
    // return jsonResponse.map((data) => DishModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
