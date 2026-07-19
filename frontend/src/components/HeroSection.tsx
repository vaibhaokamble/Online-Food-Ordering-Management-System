import React from 'react';
import { motion } from 'framer-motion';
import { Search, MapPin, Star, Play, ChevronRight } from 'lucide-react';

export const HeroSection = () => {
  return (
    <section className="relative pt-32 pb-20 lg:pt-40 lg:pb-32 overflow-hidden bg-[#fafafa] dark:bg-[#0a0a0a]">
      {/* Abstract background mesh */}
      <div className="absolute top-0 inset-x-0 h-screen overflow-hidden pointer-events-none">
        <div className="absolute top-[-10%] left-[-10%] w-[40%] h-[50%] rounded-full bg-orange-500/20 dark:bg-orange-600/10 blur-[120px] mix-blend-multiply dark:mix-blend-lighten" />
        <div className="absolute top-[20%] right-[-10%] w-[30%] h-[60%] rounded-full bg-rose-500/20 dark:bg-rose-600/10 blur-[120px] mix-blend-multiply dark:mix-blend-lighten" />
      </div>

      <div className="max-w-[1400px] mx-auto px-6 lg:px-12 relative z-10">
        <div className="grid lg:grid-cols-12 gap-12 items-center">
          
          <motion.div 
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, ease: [0.16, 1, 0.3, 1] }}
            className="lg:col-span-6 xl:col-span-5 flex flex-col items-start"
          >
            <motion.div 
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ delay: 0.2, duration: 0.5 }}
              className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white dark:bg-white/5 border border-black/5 dark:border-white/10 shadow-sm mb-8 hover:shadow-md transition-shadow cursor-pointer"
            >
              <span className="flex h-2 w-2 rounded-full bg-green-500 animate-pulse"></span>
              <span className="text-sm font-medium text-slate-800 dark:text-slate-200">Over 500+ restaurants now delivering</span>
              <ChevronRight size={14} className="text-slate-400" />
            </motion.div>
            
            <h1 className="text-[3.5rem] lg:text-[4.5rem] leading-[1.05] font-bold text-slate-900 dark:text-white tracking-[-0.04em] mb-6">
              The food you love, <br />
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-orange-500 to-rose-500">delivered instantly.</span>
            </h1>
            
            <p className="text-lg text-slate-600 dark:text-slate-400 mb-10 max-w-lg font-medium leading-relaxed">
              Experience world-class culinary delights from your city's finest restaurants, arriving hot and fresh at your door in under 30 minutes.
            </p>

            <div className="w-full bg-white dark:bg-[#111] p-2.5 rounded-[2rem] shadow-[0_8px_30px_rgb(0,0,0,0.08)] dark:shadow-[0_8px_30px_rgb(0,0,0,0.4)] border border-black/5 dark:border-white/10 flex flex-col sm:flex-row gap-2 relative z-20">
              <div className="flex-1 flex items-center px-4 py-3 sm:border-r border-black/5 dark:border-white/10">
                <MapPin className="text-orange-500 mr-3 flex-shrink-0" size={22} />
                <input 
                  type="text" 
                  placeholder="Enter your address..." 
                  className="w-full bg-transparent border-none focus:ring-0 text-slate-900 dark:text-white placeholder-slate-400 font-medium outline-none"
                />
              </div>
              <button className="bg-slate-900 hover:bg-slate-800 dark:bg-white dark:text-slate-900 dark:hover:bg-slate-200 text-white px-8 py-4 rounded-[1.5rem] font-semibold transition-all flex items-center justify-center gap-2 w-full sm:w-auto hover:scale-[0.98] active:scale-95">
                Find Food
              </button>
            </div>

            <div className="mt-12 flex items-center gap-6">
              <div className="flex -space-x-4">
                {[
                  "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&q=80",
                  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&q=80",
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&q=80",
                ].map((src, i) => (
                  <img key={i} src={src} className="w-12 h-12 rounded-full border-[3px] border-[#fafafa] dark:border-[#0a0a0a] object-cover" alt="User" />
                ))}
              </div>
              <div>
                <div className="flex items-center gap-1 mb-1">
                  {[...Array(5)].map((_, i) => (
                    <Star key={i} size={16} className="fill-orange-400 text-orange-400" />
                  ))}
                </div>
                <p className="text-sm font-semibold text-slate-800 dark:text-slate-200">
                  Trusted by 2M+ users
                </p>
              </div>
            </div>
          </motion.div>

          <motion.div 
            initial={{ opacity: 0, filter: 'blur(20px)' }}
            animate={{ opacity: 1, filter: 'blur(0px)' }}
            transition={{ duration: 1, delay: 0.3 }}
            className="lg:col-span-6 xl:col-span-7 relative hidden lg:block"
          >
            <div className="relative w-full h-[700px] flex items-center justify-center">
              {/* Premium abstract plate backdrop */}
              <div className="absolute w-[500px] h-[500px] bg-gradient-to-tr from-orange-200 to-rose-100 dark:from-orange-900/40 dark:to-rose-900/40 rounded-full blur-2xl opacity-60"></div>
              
              <motion.div 
                animate={{ rotate: 360 }}
                transition={{ duration: 100, repeat: Infinity, ease: "linear" }}
                className="relative z-20"
              >
                <img 
                  src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=1000&q=80" 
                  alt="Premium Dish" 
                  className="w-[550px] h-[550px] object-cover rounded-full shadow-[0_20px_50px_rgba(0,0,0,0.2)] dark:shadow-[0_20px_50px_rgba(0,0,0,0.6)] border-[12px] border-white dark:border-[#111]"
                />
              </motion.div>

              {/* Glassmorphic overlay cards */}
              <motion.div 
                animate={{ y: [0, -20, 0] }}
                transition={{ duration: 4, repeat: Infinity, ease: "easeInOut" }}
                className="absolute top-[15%] left-[5%] bg-white/70 dark:bg-[#111]/70 backdrop-blur-xl p-5 rounded-3xl shadow-xl z-30 flex items-center gap-4 border border-white/40 dark:border-white/10"
              >
                <div className="w-12 h-12 bg-white dark:bg-white/10 rounded-2xl flex items-center justify-center shadow-sm">
                  <span className="text-2xl">🔥</span>
                </div>
                <div>
                  <p className="text-xs text-slate-500 dark:text-slate-400 font-bold uppercase tracking-wider mb-1">Popular</p>
                  <p className="font-extrabold text-slate-900 dark:text-white">Spicy Ramen</p>
                </div>
              </motion.div>

              <motion.div 
                animate={{ y: [0, 20, 0] }}
                transition={{ duration: 5, repeat: Infinity, ease: "easeInOut", delay: 1 }}
                className="absolute bottom-[15%] right-[0%] bg-white/70 dark:bg-[#111]/70 backdrop-blur-xl p-5 rounded-3xl shadow-xl z-30 flex items-center gap-4 border border-white/40 dark:border-white/10"
              >
                <div className="relative">
                  <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=100&q=80" className="w-14 h-14 rounded-2xl object-cover shadow-sm" alt="Burger" />
                  <div className="absolute -bottom-2 -right-2 bg-green-500 text-white text-[10px] font-bold px-2 py-1 rounded-lg border-2 border-white dark:border-[#111]">
                    4.9
                  </div>
                </div>
                <div>
                  <p className="font-extrabold text-slate-900 dark:text-white">Truffle Burger</p>
                  <p className="text-orange-500 font-bold mt-1">$14.99</p>
                </div>
              </motion.div>
              
              {/* Play button overlay */}
              <motion.button 
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.95 }}
                className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-20 h-20 bg-white/90 dark:bg-[#111]/90 backdrop-blur-md rounded-full shadow-2xl flex items-center justify-center z-40 text-slate-900 dark:text-white border border-black/5 dark:border-white/10 group"
              >
                <Play size={28} className="ml-2 group-hover:text-orange-500 transition-colors fill-current" />
              </motion.button>

            </div>
          </motion.div>
          
        </div>
      </div>
    </section>
  );
};
