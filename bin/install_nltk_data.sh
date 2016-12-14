# bin/install_nltk_data
#!/usr/bin/env bash

source $BIN_DIR/utils

echo "-----> Starting nltk data installation"

# Assumes NLTK_DATA environment variable is already set
# $ heroku config:set NLTK_DATA='/app/nltk_data'

# Install the nltk data
# NOTE: The following command installs the averaged_perceptron_tagger corpora,
# so you may want to change for your specific needs.
# See http://www.nltk.org/data.html
python -m nltk.downloader averaged_perceptron_tagger
python -m nltk.downloader maxent_ne_chunker
python -m nltk.downloader maxent_treebank_pos_tagger
python -m nltk.downloader punkt
python -m nltk.downloader words

# If using Textblob, use this instead:
# python -m textblob.download_corpora lite

# Open the NLTK_DATA directory
cd ${NLTK_DATA}

# Delete all of the zip files
find . -name "*.zip" -type f -delete

echo "-----> Finished nltk data installation"