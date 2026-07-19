import React from 'react';
import { motion } from 'framer-motion';
import { Smartphone, CheckCircle } from 'lucide-react';

export const AppPromotionSection = () => {
  return (
    <section className="py-20 bg-slate-900 text-white overflow-hidden relative">
      <div className="absolute top-0 right-0 w-[800px] h-[800px] bg-primary/20 rounded-full blur-3xl opacity-50 translate-x-1/3 -translate-y-1/3 pointer-events-none"></div>
      
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid lg:grid-cols-2 gap-16 items-center">
          <motion.div 
            initial={{ opacity: 0, x: -50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6 }}
          >
            <h2 className="text-4xl md:text-5xl font-extrabold mb-6 leading-tight">
              Get the FoodBite App & Order Faster
            </h2>
            <p className="text-slate-400 text-lg mb-8 max-w-lg">
              Download our mobile app to track your orders in real-time, get exclusive mobile-only discounts, and enjoy a seamless ordering experience.
            </p>

            <ul className="space-y-4 mb-10">
              {['Live order tracking on map', 'Exclusive deals and promo codes', '1-click reorder your favorites'].map((item, i) => (
                <li key={i} className="flex items-center gap-3">
                  <CheckCircle className="text-primary" size={24} />
                  <span className="text-slate-200 font-medium">{item}</span>
                </li>
              ))}
            </ul>

            <div className="flex flex-wrap gap-4">
              <button className="flex items-center gap-3 bg-white text-slate-900 px-6 py-3 rounded-xl hover:bg-slate-100 transition-colors">
                <svg viewBox="0 0 384 512" className="w-6 h-6 fill-current"><path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"/></svg>
                <div className="text-left">
                  <div className="text-[10px] leading-none mb-1">Download on the</div>
                  <div className="text-sm font-bold leading-none">App Store</div>
                </div>
              </button>
              <button className="flex items-center gap-3 bg-white text-slate-900 px-6 py-3 rounded-xl hover:bg-slate-100 transition-colors">
                <svg viewBox="0 0 512 512" className="w-6 h-6 fill-current"><path d="M325.3 234.3L104.6 13l280.8 161.2-60.1 60.1zM47 0C34 6.8 25.3 19.2 25.3 35.3v441.3c0 16.1 8.7 28.5 21.7 35.3l256-256L47 0zm425.2 225.6l-58.9-34.1-65.7 64.5 65.7 64.5 60.1-34.1c18-14.3 18-46.5-1.2-60.8zM104.6 499l280.8-161.2-60.1-60.1L104.6 499z"/></svg>
                <div className="text-left">
                  <div className="text-[10px] leading-none mb-1">GET IT ON</div>
                  <div className="text-sm font-bold leading-none">Google Play</div>
                </div>
              </button>
            </div>
          </motion.div>

          <motion.div 
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="relative hidden lg:flex justify-center"
          >
            <div className="relative z-10 w-64 h-[500px] bg-slate-800 rounded-[2.5rem] border-[8px] border-slate-700 shadow-2xl overflow-hidden flex flex-col">
              <div className="absolute top-0 inset-x-0 h-6 bg-slate-700 rounded-b-xl w-32 mx-auto z-20"></div>
              {/* Mock App Screen */}
              <div className="flex-1 bg-slate-50 relative overflow-hidden">
                <div className="h-40 bg-primary rounded-b-[2rem] p-6 text-white pt-12">
                  <h3 className="font-bold text-xl">Good Morning!</h3>
                  <p className="text-xs opacity-80">What would you like to eat?</p>
                </div>
                <div className="px-4 -mt-6">
                  <div className="bg-white rounded-xl shadow-lg p-3 flex gap-2 mb-4">
                    <Smartphone className="text-slate-400" size={20} />
                    <div className="w-full h-5 bg-slate-100 rounded"></div>
                  </div>
                  <div className="flex gap-2 mb-4">
                    <div className="w-16 h-16 bg-orange-100 rounded-xl"></div>
                    <div className="w-16 h-16 bg-red-100 rounded-xl"></div>
                    <div className="w-16 h-16 bg-green-100 rounded-xl"></div>
                    <div className="w-16 h-16 bg-blue-100 rounded-xl"></div>
                  </div>
                  <div className="space-y-3">
                    <div className="w-full h-24 bg-white rounded-xl shadow-sm border border-slate-100"></div>
                    <div className="w-full h-24 bg-white rounded-xl shadow-sm border border-slate-100"></div>
                  </div>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      </div>
    </section>
  );
};
