rm -rf _build
cd ..
jupyter-book build second-try
cd second-try
git add .
git commit -m "some messages here."
git push origin master