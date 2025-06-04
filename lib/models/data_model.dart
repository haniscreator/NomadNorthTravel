import 'dart:math';

Random random = Random();

// Data Preparation Start from Here //
class PopularPlaces {
  final int id, price, review;
  final List<String>? image;
  final String name, description, category, location;
  final double rate;

  PopularPlaces({
    required this.name,
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.rate,
    required this.location,
    required this.price,
    required this.review,
  });
}

List<PopularPlaces> popularPlace = [
  PopularPlaces(
    id: 1,
    name: "Doi Suthep",
    category: 'popular',
    image: [
      'assets/images/doi_suthet/1.jpg',
      'assets/images/doi_suthet/2.jpg',
      'assets/images/doi_suthet/3.jpg',
    ],
    location: "Chiang Mai",
    rate: 4.8,
    review: random.nextInt(300) + 25,
    price: 1000,
    description: "Wat Phra That Doi Suthep is a sacred temple perched atop Doi Suthep mountain, offering panoramic views of Chiang Mai and a deep cultural experience.",
  ),
  PopularPlaces(
    id: 2,
    name: "Old City Temples",
    category: 'popular',
    image: [
      'assets/images/old_city/1.jpg',
      'assets/images/old_city/2.jpg',
      'assets/images/old_city/3.jpg',
    ],
    location: "Chiang Mai",
    rate: 4.7,
    review: random.nextInt(300) + 25,
    price: 1000,
    description: "The Old City of Chiang Mai is home to numerous ancient temples like Wat Chedi Luang and Wat Phra Singh, rich in history and architecture.",
  ),
  PopularPlaces(
    id: 3,
    name: "Chaloem Nature Park",
    category: 'popular',
    image: [
      'assets/images/chaloem_park/1.jpg',
      'assets/images/chaloem_park/2.jpg',
      'assets/images/chaloem_park/3.jpg',
    ],
    location: "Chaloem Phrakiat Park",
    rate: 4.9,
    review: random.nextInt(300) + 25,
    price: 1000,
    description: "A peaceful urban park in Chiang Mai known for its scenic lake, walking paths, and relaxing atmosphere—perfect for jogging, picnics, and family outings."
    ),
  PopularPlaces(
    id: 4,
    name: "Mae Kam Png Village",
    category: 'popular',
    image: [
      'assets/images/mae_kam_pong/1.jpg',
      'assets/images/mae_kam_pong/2.jpg',
      'assets/images/mae_kam_pong/3.jpg',
      'assets/images/mae_kam_pong/4.jpg',
      'assets/images/mae_kam_pong/5.jpg',
    ],
    location: "Mae Kampong Village",
    rate: 4.9,
    review: random.nextInt(300) + 25,
    price: 1000,
    description: "Mae Kampong is a serene mountain village nestled in Chiang Mai's Mae On District, renowned for its lush landscapes, traditional wooden homes, and community-driven eco-tourism. Visitors can enjoy homestays, explore the seven-tier Mae Kampong Waterfall, savor locally grown coffee, and experience the tranquil charm of Northern Thai culture."
    ),
  PopularPlaces(
    id: 5,
    name: "Nimmanhaemin Road",
    category: 'popular',
    image: [
      'assets/images/nimman_road/1.jpg',
      'assets/images/nimman_road/2.jpg',
      'assets/images/nimman_road/3.jpg',
      'assets/images/nimman_road/4.jpg',
    ],
    location: "Nimman",
    rate: 4.5,
    review: random.nextInt(300) + 25,
    price: 1000,
    description: "Trendy area known for its cafes, art galleries, boutique shops, and nightlife, perfect for modern lifestyle exploration.",
  ),
  PopularPlaces(
    id: 6,
    name: "Chiang Mai Night Bazaar",
    category: 'popular',
    image: [
      'assets/images/night_market/1.jpg',
      'assets/images/night_market/2.jpg',
      'assets/images/night_market/3.jpg',
      'assets/images/night_market/4.jpg',
    ],
    location: "Chang Klan Road",
    rate: 4.6,
    review: random.nextInt(300) + 25,
    price: 1000,
    description: "A vibrant night market offering local food, souvenirs, crafts, and live entertainment, showcasing Chiang Mai’s lively street culture.",
  ),
];

class RecommendPackage {
  final int id, price, review;
  final List<String>? image;
  final String name, description, category, location;
  final double rate;

  RecommendPackage({
    required this.name,
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.rate,
    required this.location,
    required this.price,
    required this.review,
  });
}

