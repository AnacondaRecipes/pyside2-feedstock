#! /usr/bin/env bash

if [[ "${target_platform}" == linux-* ]]; then
  # Hack to help the gn build tool find alsa during build. We can't add ${PREFIX}/${BUILD}/sysroot/lib64 to the
  # LD_LIBRARY_PATH below because it causes segfaults in many system applications.
  ln -s ../../lib64/libasound.so.2 ${PREFIX}/${BUILD/conda_cos7/conda}/sysroot/usr/lib64/libasound.so.2

  # Add runtime path of libEGL.so.1 so Qt libraries can find it as they're loaded in.
  # This must be done before the python interpreter starts up.
  export LD_LIBRARY_PATH="${PREFIX}/${BUILD/conda_cos7/conda}/sysroot/usr/lib64:${LD_LIBRARY_PATH}"
fi

${PYTHON} ${RECIPE_DIR}/check_imports.py

shiboken6 --help
pyside6-rcc -help
pyside6-uic -help
test -f ${PREFIX}/lib/qt6/plugins/designer/libPySidePlugin${SHLIB_EXT}
