	##################################################################

	## Test to verify aes_core (Arty Z7 project)

	## This test must be run from Vivado XSDB console
	## Ex.: C:/Xilinx/Vivado/2024.2/settings64
	
	## Before running this script open hardware manager in Vivado
	## and set up the ILA triggers
	
	## Remember to set up and run the Vivado ILA triggers 

	##################################################################
	
	## Enable cipher in the Aes Control register (reg 8 bit 0)
	mwr 0x43C00020 0x00000011
	
	## Write in the AES registers to set up a key (256 bits)
	mwr 0x43C00000 0x00000000
	mwr 0x43C00004 0x00000000
	mwr 0x43C00008 0x00000000
	mwr 0x43C0000C 0x00000000
	mwr 0x43C00010 0x2b7e1516
	mwr 0x43C00014 0x28aed2a6
	mwr 0x43C00018 0xabf71588
	mwr 0x43C0001C 0x09cf4f3c
	
	## Initialize the DDR memory (input and output sections)
	mwr 0x01000000 0x3ad77bb4
	mwr 0x01000004 0x0d7a3660
	mwr 0x01000008 0xa89ecaf3
	mwr 0x0100000C 0x2466ef97
	
	mwr 0x01000010 0xf5d3d585
	mwr 0x01000014 0x03b9699d
	mwr 0x01000018 0xe785895a
	mwr 0x0100001C 0x96fdbaaf
	
	mwr 0x02000000 0xDEADBEEF
	mwr 0x02000004 0xDEADBEEF
	mwr 0x02000008 0xDEADBEEF
	mwr 0x0200000C 0xDEADBEEF
	
	mwr 0x02000010 0xDEADBEEF
	mwr 0x02000014 0xDEADBEEF
	mwr 0x02000018 0xDEADBEEF
	mwr 0x0200001C 0xDEADBEEF
	
	## Reset both DMA interfaces before configuration 
	## reset MM2S
	mwr 0x40400000 0x00000004
	## reset S2MM
	mwr 0x40400030 0x00000004
	
	## Configure the DMA slave control registers
	## enable S2MM
	mwr 0x40400030 0x00000001
	## destiny location
	mwr 0x40400048 0x02000000
	## length in bytes
	mwr 0x40400058 32
	
	## Configure the DMA master control registers
	## enable MM2S
	mwr 0x40400000 0x00000001
	## source location
	mwr 0x40400018 0x01000000
	## length in bytes
	mwr 0x40400028 32
	
	## Check DMA control bits
	## master interface
	## mrd 0x40400004
	## slave interface
	## mrd 0x40400034
	
	## Check DDR registers with input value
	## mrd 0x01000000
	## mrd 0x01000008
	## mrd 0x01000010
	## mrd 0x01000018
	## Check DDR registers with output value
	## mrd 0x02000000
	## mrd 0x02000008
	## mrd 0x02000010
	## mrd 0x02000018
	
	## Debug AXI Lite
	## check mode
	## mrd 0x43C00020
	## check key
	## mrd 0x43C00000 
	## mrd 0x43C00004 
	## mrd 0x43C00008 
	## mrd 0x43C0000C 
	## mrd 0x43C00010 
	## mrd 0x43C00014 
	## mrd 0x43C00018 
	## mrd 0x43C0001C 