List<RecommendPackage> allPackage = [
  RecommendPackage(
    id: 1,
    name: "Chiang Mai City Tour",
    category: 'recommend',
    image: [
      'assets/images/packages/1.jpg',
      'assets/images/packages/2.jpg',
      'assets/images/packages/3.jpg',
    ],
    location: "Chiang Mai",
    rate: 4.8,
    review: random.nextInt(300) + 25,
    price: 650,
    description: "Explore historic temples, local markets, and the charming streets of Chiang Mai’s Old City on this guided tour.",
  ),
  RecommendPackage(
    id: 2,
    name: "Doi Suthep Sunrise Hike",
    category: 'recommend',
    image: [
      'assets/images/packages/4.jpg',
      'assets/images/packages/5.jpg',
      'assets/images/packages/6.jpg',
    ],
    location: "Doi Suthep",
    rate: 4.9,
    review: random.nextInt(300) + 25,
    price: 750,
    description: "Hike up Doi Suthep in the early morning and witness the stunning sunrise over Chiang Mai from the sacred temple viewpoint.",
  ),
  RecommendPackage(
    id: 3,
    name: "Elephant Sanctuary Visit",
    category: 'recommend',
    image: [
      'assets/images/packages/7.jpg',
      'assets/images/packages/8.jpg',
      'assets/images/packages/9.jpg',
    ],
    location: "Mae Taeng",
    rate: 4.9,
    review: random.nextInt(300) + 25,
    price: 1200,
    description: "Spend a day at an ethical elephant sanctuary learning about and interacting with these gentle giants in their natural habitat.",
  ),
  RecommendPackage(
    id: 4,
    name: "Doi Inthanon National Park Tour",
    category: 'recommend',
    image: [
      'assets/images/packages/10.jpg',
      'assets/images/packages/11.jpg',
      'assets/images/packages/12.jpg',
    ],
    location: "Chom Thong",
    rate: 4.7,
    review: random.nextInt(300) + 25,
    price: 950,
    description: "Visit Thailand’s highest peak, beautiful waterfalls, and twin royal pagodas in Doi Inthanon National Park.",
  ),
  RecommendPackage(
    id: 5,
    name: "Mae Kampong Eco Village Day Trip",
    category: 'recommend',
    image: [
      'assets/images/packages/13.jpg',
      'assets/images/packages/14.jpg',
      'assets/images/packages/15.jpg',
    ],
    location: "Mae Kampong",
    rate: 4.8,
    review: random.nextInt(300) + 25,
    price: 850,
    description: "Experience a peaceful day in Mae Kampong village with traditional Thai culture, local food, and scenic views.",
  ),
  RecommendPackage(
    id: 6,
    name: "Night Safari Adventure",
    category: '-',
    image: [
      'assets/images/packages/16.jpg',
      'assets/images/packages/17.jpg',
      'assets/images/packages/18.jpg',
    ],
    location: "Night Safari",
    rate: 4.6,
    review: random.nextInt(300) + 25,
    price: 700,
    description: "Join an exciting tram ride through the Chiang Mai Night Safari and observe nocturnal animals in a natural environment.",
  ),
  RecommendPackage(
    id: 7,
    name: "Chiang Mai Cooking Class",
    category: '-',
    image: [
      'assets/images/packages/19.jpg',
      'assets/images/packages/20.jpg',
      'assets/images/packages/21.jpg',
    ],
    location: "Chiang Mai",
    rate: 4.9,
    review: random.nextInt(300) + 25,
    price: 950,
    description: "Learn to cook authentic Northern Thai dishes with a local chef in a traditional cooking school setting.",
  ),
];

////  //// /// ///
/// For Review ///
////  //// /// ///


class Review {
  final String name;
  final String comment;
  final String photo;

  Review({
    required this.name,
    required this.comment,
    required this.photo,
  });
}

List<Review> userReviews = [
  Review(
    name: "John Doe",
    comment: "Amazing experience, loved the view!",
    photo: 'assets/images/reviews/user1.png',
  ),
  Review(
    name: "Jane Smith",
    comment: "Comfortable and beautiful location!",
    photo: 'assets/images/reviews/user2.png',
  ),
  Review(
    name: "Michael Johnson",
    comment: "Great service and friendly locals!",
    photo: 'assets/images/reviews/user3.png',
  ),
  Review(
    name: "Emily Brown",
    comment: "Highly recommend for a peaceful retreat.",
    photo: 'assets/images/reviews/user4.png',
  ),
  Review(
    name: "David Lee",
    comment: "One of the best experiences I've had in Thailand!",
    photo: 'assets/images/reviews/user5.png',
  ),
];


////  //// /// /// ///
/// For Onboarding ///
////  //// /// /// ///

class OnboardModel {
  String image, title, description;

  OnboardModel({
    required this.image, 
    required this.title,
    required this.description
    });
}

