rm -rf _build
cd ..
jupyter-book build dviz-book
cd dviz-book
git add .
git commit -m "some messages here."
git push origin master