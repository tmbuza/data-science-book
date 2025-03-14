#!usr/bin/bash

# Initialize a new Git repository
git init

# Create the necessary directories
mkdir notebooks book scripts .github .github/workflows

# Add a README and other initial files
echo "# Data Science Book" > README.md
echo "data-science-book/" > .gitignore
echo "bookdown" > scripts/requirements.txt

# Add your Jupyter notebooks, Rmd files, and Bookdown files
# Make sure your scripts, notebooks, and other project files are ready

# Add files to Git
git add .

# Commit files
git commit -m "Initial commit"

# Link to GitHub (replace with your repo URL)
git remote add origin https://github.com/tmbuza/data-science-book.git

# Push to GitHub
git push -u origin main