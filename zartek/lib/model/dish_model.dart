class DishModel {
  DishModel({
      String? restaurantId, 
      String? restaurantName, 
      String? restaurantImage, 
      String? tableId, 
      String? tableName, 
      String? branchName, 
      String? nexturl, 
      List<Table_menu_list>? tableMenuList,}){
    _restaurantId = restaurantId;
    _restaurantName = restaurantName;
    _restaurantImage = restaurantImage;
    _tableId = tableId;
    _tableName = tableName;
    _branchName = branchName;
    _nexturl = nexturl;
    _tableMenuList = tableMenuList;
}

  DishModel.fromJson(dynamic json) {
    _restaurantId = json['restaurant_id'];
    _restaurantName = json['restaurant_name'];
    _restaurantImage = json['restaurant_image'];
    _tableId = json['table_id'];
    _tableName = json['table_name'];
    _branchName = json['branch_name'];
    _nexturl = json['nexturl'];
    if (json['table_menu_list'] != null) {
      _tableMenuList = [];
      json['table_menu_list'].forEach((v) {
        _tableMenuList?.add(Table_menu_list.fromJson(v));
      });
    }
  }
  String? _restaurantId;
  String? _restaurantName;
  String? _restaurantImage;
  String? _tableId;
  String? _tableName;
  String? _branchName;
  String? _nexturl;
  List<Table_menu_list>? _tableMenuList;

  String? get restaurantId => _restaurantId;
  String? get restaurantName => _restaurantName;
  String? get restaurantImage => _restaurantImage;
  String? get tableId => _tableId;
  String? get tableName => _tableName;
  String? get branchName => _branchName;
  String? get nexturl => _nexturl;
  List<Table_menu_list>? get tableMenuList => _tableMenuList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_id'] = _restaurantId;
    map['restaurant_name'] = _restaurantName;
    map['restaurant_image'] = _restaurantImage;
    map['table_id'] = _tableId;
    map['table_name'] = _tableName;
    map['branch_name'] = _branchName;
    map['nexturl'] = _nexturl;
    if (_tableMenuList != null) {
      map['table_menu_list'] = _tableMenuList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Table_menu_list {
  Table_menu_list({
      String? menuCategory, 
      String? menuCategoryId, 
      String? menuCategoryImage, 
      String? nexturl, 
      List<Category_dishes>? categoryDishes,}){
    _menuCategory = menuCategory;
    _menuCategoryId = menuCategoryId;
    _menuCategoryImage = menuCategoryImage;
    _nexturl = nexturl;
    _categoryDishes = categoryDishes;
}

  Table_menu_list.fromJson(dynamic json) {
    _menuCategory = json['menu_category'];
    _menuCategoryId = json['menu_category_id'];
    _menuCategoryImage = json['menu_category_image'];
    _nexturl = json['nexturl'];
    if (json['category_dishes'] != null) {
      _categoryDishes = [];
      json['category_dishes'].forEach((v) {
        _categoryDishes?.add(Category_dishes.fromJson(v));
      });
    }
  }
  String? _menuCategory;
  String? _menuCategoryId;
  String? _menuCategoryImage;
  String? _nexturl;
  List<Category_dishes>? _categoryDishes;

  String? get menuCategory => _menuCategory;
  String? get menuCategoryId => _menuCategoryId;
  String? get menuCategoryImage => _menuCategoryImage;
  String? get nexturl => _nexturl;
  List<Category_dishes>? get categoryDishes => _categoryDishes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['menu_category'] = _menuCategory;
    map['menu_category_id'] = _menuCategoryId;
    map['menu_category_image'] = _menuCategoryImage;
    map['nexturl'] = _nexturl;
    if (_categoryDishes != null) {
      map['category_dishes'] = _categoryDishes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Category_dishes {
  Category_dishes({
      String? dishId, 
      String? dishName, 
      double? dishPrice, 
      String? dishImage, 
      String? dishCurrency, 
      double? dishCalories, 
      String? dishDescription, 
      bool? dishAvailability, 
      int? dishType, 
      String? nexturl, 
      List<AddonCat>? addonCat,}){
    _dishId = dishId;
    _dishName = dishName;
    _dishPrice = dishPrice;
    _dishImage = dishImage;
    _dishCurrency = dishCurrency;
    _dishCalories = dishCalories;
    _dishDescription = dishDescription;
    _dishAvailability = dishAvailability;
    _dishType = dishType;
    _nexturl = nexturl;
    _addonCat = addonCat;
}

  Category_dishes.fromJson(dynamic json) {
    _dishId = json['dish_id'];
    _dishName = json['dish_name'];
    _dishPrice = json['dish_price'];
    _dishImage = json['dish_image'];
    _dishCurrency = json['dish_currency'];
    _dishCalories = json['dish_calories'];
    _dishDescription = json['dish_description'];
    _dishAvailability = json['dish_Availability'];
    _dishType = json['dish_Type'];
    _nexturl = json['nexturl'];
    if (json['addonCat'] != null) {
      _addonCat = [];
      json['addonCat'].forEach((v) {
        _addonCat?.add(AddonCat.fromJson(v));
      });
    }
  }
  String? _dishId;
  String? _dishName;
  double? _dishPrice;
  String? _dishImage;
  String? _dishCurrency;
  double? _dishCalories;
  String? _dishDescription;
  bool? _dishAvailability;
  int? _dishType;
  String? _nexturl;
  List<AddonCat>? _addonCat;

  String? get dishId => _dishId;
  String? get dishName => _dishName;
  double? get dishPrice => _dishPrice;
  String? get dishImage => _dishImage;
  String? get dishCurrency => _dishCurrency;
  double? get dishCalories => _dishCalories;
  String? get dishDescription => _dishDescription;
  bool? get dishAvailability => _dishAvailability;
  int? get dishType => _dishType;
  String? get nexturl => _nexturl;
  List<AddonCat>? get addonCat => _addonCat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dish_id'] = _dishId;
    map['dish_name'] = _dishName;
    map['dish_price'] = _dishPrice;
    map['dish_image'] = _dishImage;
    map['dish_currency'] = _dishCurrency;
    map['dish_calories'] = _dishCalories;
    map['dish_description'] = _dishDescription;
    map['dish_Availability'] = _dishAvailability;
    map['dish_Type'] = _dishType;
    map['nexturl'] = _nexturl;
    if (_addonCat != null) {
      map['addonCat'] = _addonCat?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AddonCat {
  AddonCat({
      String? addonCategory, 
      String? addonCategoryId, 
      int? addonSelection, 
      String? nexturl, 
      List<Addons>? addons,}){
    _addonCategory = addonCategory;
    _addonCategoryId = addonCategoryId;
    _addonSelection = addonSelection;
    _nexturl = nexturl;
    _addons = addons;
}

  AddonCat.fromJson(dynamic json) {
    _addonCategory = json['addon_category'];
    _addonCategoryId = json['addon_category_id'];
    _addonSelection = json['addon_selection'];
    _nexturl = json['nexturl'];
    if (json['addons'] != null) {
      _addons = [];
      json['addons'].forEach((v) {
        _addons?.add(Addons.fromJson(v));
      });
    }
  }
  String? _addonCategory;
  String? _addonCategoryId;
  int? _addonSelection;
  String? _nexturl;
  List<Addons>? _addons;

  String? get addonCategory => _addonCategory;
  String? get addonCategoryId => _addonCategoryId;
  int? get addonSelection => _addonSelection;
  String? get nexturl => _nexturl;
  List<Addons>? get addons => _addons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addon_category'] = _addonCategory;
    map['addon_category_id'] = _addonCategoryId;
    map['addon_selection'] = _addonSelection;
    map['nexturl'] = _nexturl;
    if (_addons != null) {
      map['addons'] = _addons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Addons {
  Addons({
      String? dishId, 
      String? dishName, 
      double? dishPrice, 
      String? dishImage, 
      String? dishCurrency, 
      double? dishCalories, 
      String? dishDescription, 
      bool? dishAvailability, 
      int? dishType,}){
    _dishId = dishId;
    _dishName = dishName;
    _dishPrice = dishPrice;
    _dishImage = dishImage;
    _dishCurrency = dishCurrency;
    _dishCalories = dishCalories;
    _dishDescription = dishDescription;
    _dishAvailability = dishAvailability;
    _dishType = dishType;
}

  Addons.fromJson(dynamic json) {
    _dishId = json['dish_id'];
    _dishName = json['dish_name'];
    _dishPrice = json['dish_price'];
    _dishImage = json['dish_image'];
    _dishCurrency = json['dish_currency'];
    _dishCalories = json['dish_calories'];
    _dishDescription = json['dish_description'];
    _dishAvailability = json['dish_Availability'];
    _dishType = json['dish_Type'];
  }
  String? _dishId;
  String? _dishName;
  double? _dishPrice;
  String? _dishImage;
  String? _dishCurrency;
  double? _dishCalories;
  String? _dishDescription;
  bool? _dishAvailability;
  int? _dishType;

  String? get dishId => _dishId;
  String? get dishName => _dishName;
  double? get dishPrice => _dishPrice;
  String? get dishImage => _dishImage;
  String? get dishCurrency => _dishCurrency;
  double? get dishCalories => _dishCalories;
  String? get dishDescription => _dishDescription;
  bool? get dishAvailability => _dishAvailability;
  int? get dishType => _dishType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dish_id'] = _dishId;
    map['dish_name'] = _dishName;
    map['dish_price'] = _dishPrice;
    map['dish_image'] = _dishImage;
    map['dish_currency'] = _dishCurrency;
    map['dish_calories'] = _dishCalories;
    map['dish_description'] = _dishDescription;
    map['dish_Availability'] = _dishAvailability;
    map['dish_Type'] = _dishType;
    return map;
  }

}