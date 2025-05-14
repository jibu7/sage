#!/bin/bash

# Create ESM wrapper files for all locales
for locale_dir in $(find src/locales -type d -mindepth 1 -maxdepth 1); do
  locale=$(basename "$locale_dir")
  
  # Create messages.js ESM wrapper file
  cat > "$locale_dir/messages.js" << EOF
/*eslint-disable*/
import { messages as messageData } from './messages.ts';
export default messageData;
EOF
  
  echo "Created ESM wrapper for $locale"
done

echo "Done creating ESM wrappers for all locales."
