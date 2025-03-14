mkdir libs
mkdir libs\debug
mkdir libs\release

mkdir pcre2\build
cd pcre2\build

cmake ..

cmake --build .
copy Debug\pcre2-8-staticd.lib ..\..\libs\debug
copy Debug\pcre2-8-staticd.pdb ..\..\libs\debug

cmake --build . --config Release
copy Release\pcre2-8-static.lib ..\..\libs\release