class Pizza {
  final String image, title, description;
  final double price, size, id, rating;

  Pizza({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.rating,
  });
}

List<Pizza> pizzas = [
  Pizza(
    id: 0,
    image: 'assets/images/pizza.png',
    title: 'Tomato Pizza',
    description: 'Pizza with tomatoes',
    price: 9.99,
    size: 5,
    rating: 4.5,
  ),
  Pizza(
    id: 1,
    image: 'assets/images/pizza_vegies.png',
    title: 'Vegan Pizza',
    description: 'Pizza with veggies',
    price: 9.99,
    size: 12,
    rating: 4.5,
  ),
  Pizza(
    id: 2,
    image: 'assets/images/pizza_pepperoni.png',
    title: 'Pepperoni Pizza',
    description: 'Pizza with pepperoni',
    price: 9.99,
    size: 12,
    rating: 4.5,
  ),
  Pizza(
    id: 3,
    image: 'assets/images/african_peri_peri.png',
    title: 'African PeriPeri',
    description: 'Pizza with spice',
    price: 9.99,
    size: 12,
    rating: 4.5,
  ),
  Pizza(
    id: 4,
    image: 'assets/images/aussie_barbeque_veg.png',
    title: 'Aussie Barbecue',
    description: 'Pizza with barbecue',
    price: 9.99,
    size: 12,
    rating: 4.5,
  ),
  Pizza(
    id: 4,
    image: 'assets/images/jamaican_jerk_veg.png',
    title: 'Jamaican Jerk',
    description: 'Jamaican jerk season',
    price: 9.99,
    size: 12,
    rating: 4.5,
  ),
];
