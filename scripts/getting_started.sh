echo "#### 1. Creating _live folder"
mkdir _live
echo "#### 2. Cloning notes"
git clone git@github.com:linuxmobile/notes.git
echo "#### 3. Done cloning notes!"
echo "#### 4. Cloning _site"
cd .. 
git clone git@github.com:linuxmobile/_site.git ~/Templates/aprendiendoaprogramar/_site
echo "#### 5. Done cloning _site"
