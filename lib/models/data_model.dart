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
