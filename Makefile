PWD := /usr/src/intel_uncore_frequency 
# hadcoded kernel version matching OCP v4.12
KVERSION := 4.18.0-372.49.1.el8_6.x86_64
INCLUDE_DIR = /usr/src/kernels/${KVERSION}

CONFIG_MODULE_SIG=n
MODULE_NAME = intel-uncore-frequency

MY_CFLAGS += -g -DDEBUG
EXTRA_CFLAGS += -Wno-misleading-indentation -Wuninitialized
CC += ${MY_CFLAGS}

obj-m := $(MODULE_NAME).o

all:
	make -C $(INCLUDE_DIR) M=$(PWD) modules
clean:
	make -C $(INCLUDE_DIR) M=$(PWD) clean
 
install:
	cp $(MODULE_NAME).ko /lib/modules/${KVERSION}/kernel/drivers/platform/x86
	#depmod -a

uninstall:
	#rmmod $(MODULE_NAME)
	rm -f /lib/modules/${KVERSION}/kernel/drivers/platform/x86/$(MODULE_NAME).ko
	#depmod -a
