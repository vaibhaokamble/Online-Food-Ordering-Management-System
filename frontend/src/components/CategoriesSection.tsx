import React from 'react';
import { motion } from 'framer-motion';

const categories = [
  { name: 'Burger', image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&q=80' },
  { name: 'Pizza', image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&q=80' },
  { name: 'Sushi', image: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400&q=80' },
  { name: 'Healthy', image: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&q=80' },
  { name: 'Desserts', image: 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400&q=80' },
  { name: 'Coffee', image: 'https://images.unsplash.com/photo-1497935586351-b67a49e012bf?w=400&q=80' },
];

export const CategoriesSection = () => {
  return (
    <section className="py-24 bg-white dark:bg-[#0a0a0a]" id="menu">
      <div className="max-w-[1400px] mx-auto px-6 lg:px-12">
        <div className="flex justify-between items-end mb-12">
          <h2 className="text-3xl md:text-4xl font-extrabold text-slate-900 dark:text-white tracking-tight">
            Explore Categories
          </h2>
        </div>

        {/* Premium Pill Layout */}
        <div className="flex flex-wrap gap-4 md:gap-6">
          {categories.map((category, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, scale: 0.9 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ delay: index * 0.05, duration: 0.4 }}
              whileHover={{ scale: 1.05 }}
              className="group relative flex items-center gap-4 bg-slate-50 dark:bg-[#111] pr-8 pl-2 py-2 rounded-full cursor-pointer border border-black/5 dark:border-white/5 hover:border-black/10 dark:hover:border-white/10 transition-colors shadow-sm hover:shadow-md"
            >
              <div className="w-12 h-12 md:w-16 md:h-16 rounded-full overflow-hidden shrink-0 shadow-inner">
                <img src={category.image} alt={category.name} className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" />
              </div>
              <span className="font-bold text-slate-900 dark:text-white md:text-lg tracking-tight">
                {category.name}
              </span>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};
