# Configuration for Linux on ARM.
# Generating binaries for the ARMv7-a architecture and higher with NEON
#

TARGET_ARCH_VARIANT_FPU := neon
include $(BUILD_COMBOS)/arch/$(TARGET_ARCH)/armv7-a.mk

ifeq ($(TARGET_ARCH_VARIANT_CPU), cortex-a15)
ARCH_ARM_HAVE_NEON_UNALIGNED_ACCESS    := true
ARCH_ARM_NEON_MEMSET_DIVIDER           := 132
#ARCH_ARM_NEON_MEMCPY_ALIGNMENT_DIVIDER := 224
endif
ifeq ($(TARGET_ARCH_VARIANT_CPU), cortex-a9)
ARCH_ARM_HAVE_NEON_UNALIGNED_ACCESS    := true
ARCH_ARM_NEON_MEMSET_DIVIDER           := 132
ARCH_ARM_NEON_MEMCPY_ALIGNMENT_DIVIDER := 224
endif
ifeq ($(TARGET_ARCH_VARIANT_CPU), cortex-a8)
ARCH_ARM_HAVE_NEON_UNALIGNED_ACCESS    := true
ARCH_ARM_NEON_MEMSET_DIVIDER           := 132
ARCH_ARM_NEON_MEMCPY_ALIGNMENT_DIVIDER := 224
endif

ARCH_ARM_HAVE_ARMV7A            := true
ARCH_ARM_HAVE_VFP               := true
ARCH_ARM_HAVE_VFP_D32           := true
ARCH_ARM_HAVE_NEON              := true

ifeq ($(strip $(TARGET_CPU_VARIANT)), cortex-a15)
	arch_variant_cflags := -mcpu=cortex-a15
else
ifeq ($(strip $(TARGET_CPU_VARIANT)),cortex-a7)
	arch_variant_cflags := -mcpu=cortex-a7
else
	arch_variant_cflags := -march=armv7-a
endif
endif

arch_variant_cflags += \
    -mfloat-abi=softfp \
    -mfpu=neon


