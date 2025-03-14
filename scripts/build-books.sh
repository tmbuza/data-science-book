#!/bin/bash

# # Define the list of Jupyter Notebook filenames (without extension)
# NOTEBOOK_NAMES=(
#     "getting-started-py"
#     "CDI_PCA_NMDS_Plus"
# )

# # Define the output directory
# OUTPUT_DIR="./"

# # Create the output directory if it doesn't exist
# mkdir -p "$OUTPUT_DIR"

# # Loop through each notebook name
# for NOTEBOOK_NAME in "${NOTEBOOK_NAMES[@]}"; do
#     # Check if the .ipynb file exists
#     if [[ ! -f "$NOTEBOOK_NAME.ipynb" ]]; then
#         echo "Error: $NOTEBOOK_NAME.ipynb not found. Skipping..."
#         continue
#     fi

#     # Export the Jupyter Notebook to Markdown and place it in the output directory
#     jupyter nbconvert --to markdown "$NOTEBOOK_NAME.ipynb" --output-dir "$OUTPUT_DIR"

#     # Check if the markdown file was created, then rename to .Rmd
#     if [[ -f "$OUTPUT_DIR/$NOTEBOOK_NAME.md" ]]; then
#         mv "$OUTPUT_DIR/$NOTEBOOK_NAME.md" "$OUTPUT_DIR/$NOTEBOOK_NAME.Rmd"
#     else
#         echo "Warning: $NOTEBOOK_NAME.md not found. Skipping .md to .Rmd renaming."
#         continue
#     fi

#     # Replace '![png]' with '![]' in the .Rmd file using sed
#     if [[ "$OSTYPE" == "darwin"* ]]; then
#         # macOS version of sed
#         sed -i '' 's/!\[png\]/![]/g' "$OUTPUT_DIR/$NOTEBOOK_NAME.Rmd"
#     else
#         # GNU/Linux version of sed
#         sed -i 's/!\[png\]/![]/g' "$OUTPUT_DIR/$NOTEBOOK_NAME.Rmd"
#     fi

#     # Export the Jupyter Notebook to HTML and place it in the output directory
#     jupyter nbconvert --to html "$NOTEBOOK_NAME.ipynb" --output-dir "$OUTPUT_DIR"

#     # Optionally, you can output additional formats like PDF, Gitbook, etc.
#     # Exporting to different formats can be added here if needed
# done

# Build BS4 for GitHub Pages
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::bs4_book", output_dir = "docs")'

# Build BS4
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::bs4_book", output_dir = "bs4")'

# Build Gitbook
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook", output_dir = "git")'

# Build PDF
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::pdf_book", output_dir = "pdf")'