List<OnboardModel> onboarding = [
   OnboardModel(
    image: 'assets/images/onboarding/8.jpg',
    title: 'Let the journey begin',
    description: 'Travel is the only thing you buy that makes you richer. '
  ),
  OnboardModel(
    image: 'assets/images/onboarding/1.jpg',
    title: "Adventure is out there",
    description: 'Life begins at the end of your comfort zone.'
  ),
  OnboardModel(
    image: 'assets/images/onboarding/3.jpg',
    title: 'Roam far, live free',
    description: 'Take only memories, leave only footprints behind.'
  ),
  OnboardModel(
    image: 'assets/images/onboarding/7.jpg',
    title: 'Find joy in the journey',
    description: 'Jobs fill your pocket, but adventures fill your soul.'
  ),
  OnboardModel(
    image: 'assets/images/onboarding/12.jpg',
    title: 'Escape the ordinary',
    description: 'The world is wide, and I want to make memories in it.'
  ),

  
];


////  //// /// /// 
/// City List  ///
////  //// /// ///

const List<String> cityList = [
  'Chiang Mai',
  'Bangkok',
  'Phuket',
  'Pai',
  'Chiang Rai',
];

String defaultCity = cityList[0];


////  //// ///  ///
/// For Package ///
////  //// ///  ///


List<String> categories = [
  'Popular',
  'Nearby',
  'Hotel',
  'Mountain',
];


class Package {

  final int? id, price;
  final String? name, description, image, category, location;
  final double? rate;

  Package({
      this.name,
      this.price = 111,
      this.id,
      this.category,
      this.description,
      this.image,
      this.rate,
      this.location
  });

}


