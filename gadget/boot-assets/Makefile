all: boot.scr ../uboot.env
boot.scr: boot.scr.in
	mkimage -A arm -T script -C none -n 'Ubuntu Core' -d boot.scr.in boot.scr

../uboot.env: uboot.env.in
	mkenvimage -r -s 131072  -o ../uboot.env uboot.env.in

clean:
	rm ../uboot.env
	rm boot.scr
