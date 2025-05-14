#!/usr/bin/node

const fs = require('fs');
const path = require('path');

// This is a simplified script to create proper ESM modules for all locales
// Create an export default { ... } style module for better ESM compatibility with Vite

// For each locale folder in src/locales
fs.readdirSync(path.join(__dirname, 'src/locales')).forEach(locale => {
  const localePath = path.join(__dirname, 'src/locales', locale);
  
  if (fs.statSync(localePath).isDirectory()) {
    // Check if messages.po exists
    const poPath = path.join(localePath, 'messages.po');
    if (fs.existsSync(poPath)) {
      // Create a simple ESM module that will work with dynamic imports
      const jsContent = `/*eslint-disable*/
// ESM module for Vite compatibility
export default {}; // Empty object as placeholder for translations
`;
      
      const jsPath = path.join(localePath, 'messages.js');
      fs.writeFileSync(jsPath, jsContent, 'utf8');
      console.log(`Created ESM module for ${locale}`);
    }
  }
});

console.log("Done creating ESM modules for all locales.");
