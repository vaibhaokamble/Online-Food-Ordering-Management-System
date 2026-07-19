import React from 'react';
import { Navbar } from './components/Navbar';
import { HeroSection } from './components/HeroSection';
import { CategoriesSection } from './components/CategoriesSection';
import { RestaurantsSection } from './components/RestaurantsSection';
import { DishesSection } from './components/DishesSection';
import { FeaturesSection } from './components/FeaturesSection';
import { TestimonialsSection } from './components/TestimonialsSection';
import { AppPromotionSection } from './components/AppPromotionSection';
import { StatsSection } from './components/StatsSection';
import { FaqSection } from './components/FaqSection';
import { Footer } from './components/Footer';

function App() {
  return (
    <div className="min-h-screen bg-white dark:bg-slate-950 font-sans antialiased text-slate-900 dark:text-slate-50">
      <Navbar />
      <main>
        <HeroSection />
        <StatsSection />
        <CategoriesSection />
        <RestaurantsSection />
        <DishesSection />
        <FeaturesSection />
        <TestimonialsSection />
        <AppPromotionSection />
        <FaqSection />
      </main>
      <Footer />
    </div>
  );
}

export default App;
