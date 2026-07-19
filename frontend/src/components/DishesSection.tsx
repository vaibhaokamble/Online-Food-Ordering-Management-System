import React from 'react';
import { motion } from 'framer-motion';
import { Plus, Star } from 'lucide-react';

const dishes = [
  {
    id: 1,
    name: 'Spicy Chicken Burger',
    restaurant: 'Burger King',
    image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&q=80',
    price: 8.99,
    originalPrice: 10.99,
    rating: 4.8,
    calories: '450 kcal'
  },
  {
    id: 2,
    name: 'Pepperoni Pizza',
    restaurant: 'Pizza Hut',
    image: 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=600&q=80',
    price: 14.99,
    originalPrice: 18.99,
    rating: 4.9,
    calories: '850 kcal'
  },
  {
    id: 3,
    name: 'Salmon Sushi Roll',
    restaurant: 'Sushi Master',
    image: 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=600&q=80',
    price: 12.50,
    originalPrice: 15.00,
    rating: 4.7,
    calories: '320 kcal'
  },
  {
    id: 4,
    name: 'Fresh Caesar Salad',
    restaurant: 'Green Bowl',
    image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&q=80',
    price: 9.99,
    originalPrice: null,
    rating: 4.6,
    calories: '210 kcal'
  }
];

export const DishesSection = () => {
  return (
    <section className="py-20 bg-white dark:bg-slate-950">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-2xl mx-auto mb-16">
          <h2 className="text-3xl md:text-4xl font-bold text-slate-900 dark:text-white mb-4">Best Selling Dishes</h2>
          <p className="text-slate-600 dark:text-slate-400">Discover the most loved dishes by our customers this week.</p>
        </div>

        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {dishes.map((dish, index) => (
            <motion.div
              key={dish.id}
              initial={{ opacity: 0, scale: 0.95 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ delay: index * 0.1 }}
              className="bg-white dark:bg-slate-900 rounded-3xl p-4 shadow-sm border border-slate-100 dark:border-slate-800 hover:shadow-xl transition-all group"
            >
              <div className="relative h-48 rounded-2xl overflow-hidden mb-4">
                <img 
                  src={dish.image} 
                  alt={dish.name} 
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                />
                <div className="absolute top-3 left-3 bg-white/90 dark:bg-slate-900/90 backdrop-blur-sm px-2 py-1 rounded-lg text-xs font-bold text-slate-900 dark:text-white flex items-center gap-1 shadow-sm">
                  <Star size={12} className="text-accent fill-accent" /> {dish.rating}
                </div>
              </div>
              
              <div className="px-2">
                <p className="text-sm text-slate-500 dark:text-slate-400 mb-1">{dish.restaurant}</p>
                <h3 className="font-bold text-slate-900 dark:text-white text-lg leading-tight mb-2 truncate">{dish.name}</h3>
                
                <div className="flex items-end justify-between mt-4">
                  <div>
                    {dish.originalPrice && (
                      <span className="text-sm text-slate-400 line-through mr-2">${dish.originalPrice}</span>
                    )}
                    <span className="text-xl font-extrabold text-primary">${dish.price}</span>
                  </div>
                  <button className="w-10 h-10 rounded-full bg-slate-900 text-white dark:bg-white dark:text-slate-900 flex items-center justify-center hover:bg-primary dark:hover:bg-primary hover:text-white transition-colors shadow-md">
                    <Plus size={20} />
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
