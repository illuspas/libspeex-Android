LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE:= libspeex

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
	src/bits.c                         \
	src/cb_search.c                    \
	src/exc_10_16_table.c              \
	src/exc_10_32_table.c              \
	src/exc_20_32_table.c              \
	src/exc_5_256_table.c              \
	src/exc_5_64_table.c               \
	src/exc_8_128_table.c              \
	src/filters.c                      \
	src/gain_table.c                   \
	src/gain_table_lbr.c               \
	src/hexc_10_32_table.c             \
	src/hexc_table.c                   \
	src/high_lsp_tables.c              \
	src/lpc.c                          \
	src/lsp.c                          \
	src/lsp_tables_nb.c                \
	src/ltp.c                          \
	src/modes.c                        \
	src/modes_wb.c                     \
	src/nb_celp.c                      \
	src/quant_lsp.c                    \
	src/sb_celp.c                      \
	src/speex.c                        \
	src/speex_callbacks.c              \
	src/speex_header.c                 \
	src/stereo.c                       \
	src/vbr.c                          \
	src/vq.c                           \
	src/window.c

LOCAL_CFLAGS := -O2 -DHAVE_CONFIG_H

ifeq ($(TARGET_ARCH_ABI),armeabi)
    LOCAL_CFLAGS += -mfpu=vfp -mfloat-abi=softfp 
endif

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -mvectorize-with-neon-quad
    LOCAL_LDFLAGS := -Wl,--fix-cortex-a8
endif

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libspeexdsp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
	src/buffer.c                       \
	src/fftwrap.c                      \
	src/filterbank.c                   \
	src/jitter.c                       \
	src/mdf.c                          \
	src/preprocess.c                   \
	src/resample.c                     \
	src/scal.c                         \
	src/smallft.c                      

LOCAL_CFLAGS := -O2 -DHAVE_CONFIG_H

ifeq ($(TARGET_ARCH_ABI),armeabi)
    LOCAL_CFLAGS += -mfpu=vfp -mfloat-abi=softfp 
endif

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -mvectorize-with-neon-quad
    LOCAL_LDFLAGS := -Wl,--fix-cortex-a8
endif

include $(BUILD_SHARED_LIBRARY)

