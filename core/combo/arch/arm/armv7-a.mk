# Configuration for Linux on ARM.
# Generating binaries for the ARMv7-a architecture and higher
#
ARCH_ARM_HAVE_THUMB_SUPPORT     := true
ARCH_ARM_HAVE_FAST_INTERWORKING := true
ARCH_ARM_HAVE_64BIT_DATA        := true
ARCH_ARM_HAVE_HALFWORD_MULTIPLY := true
ARCH_ARM_HAVE_CLZ               := true
ARCH_ARM_HAVE_FFS               := true
ARCH_ARM_HAVE_ARMV7A            := true
ARCH_ARM_HAVE_TLS_REGISTER      := true
ARCH_ARM_HAVE_VFP               := true


arch_variant_cflags := \
    -march=armv7-a

ifneq ($(strip $(TARGET_ARCH_VARIANT_CPU)),)
arch_variant_cflags += \
    -mtune=$(strip $(TARGET_ARCH_VARIANT_CPU))
endif


arch_variant_cflags := \
    -march=armv7-a \
    -mfloat-abi=softfp \
    -mfpu=vfpv3-d16

arch_variant_ldflags := \
	-Wl,--fix-cortex-a8
