class Personagem {
  String name;
  String house;
  String image;

  Personagem({required this.name, required this.house, required this.image});

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      name: json['name'] == null
          ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiUGochbBtQe5ubdZbUQsrHe-ZFp21_zmD_Q&usqp=CAU'
          : json['name'],
      house: json['house'] == null ? '' : json['house'],
      image: json['image'] == null ? '' : json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'house': house,
        'image': image,
      };
}
