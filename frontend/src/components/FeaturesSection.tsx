import React from 'react';
import { motion } from 'framer-motion';
import { ArrowRight, Utensils, Zap, Shield, HeartHandshake, Map } from 'lucide-react';

export const FeaturesSection = () => {
  return (
    <section className="py-24 bg-white dark:bg-[#0a0a0a]">
      <div className="max-w-[1400px] mx-auto px-6 lg:px-12">
        <div className="flex flex-col md:flex-row justify-between items-end mb-16 gap-6">
          <div className="max-w-2xl">
            <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 dark:text-white mb-6 tracking-tight">
              More than just delivery. <br />
              <span className="text-slate-400">An entire culinary ecosystem.</span>
            </h2>
            <p className="text-lg text-slate-600 dark:text-slate-400 font-medium">
              We've engineered the perfect platform connecting food lovers with elite kitchens, backed by logistics that feel like magic.
            </p>
          </div>
          <button className="hidden md:flex items-center gap-2 text-slate-900 dark:text-white font-bold hover:gap-4 transition-all">
            Read our engineering blog <ArrowRight size={20} />
          </button>
        </div>

        {/* Premium Bento Grid Layout */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 auto-rows-[300px]">
          
          {/* Large Feature 1 */}
          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="md:col-span-2 relative rounded-[2rem] overflow-hidden group bg-slate-100 dark:bg-[#111] border border-black/5 dark:border-white/5"
          >
            <div className="absolute inset-0 bg-gradient-to-br from-orange-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
            <div className="p-10 h-full flex flex-col justify-between relative z-10">
              <div className="w-14 h-14 rounded-2xl bg-white dark:bg-[#222] shadow-sm flex items-center justify-center mb-4">
                <Zap className="text-orange-500" size={28} />
              </div>
              <div>
                <h3 className="text-2xl font-bold text-slate-900 dark:text-white mb-3">Hyper-Fast Logistics</h3>
                <p className="text-slate-600 dark:text-slate-400 font-medium max-w-md">Our routing algorithm predicts cooking times and traffic to ensure your food arrives exactly when it's ready, preserving heat and texture.</p>
              </div>
            </div>
            {/* Abstract visual */}
            <div className="absolute right-0 bottom-0 w-2/3 h-2/3 bg-[url('https://images.unsplash.com/photo-1526367790999-0150786686a2?w=800&q=80')] bg-cover bg-center opacity-20 dark:opacity-40 group-hover:scale-105 transition-transform duration-700 mix-blend-luminosity rounded-tl-[4rem]" />
          </motion.div>

          {/* Small Feature 1 */}
          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.1 }}
            className="relative rounded-[2rem] overflow-hidden group bg-slate-100 dark:bg-[#111] border border-black/5 dark:border-white/5 p-10 flex flex-col justify-between"
          >
            <div className="w-14 h-14 rounded-2xl bg-white dark:bg-[#222] shadow-sm flex items-center justify-center mb-4">
              <Shield className="text-green-500" size={28} />
            </div>
            <div>
              <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-3">Bank-Grade Security</h3>
              <p className="text-slate-600 dark:text-slate-400 font-medium">PCI-DSS compliant payment processing with end-to-end encryption.</p>
            </div>
          </motion.div>

          {/* Small Feature 2 */}
          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="relative rounded-[2rem] overflow-hidden group bg-slate-900 dark:bg-white border border-black/5 dark:border-white/5 p-10 flex flex-col justify-between text-white dark:text-slate-900"
          >
            <div className="w-14 h-14 rounded-2xl bg-slate-800 dark:bg-slate-100 flex items-center justify-center mb-4">
              <Utensils size={28} />
            </div>
            <div>
              <h3 className="text-xl font-bold mb-3">Curated Excellence</h3>
              <p className="text-slate-400 dark:text-slate-600 font-medium">Only the top 10% of local restaurants pass our strict quality audits.</p>
            </div>
          </motion.div>

          {/* Large Feature 2 */}
          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.3 }}
            className="md:col-span-2 relative rounded-[2rem] overflow-hidden group bg-slate-100 dark:bg-[#111] border border-black/5 dark:border-white/5"
          >
            <div className="p-10 h-full flex flex-col justify-between relative z-10 w-full md:w-1/2">
              <div className="w-14 h-14 rounded-2xl bg-white dark:bg-[#222] shadow-sm flex items-center justify-center mb-4">
                <Map className="text-blue-500" size={28} />
              </div>
              <div>
                <h3 className="text-2xl font-bold text-slate-900 dark:text-white mb-3">Live Precision Tracking</h3>
                <p className="text-slate-600 dark:text-slate-400 font-medium">Watch your order move in real-time down to the exact street corner with our ultra-low latency mapping engine.</p>
              </div>
            </div>
            {/* Visual element */}
            <div className="absolute right-0 top-0 w-1/2 h-full hidden md:block">
               <div className="absolute inset-0 bg-gradient-to-r from-slate-100 dark:from-[#111] to-transparent z-10" />
               <img src="https://images.unsplash.com/photo-1524661135-423995f22d0b?w=800&q=80" alt="Map" className="w-full h-full object-cover grayscale opacity-50 group-hover:grayscale-0 group-hover:opacity-100 transition-all duration-700" />
            </div>
          </motion.div>

        </div>
      </div>
    </section>
  );
};
