#!/bin/bash

# Create simple ESM wrapper files for all locales
for locale_dir in $(find src/locales -type d -mindepth 1 -maxdepth 1); do
  locale=$(basename "$locale_dir")
  
  # Create messages.js ESM wrapper file with empty object
  cat > "$locale_dir/messages.js" << EOF
/*eslint-disable*/
// ESM module for Vite compatibility
export default {}; // Empty object as placeholder for translations
EOF
  
  echo "Created ESM module for $locale"
done

echo "Done creating ESM modules for all locales."
