import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { ChevronDown } from 'lucide-react';

const faqs = [
  {
    question: "How long does delivery take?",
    answer: "Our average delivery time is between 25-35 minutes depending on your location and the restaurant's preparation time. You can track your order in real-time."
  },
  {
    question: "How do I pay for my order?",
    answer: "We accept all major credit/debit cards, Apple Pay, Google Pay, and PayPal. All transactions are highly secured and encrypted."
  },
  {
    question: "Can I cancel my order?",
    answer: "Yes, you can cancel your order within 5 minutes of placing it without any cancellation fee. After the restaurant starts preparing your food, cancellation may not be possible."
  },
  {
    question: "Are there any hidden charges?",
    answer: "No, we believe in complete transparency. The total amount shown at checkout includes the food price, taxes, and delivery fee. There are no hidden charges."
  }
];

export const FaqSection = () => {
  const [activeIndex, setActiveIndex] = useState<number | null>(0);

  return (
    <section className="py-20 bg-slate-50 dark:bg-slate-900">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-slate-900 dark:text-white mb-4">Frequently Asked Questions</h2>
          <p className="text-slate-600 dark:text-slate-400">Got questions? We've got answers.</p>
        </div>

        <div className="space-y-4">
          {faqs.map((faq, index) => (
            <motion.div 
              key={index}
              initial={{ opacity: 0, y: 10 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: index * 0.1 }}
              className="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800 overflow-hidden"
            >
              <button
                onClick={() => setActiveIndex(activeIndex === index ? null : index)}
                className="w-full px-6 py-5 flex justify-between items-center text-left focus:outline-none"
              >
                <span className="font-semibold text-slate-900 dark:text-white">{faq.question}</span>
                <ChevronDown 
                  className={`text-slate-400 transition-transform duration-300 ${activeIndex === index ? 'rotate-180 text-primary' : ''}`} 
                  size={20} 
                />
              </button>
              
              <AnimatePresence>
                {activeIndex === index && (
                  <motion.div
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: "auto", opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    transition={{ duration: 0.3 }}
                  >
                    <div className="px-6 pb-5 text-slate-600 dark:text-slate-400 leading-relaxed border-t border-slate-50 dark:border-slate-700/50 pt-3">
                      {faq.answer}
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};