List<Package> packages = [
  Package(
    id: 1,
    name: "Clerck Well House",
    price: 320,
    category: 'Nearby',
    image:
        "https://www.dreamtinyliving.com/wp-content/uploads/2023/07/Beautiful-Small-House-Design-Idea-7mx6m-1.jpg",
    location: "Luton,London",
    rate: 4.6,
  ),
  Package(
    id: 2,
    name: "MM hotels",
    category: 'Nearby',
    image: "https://mmhotels.in/wp-content/uploads/2024/01/istockphoto-104731717-612x612-1.jpg",
    location: "Mumbai,India",
    description:
         "The MM Hotels in Palm Beach is an iconic boutique hotel known for its vibrant colors, luxurious accommodations, and a long history dating back to the 1940s. It's a popular destination for both tourists and celebrities, offering a mix of old-world charm and modern amenities.",
    rate: 4.6,
  ),
  Package(
    id: 4,
    name: "Colony Hotel",
    category: 'hotel',
    image: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/492106100.jpg?k=e5094f3f7d90049f7afda56b1e4756a152dfe658b5731b5de61cd50bc04c0e33&o=&hp=1",
    location: "Miami, United State",
    description:
        "The Colony Hotel in Palm Beach is an iconic boutique hotel known for its vibrant colors, luxurious accommodations, and a long history dating back to the 1940s. It's a popular destination for both tourists and celebrities, offering a mix of old-world charm and modern amenities.",
    rate: 4.5,
  ),
  Package(
    id: 5,
    name: "Hotel Mystic Mountain",
    category: 'hotel',
    image: "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2023/money/0moneylocal2hotel-1691592512.jpg&w=900&height=601",
    location: "Kathmandu, Nepal",
    description:
        "Hotel Mystic Mountain, nestled deep in the lush forest of a hilltop in Nagarkot, has announced a plan to upgrade to a five-star property, buoyed by continuous demand for hotel rooms by visitors.Since it opened in July 2017, the modern hexagon-shaped building blocks of the resort have become a hot topic among trend-conscious Nepalis.",
    rate: 4.5,
  ),
  Package(
    id: 6,
    name: "Nepali Ghar Hotel",
    category: 'hotel',
    image: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/160737100.jpg?k=fc3ba3c9d68b03c2dd22e256d7a4351d1a018de68648de68999116d215b67558&o=&hp=1",
    location: "Lombok, Indonesia",
    description:
        "Conveniently situated in the centre of Kathmandu, Nepali Ghar Hotel provides air-conditioned rooms with free WiFi, free private parking and room service. This 4-star hotel offers a 24-hour front desk and a concierge service. The hotel has a terrace and city views, and guests can enjoy a meal at the restaurant or a drink at the bar.",
    rate: 4.5,
  ),
  Package(
    id: 7,
    name: "Gunung Kerinci",
    image: "https://www.wildsumatra.com/wp-content/uploads/2016/10/mt-kerinci.jpg",
    category: "mountain",
    location: "Jambi, Indonesia",
    description:
        "Gunung Kerinci (juga dieja 'Kerintji', dan dikenal sebagai Gunung Gadang, Merapi) adalah gunung tertinggi di Sumatra, gunung berapi tertinggi di Indonesia, dan puncak tertinggi di Indonesia di luar Papua. Gunung Kerinci terletak tepat di perbatasan antara Provinsi Sumatera Barat dengan Provinsi Jambi, di Pegunungan Bukit Barisan, dekat pantai barat, dan terletak sekitar 130 km sebelah selatan Padang Provinsi Sumatra Barat. Gunung ini juga menjadi batas antara wilayah Etnis Minangkabau dengan Suku Kerinci yang dikelilingi hutan lebat Taman Nasional Kerinci Seblat dan merupakan habitat harimau sumatra dan badak sumatra.",
    rate: 4,
  ),
  Package(
    id: 3,
    name: "Mount Everest",
    category: 'nearby',
    image: "https://cdn.britannica.com/17/83817-050-67C814CD/Mount-Everest.jpg",
    location: "Kathmandu, Nepal",
    description:
        "Mount Everest, mountain on the crest of the Great Himalayas of southern Asia that lies on the border between Nepal and the Tibet Autonomous Region of China, at 27°59′ N 86°56′ E. Reaching an elevation of 29,032 feet (8,849 metres), Mount Everest is the highest mountain in the world.",
    rate: 5.0,
  ),
  Package(
    id: 8,
    name: "The Bagmati River",
    category: "mountain",
    image: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Pashupatinath2.jpg/1200px-Pashupatinath2.jpg",
    location: "Kathmandu Nepal ",
    description:
        "The Bagmati River[n 1] flows through the Kathmandu valley of Nepal, separating the cities of Kathmandu and Patan, before flowing through Madesh Province of southern Nepal and joining the Kamla River in the Indian state of Bihar. It is considered holy by both Hindus and Buddhists. A number of Hindu temples are located on its banks.The importance of the Bagmati also lies in the fact that Hindus are cremated on the banks of this holy river, and Kirants are buried in the hills by its side.",
    rate: 4.4,
  ),
  Package(
    id: 1,
    name: "Kuta Mandalika",
    category: 'beach',
    image: "https://gomandalika.com/wp-content/uploads/2023/10/Kuta-Mandalika-4.jpg",
    location: "Lombok, Indonesia",
    description:
        "The Mandalika Project covers 1,175 hectares of coastal land in Kuta, South Lombok, and will, when complete, be home to more than 16,000 hotel rooms, a waterpark, a 27-hole golf course, 1,500 villas, and an international-standard motor-racing circuit. The estimated cost of the venture is believed to exceed US\$3 billion.",
    rate: 4.4,
  ),
  Package(
    id: 9,
    name: "Annapurna South",
    category: "mountain",
    image: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Annapurna_South-4588.jpg",
    location: "Pokhara, Kathmandu",
    description:
        "Annapurna South (Nepali: अन्नपूर्ण दक्षिण) is a mountain in the Annapurna Himal range of the Himalayas located in Nepal, and the 101st-highest mountain in the world. It is the 5th highest peak of the Annapurna mountain range. It was first ascended in 1964,[1] and is 7,219 metres (23,684 ft) tall. The nearby mountain Hiunchuli is in fact an extension of Annapurna South.",
    rate: 4,
  ),
  Package(
    id: 10,
    name: "She Remains The Taj",
    category: "hotel",
    image: "https://i.pinimg.com/736x/7b/70/0b/7b700b2d923f3a8c7f9cdc0f32284091.jpg",
    location: "India",
    description:
        "We pride ourselves in fostering a culture that holds our women guests in the highest regard, and nurtures our women stakeholders. Reflecting this culture, 'She Remains The Taj' is a celebration of the warmth and spirit of every woman. With this initiative, we reaffirm our commitment to encourage and support women as guests, employeess, partners and beyond.",
    rate: 4.4,
  ),
  Package(
    id: 11,
    name: "Pashupatinath Temple",
    category: "nearby",
    image: "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_627150563_20190822130709_20190822154343.jpg",
    location: "Kathmandu Nepal",
    description:
        "One of the holiest Hindu shrines in Nepal, the Pashupatinath Temple is a UNESCO World Heritage Site and a Shaktipeetha. It consists of 518 small temples and a main pagoda house. The temple complex is only open to Hindus. It is believed that the Jyotirlinga housed in the Pashupatinath temple is the head of the body, which is made up of the twelve Jyotirlinga in India.",
    rate: 4.4,
  ),
  Package(
    id: 12,
    name: "Grand Hotel",
    category: "hotel",
    image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/e6/39/8c/grand-hotel-kathmandu.jpg?w=700&h=-1&s=1",
    location: "KTM Nepal",
    description:
        "Grand Hotel, Kathmandu is a 4-star hotel in Nepal strategically located in the heart of the city's dynamic business, cultural and entertainment hubs. Some of the major landmarks of the city are located within accessible distance from the hotel which include the Swoyambhunath (Monkey Temple), National Museum and the Seto Gumba (White Monastery) . Other attractions near the hotel include Casino Mahjong, United World Trade Centre and Bluebird Mall.",
    rate: 4.4,
  ),
 
  
];