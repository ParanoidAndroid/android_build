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

mcpu-arg = $(shell sed 's/^-mcpu=//' <<< "$(call cc-option,-mcpu=$(1),-mcpu=$(2))")

ifeq ($(TARGET_ARCH_VARIANT_CPU), cortex-a15)
TARGET_ARCH_VARIANT_CPU := $(call mcpu-arg,cortex-a15,cortex-a9)
endif
ifeq ($(TARGET_ARCH_VARIANT_CPU), cortex-a9)
TARGET_ARCH_VARIANT_CPU := $(call mcpu-arg,cortex-a9,cortex-a8)
endif
ifeq ($(TARGET_ARCH_VARIANT_CPU), cortex-a8)
TARGET_ARCH_VARIANT_CPU := $(call mcpu-arg,cortex-a8,)
endif

ifneq ($(strip $(TARGET_ARCH_VARIANT_CPU)),)
arch_variant_cflags := \
    -mcpu=$(strip $(TARGET_ARCH_VARIANT_CPU))
else
# fall back on generic tunning if cpu is not specified

arch_variant_cflags := \
    -march=armv7-a \
    -mfloat-abi=softfp \
    -mfpu=vfpv3-d16

arch_variant_ldflags := \
	-Wl,--fix-cortex-a8
