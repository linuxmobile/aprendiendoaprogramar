# echo "#### 1. Start building site"
# npm run build
echo "#### 2. Start copying aprendiendoaprogramar/_site to _site/_site/"
rm -rf ../_site/_site
mkdir ../_site/_site
cp -Rf _site/* ../_site/_site
echo "End copying"
echo "#### 3. Go to _site folder"
cd ../_site/
echo "#### 4. Start updating _site to Github"
git add .
git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
git push
echo "End updating & come back to aprendiendoaprogramar"
cd ../aprendiendoaprogramar/