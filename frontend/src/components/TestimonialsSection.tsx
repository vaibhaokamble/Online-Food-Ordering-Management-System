import React from 'react';
import { motion } from 'framer-motion';

const testimonials = [
  {
    name: 'Sarah Johnson',
    handle: '@sarahj_eats',
    image: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&q=80',
    content: 'The most stunning UI I have ever used for a food app. It feels like navigating a high-end fashion magazine, but for my dinner.',
  },
  {
    name: 'Michael Chen',
    handle: '@mchen_tech',
    image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&q=80',
    content: 'Insanely fast delivery and the live tracking is pixel-perfect. FoodBite has completely replaced every other app on my phone.',
  },
  {
    name: 'Emily Davis',
    handle: '@emilydesigns',
    image: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&q=80',
    content: 'As a designer, I am obsessed with this app. The typography, the animations, the dark mode—pure perfection.',
  },
  {
    name: 'James Wilson',
    handle: '@jwilson_99',
    image: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&q=80',
    content: 'The curated restaurant list means I never have a bad meal. Worth every penny of the premium subscription.',
  },
  {
    name: 'Jessica Lee',
    handle: '@jess_foodie',
    image: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&q=80',
    content: 'Customer support is actually helpful? I had an issue and it was resolved by a human in 30 seconds. Unreal.',
  }
];

export const TestimonialsSection = () => {
  return (
    <section className="py-32 bg-[#fafafa] dark:bg-[#0a0a0a] overflow-hidden">
      <div className="max-w-[1400px] mx-auto px-6 lg:px-12 mb-16">
        <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 dark:text-white tracking-tight">
          Don't just take <br className="hidden md:block"/> our word for it.
        </h2>
      </div>

      <div className="relative flex overflow-x-hidden w-full group">
        <div className="absolute inset-y-0 left-0 w-32 bg-gradient-to-r from-[#fafafa] dark:from-[#0a0a0a] to-transparent z-10 pointer-events-none" />
        <div className="absolute inset-y-0 right-0 w-32 bg-gradient-to-l from-[#fafafa] dark:from-[#0a0a0a] to-transparent z-10 pointer-events-none" />
        
        {/* Infinite Marquee Container */}
        <motion.div 
          animate={{ x: ["0%", "-50%"] }}
          transition={{ duration: 40, ease: "linear", repeat: Infinity }}
          className="flex w-[200%] gap-6 px-3"
        >
          {/* Double the items to create seamless loop */}
          {[...testimonials, ...testimonials].map((testimonial, index) => (
            <div 
              key={index} 
              className="w-[350px] md:w-[400px] flex-shrink-0 bg-white dark:bg-[#111] border border-black/5 dark:border-white/5 rounded-3xl p-8 hover:bg-slate-50 dark:hover:bg-[#151515] transition-colors"
            >
              <div className="flex items-center gap-4 mb-6">
                <img src={testimonial.image} alt={testimonial.name} className="w-12 h-12 rounded-full object-cover grayscale opacity-80" />
                <div>
                  <h4 className="font-bold text-slate-900 dark:text-white">{testimonial.name}</h4>
                  <p className="text-sm text-slate-500 dark:text-slate-400">{testimonial.handle}</p>
                </div>
              </div>
              <p className="text-slate-600 dark:text-slate-300 font-medium leading-relaxed">
                "{testimonial.content}"
              </p>
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  );
};
