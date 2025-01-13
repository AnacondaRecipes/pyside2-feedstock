${PYTHON} ${RECIPE_DIR}/check_imports.py

set py_ver=%PY_VER:.=%

if not exist %PREFIX%\\Scripts\\pyside6-rcc.exe exit 1
if not exist %PREFIX%\\Scripts\\pyside6-uic.exe exit 2
if not exist %LIBRARY_BIN%\\shiboken6.exe exit 3
if not exist %LIBRARY_BIN%\\shiboken6.cp%py_ver%-win_amd64.dll exit 4
if not exist %LIBRARY_BIN%\\pyside6.cp%py_ver%-win_amd64.dll exit 5
if not exist %LIBRARY_INC%\\PySide6\\pyside.h exit 6
if not exist %LIBRARY_INC%\\shiboken6\\shiboken.h exit 7
if not exist %LIBRARY_LIB%\\shiboken6.cp%py_ver%-win_amd64.lib exit 8
if not exist %LIBRARY_LIB%\\pyside6.cp%py_ver%-win_amd64.lib exit 9
if not exist %LIBRARY_LIB%\\cmake\\PySide6\\PySide6Config.cmake exit 10
if not exist %LIBRARY_LIB%\\pkgconfig\\pyside6.pc exit 11
if not exist %LIBRARY_LIB%\\pkgconfig\\shiboken6.pc exit 12

shiboken6 --help
pyside6-rcc -help
pyside6-uic -help
