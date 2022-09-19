#!/bin/bash
echo "1️⃣ 1. Updating notes..."
cd ../notes
git add .
git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
git push
echo "⏰ 2. Wait 3 seconds..."
sleep 3
echo "2️⃣ 3. Updating submodules & current changes..."
cd ../aprendiendoaprogramar
git submodule update --remote
git add .
git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
git push
echo "⏰ 4. Wait 3 seconds..."
sleep 3
echo "3️⃣ 5. Merging dev to prod..."
git push . head:prod
echo "🚀 6. Updating prod & trigger build on netlify..."
git push origin prod
echo "✅ Done!"