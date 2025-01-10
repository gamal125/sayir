class PostModel{
  String? nRooms;
  String? age;
  String? name;

  String? image;
  String? image2;
  String? image3;
  String? price;
  String? description;
  String? location;
  String? type;
  String? area;


  PostModel({
    this.name,

    this.age,
    this.nRooms,
    this.image,
    this.image2,
    this.image3,
    this.description,
    this.price,
    this.location,
    this.type,this.area,



  });

  PostModel.fromjson(Map<String,dynamic>json){
    name=json['name'];
    nRooms=json['nRooms'];
    age=json['age'];
    image=json['image'];
    image2=json['image2'];
    image3=json['image3'];
    description=json['description'];
    price=json['price'];
    location=json['location'];
    type=json['type'];
    area=json['area'];





  }
  Map<String,dynamic> Tomap(){
    return{
      'name':name,

      'nRooms':nRooms,
      'age':age,
      'image':image,
      'image2':image2,
      'image3':image3,
      'description':description,
      'price':price,
      'location':location,
      'type':type,
      'area':area,




    };
  }


}