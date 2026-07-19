import React from 'react';
import { motion } from 'framer-motion';

const stats = [
  { label: 'Orders Delivered', value: '5M+', color: 'text-primary' },
  { label: 'Happy Customers', value: '1.2M', color: 'text-blue-500' },
  { label: 'Restaurants', value: '10K+', color: 'text-green-500' },
  { label: 'Cities Covered', value: '150+', color: 'text-purple-500' }
];

export const StatsSection = () => {
  return (
    <section className="py-16 bg-white dark:bg-slate-950 border-b border-slate-100 dark:border-slate-800">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8 divide-x divide-slate-100 dark:divide-slate-800">
          {stats.map((stat, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, scale: 0.8 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ delay: index * 0.1 }}
              className="text-center px-4"
            >
              <h3 className={`text-4xl md:text-5xl font-extrabold ${stat.color} mb-2 tracking-tight`}>
                {stat.value}
              </h3>
              <p className="text-slate-500 dark:text-slate-400 font-medium uppercase tracking-wider text-sm">{stat.label}</p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};
