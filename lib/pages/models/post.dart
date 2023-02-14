class Post {
  final String image;
  final String description;
  final String author;
  final String likeNumber;
  final String profileImage;

  Post(
      {required this.image,
      required this.description,
      required this.author,
      required this.likeNumber,
      required this.profileImage});
}

List<Post> postList = [
  Post(
      image: "assets/images/image1.png",
      description: "34岁觉醒，开挂的两年，让我的人生太爽了",
      author: "英子",
      likeNumber: "2179",
      profileImage: "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80"
  ),
  Post(
      image: "assets/images/image2.png",
      description: "厚积薄发才是王道！！！",
      author: "小陈的生存笔记",
      likeNumber: "371",
      profileImage: "https://images.unsplash.com/photo-1500206329404-5057e0aefa48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80"
  ),
  Post(
      image: "assets/images/image3.png",
      description: "和一位年入百万的00后，彻夜畅谈",
      author: "老杨本杨",
      likeNumber: "837",
      profileImage: "https://plus.unsplash.com/premium_photo-1669135330361-4f8a363dbefe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  ),
  Post(
      image: "assets/images/image4.png",
      description: "在英国读研究生真的会不适应吗？",
      author: "野猪🐗在诺村",
      likeNumber: "4",
      profileImage: "https://images.unsplash.com/photo-1522098605161-cc0c1434c31a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJlYWNoJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  ),
];
