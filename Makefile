all: out out/kernel.snap out/gadget.snap

out/kernel.snap: out
	cd kernel && \
	snapcraft --target-arch armhf -d snap --output ../out/kernel.snap

out/gadget.snap: out
	cd gadget && \
	ln -s uboot.env uboot.conf && \
	snapcraft --target-arch armhf -d snap . --output ../out/gadget.snap

image:
	sudo ubuntu-image \
		--channel stable \
		--image-size 4G \
		--extra-snaps snapweb \
		--extra-snaps bluez \
		--extra-snaps modem-manager \
		--extra-snaps network-manager \
		--extra-snaps out/kernel.snap \
		--extra-snaps out/gadget.snap \
		-o uc16-imx6.img \
		model
	sudo chown $(USER):$(USER) uc16-imx6.img

out: 
	-mkdir out

clean:
	cd kernel && snapcraft clean
	cd gadget && snapcraft clean
