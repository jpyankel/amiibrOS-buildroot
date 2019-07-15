#!/bin/sh

# Copy over the rpi boot config file.
cat amiibrOS_config.txt > ${BINARIES_DIR}/rpi-firmware/config.txt

# Build raylib and install to target:
(cd ../amiibrOS-raylib/src && make && cp -r ../build/*.so* \
  ${TARGET_DIR}/usr/lib/)

# Build amiibrOS system software and install to target:
(cd ../subproj/amiibrOS && make clean && make rpi \
  && mkdir -p ${TARGET_DIR}/usr/bin/amiibrOS/ \
  && cp -r build/* ${TARGET_DIR}/usr/bin/amiibrOS)
(mkdir -p ${TARGET_DIR}/usr/bin/amiibrOS/amiibo_scan \
  && cp ../subproj/amiibo_scan/amiibo_scan.py ${TARGET_DIR}/usr/bin/amiibrOS\
  /amiibo_scan)
