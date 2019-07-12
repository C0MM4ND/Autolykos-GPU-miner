SET "OPENSSL_DIR=C:\OpenSSL-Win64"
SET "LIBCURL_DIR=C:\Users\C\Desktop\Ergo\Miner\secp256k1\curl"
SET "CUDA_COMPUTE_ARCH=50"
SET "BLOCK_DIM=64"
SET "WORKSPACE=0x400000"
cd src
nvcc -o ../bin/miner_%CUDA_COMPUTE_ARCH%.exe -gencode arch=compute_%CUDA_COMPUTE_ARCH%,code=sm_%CUDA_COMPUTE_ARCH%^
 -gencode arch=compute_61,code=compute_61 -DBLOCK_DIM=%BLOCK_DIM% -DNONCES_PER_ITER=%WORKSPACE%^
 -I %OPENSSL_DIR%\include ^
 -I %LIBCURL_DIR%\include ^
 -l %LIBCURL_DIR%\builds\libcurl-vc-x64-release-dll-ipv6-sspi-winssl-obj-lib/libcurl ^
 -l %OPENSSL_DIR%\lib\libeay32 -L %OPENSSL_DIR%/lib ^
autolykos.cu conversion.cc cryptography.cc definitions.cc jsmn.c ^
mining.cu prehash.cu processing.cc request.cc easylogging++.cc bip39/bip39.cc bip39/util.cc
cd ..