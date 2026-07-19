import React from 'react';
import { motion } from 'framer-motion';
import { Star, Clock, MapPin, Heart } from 'lucide-react';

const restaurants = [
  {
    id: 1,
    name: 'Burger King',
    image: 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=800&q=80',
    tags: ['Burger', 'American', 'Fast Food'],
    rating: 4.5,
    reviews: 1204,
    deliveryTime: '15-25 min',
    deliveryFee: 'Free',
    featured: true
  },
  {
    id: 2,
    name: 'Pizza Hut',
    image: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?w=800&q=80',
    tags: ['Pizza', 'Italian'],
    rating: 4.2,
    reviews: 854,
    deliveryTime: '20-30 min',
    deliveryFee: '$1.99',
    featured: false
  },
  {
    id: 3,
    name: 'Sushi Master',
    image: 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=800&q=80',
    tags: ['Sushi', 'Japanese', 'Healthy'],
    rating: 4.8,
    reviews: 2100,
    deliveryTime: '25-40 min',
    deliveryFee: '$2.99',
    featured: true
  }
];

export const RestaurantsSection = () => {
  return (
    <section className="py-20 bg-slate-50 dark:bg-slate-900" id="restaurants">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col md:flex-row justify-between items-center mb-12 gap-4 text-center md:text-left">
          <div>
            <h2 className="text-3xl md:text-4xl font-bold text-slate-900 dark:text-white mb-4">Featured Restaurants</h2>
            <p className="text-slate-600 dark:text-slate-400">Hand-picked places based on ratings and quality.</p>
          </div>
          <div className="flex gap-2">
            <button className="p-3 rounded-full border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-400 hover:text-primary hover:border-primary transition-colors">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="m15 18-6-6 6-6"/></svg>
            </button>
            <button className="p-3 rounded-full bg-primary text-white hover:bg-primary-dark transition-colors shadow-lg shadow-primary/30">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="m9 18 6-6-6-6"/></svg>
            </button>
          </div>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {restaurants.map((restaurant, index) => (
            <motion.div
              key={restaurant.id}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: index * 0.1, duration: 0.5 }}
              className="bg-white dark:bg-slate-800 rounded-3xl overflow-hidden shadow-sm border border-slate-100 dark:border-slate-800 group hover:shadow-xl transition-all duration-300"
            >
              <div className="relative h-56 overflow-hidden">
                <img 
                  src={restaurant.image} 
                  alt={restaurant.name} 
                  className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110"
                />
                <div className="absolute top-4 left-4 flex gap-2">
                  {restaurant.featured && (
                    <span className="px-3 py-1 bg-primary text-white text-xs font-bold rounded-full shadow-md">
                      Featured
                    </span>
                  )}
                  <span className="px-3 py-1 bg-white/90 dark:bg-slate-900/90 backdrop-blur-sm text-slate-900 dark:text-white text-xs font-bold rounded-full shadow-md flex items-center gap-1">
                    <Clock size={12} className="text-primary" /> {restaurant.deliveryTime}
                  </span>
                </div>
                <button className="absolute top-4 right-4 p-2 bg-white/90 dark:bg-slate-900/90 backdrop-blur-sm rounded-full text-slate-400 hover:text-red-500 transition-colors shadow-md">
                  <Heart size={20} />
                </button>
              </div>
              <div className="p-6">
                <div className="flex justify-between items-start mb-2">
                  <h3 className="text-xl font-bold text-slate-900 dark:text-white">{restaurant.name}</h3>
                  <div className="flex items-center gap-1 bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400 px-2 py-1 rounded-lg text-sm font-bold">
                    <Star size={14} className="fill-current" />
                    {restaurant.rating}
                  </div>
                </div>
                <div className="flex items-center gap-2 text-slate-500 dark:text-slate-400 text-sm mb-4">
                  <span>{restaurant.tags.join(' • ')}</span>
                </div>
                <div className="flex items-center justify-between pt-4 border-t border-slate-100 dark:border-slate-700">
                  <div className="flex items-center gap-2 text-sm">
                    <div className="w-8 h-8 rounded-full bg-slate-100 dark:bg-slate-700 flex items-center justify-center text-slate-500 dark:text-slate-400">
                      <MapPin size={16} />
                    </div>
                    <span className="font-medium text-slate-700 dark:text-slate-300">Delivery: {restaurant.deliveryFee}</span>
                  </div>
                  <button className="text-primary font-semibold text-sm hover:text-primary-dark">
                    View Menu
                  </button>
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};
