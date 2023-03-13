#!/bin/sh -l

lftp $INPUT_HOST \
  -u $INPUT_USER,$INPUT_PASSWORD \
  -e "set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false; \
      mirror -R $INPUT_OPTIONS $INPUT_LOCALDIR $INPUT_REMOTEDIR; \
      quit"