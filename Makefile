#Dynamic tables is ignored: ssdt8.aml ssdt9.aml ssdt10.aml ssdt11.aml \
#CPU SSDT is ignored: ssdt5.aml
amls= dsdt.aml \
ssdt1.aml ssdt2.aml ssdt3.aml ssdt4.aml ssdt6.aml \
ssdt7.aml

DESTDIR ?= /
BOOTDIR ?= boot

all: $(amls) acpi_override.img

install: acpi_override.img
	install -Dm644 acpi_override.img $(DESTDIR)$(BOOTDIR)/acpi_override.img

$(amls): %.aml: %.dsl
	iasl -tc $<

acpi_override.img: $(amls)
	mkdir -p kernel/firmware/acpi
	cp $(amls) kernel/firmware/acpi
	find kernel | cpio -H newc --create > acpi_override.img

clean:
	rm -rf kernel
	rm acpi_override.img
	rm *.hex *.aml
