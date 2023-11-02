class CategoryModels {
  String? id;
  String name;

  CategoryModels({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap(){
    return{
      'id'    :id,
      'name'  :name,
    };
  }

  factory CategoryModels.fromMap(Map<String, dynamic> map) => CategoryModels(
    id: map['id'],
    name:  map['name'],
  );

  @override
  String toString() {
    return 'CategoryModels{id: $id, name: $name}';
  }

}
