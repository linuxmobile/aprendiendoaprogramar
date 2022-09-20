#!/bin/bash
echo "1️⃣ 1. Updating notes..."
cd notesData
git add .
git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
git push
echo "⏰ 2. Wait 3 seconds..."
sleep 3
echo "2️⃣ 3. Updating submodules & current changes..."
cd ..
git submodule update --remote
git add .
git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
git push
echo "⏰ 4. Wait 3 seconds..."
sleep 3
echo "3️⃣ 5. Merging dev to prod..."
git push . HEAD:prod
echo "🚀 6. Updating prod & trigger build on netlify..."
git push origin prod
echo "4️⃣ Merging prod to dev..."
git push . HEAD:main
echo "🔙 Back to dev"
git checkout main
echo "✅ Done!"