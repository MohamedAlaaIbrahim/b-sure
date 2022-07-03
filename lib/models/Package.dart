


class Package {
  final int id;
  final String title, description, type;
  final List<String> images;
  final double rating;
  final bool isFav;

  Package({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.images,
    required this.rating,
    this.isFav = false,
  });
}

List<List<Package>> demoPackages = [
  [
    Package(
      id: 1,
      title: "Package 1",
      type: "Mobile",
      description: "M Package 1",
      images: ["assets/images/package.png"],
      rating: 4.9,
      isFav: true,
    ),
    Package(
      id: 2,
      title: "Package 2",
      type: "Mobile",
      description: " M Package 2",
      images: ["assets/images/package.png"],
      rating: 4.5,
    ),
    Package(
      id: 3,
      title: "Package 3",
      type: "Mobile",
      description: " M Package 3",
      images: ["assets/images/package.png"],
      rating: 4.6,
    ),
    Package(
      id: 4,
      title: "Package 4",
      type: "Mobile",
      description: " M Package 4",
      images: ["assets/images/package.png"],
      rating: 4.5,
    ),
    Package(
      id: 5,
      title: "Package 5",
      type: "Mobile",
      description: " M Package 5",
      images: ["assets/images/package.png"],
      rating: 4.4,
    ),
    Package(
      id: 6,
      title: "Package 6",
      type: "Mobile",
      description: " M Package 6",
      images: ["assets/images/package.png"],
      rating: 4.98,
    ),
  ],
  [
    Package(
      id: 1,
      title: "Package 1",
      type: "Laptop",
      description: "L Package 1",
      images: ["assets/images/package.png"],
      rating: 4.9,
    ),
    Package(
      id: 2,
      title: "Package 2",
      type: "Laptop",
      description: " L Package 2",
      images: ["assets/images/package.png"],
      rating: 4.5,
    ),
    Package(
      id: 3,
      title: "Package 3",
      type: "Laptop",
      description: " L Package 3",
      images: ["assets/images/package.png"],
      rating: 4.6,
    ),
    Package(
      id: 4,
      title: "Package 4",
      type: "Laptop",
      description: " L Package 4",
      images: ["assets/images/package.png"],
      rating: 4.5,
    ),
    Package(
      id: 5,
      title: "Package 5",
      type: "Laptop",
      description: " L Package 5",
      images: ["assets/images/package.png"],
      rating: 4.4,
    ),
    Package(
      id: 6,
      title: "Package 6",
      type: "Laptop",
      description: " L Package 6",
      images: ["assets/images/package.png"],
      rating: 4.98,
    ),
  ]
];
