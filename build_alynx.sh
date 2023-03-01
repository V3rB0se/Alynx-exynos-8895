#!/bin/bash

# SETUP VARIABLES
JOBS=2
lcyan='\e[96m'
reset='\e[0m'

export ANDROID_MAJOR_VERSION=p
export PLATFORM_VERSION=9.0.0

## Lineage 20

# SETUP BUILD
printf "${lcyan} * * * * * * * * * * * * * * * * * * * * * * * * * \n"
printf " *                                               * \n"
printf " *     █████╗ ██╗  ██╗   ██╗███╗   ██╗██╗  ██╗   * \n"
printf " *    ██╔══██╗██║  ╚██╗ ██╔╝████╗  ██║╚██╗██╔╝   * \n"
printf " *    ███████║██║   ╚████╔╝ ██╔██╗ ██║ ╚███╔╝    * \n"
printf " *    ██╔══██║██║    ╚██╔╝  ██║╚██╗██║ ██╔██╗    * \n"
printf " *    ██║  ██║███████╗██║   ██║ ╚████║██╔╝ ██╗   * \n"
printf " *    ╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝  ╚═══╝╚═╝  ╚═╝   * \n"
printf " *                                               * \n"
printf " * * * * * *  BUILDING ALYNX NETHUNTER * * * * * * \n"
printf "\n \n"

# Created By @v3rb0se xda for Nethunter

CHOOSE_DEVICE(){
	printf " ================================================= \n"
	printf " ||               Select Variant:               || \n"
	printf " ================================================= \n"
	printf "  \n"
	printf " 1) Samsung Galaxy S8 (G950X) \n"
	printf " 2) Samsung Galaxy S8+ (G955X) \n" 
	printf " 3) Samsung Galaxy Note 8 (N950X) \n"
	 
	echo ""
	read -p "Please select your build Variant (1,2,3) > " WHICH_DEVICE
	if [ $WHICH_DEVICE = "1" ]; then
		echo "Building Nethunter For Galaxy S8 (G950X)"
		DEFCONFIG=exynos8895-dreamlte_defconfig
		PrintDevice="Samsung Galaxy S8"
	fi
	if [ $WHICH_DEVICE = "2" ]; then
		echo "Building Nethunter For Samsung Galaxy S8+ (G955X)"
		DEFCONFIG=exynos8895-dream2lte_defconfig
		PrintDevice="Samsung Galaxy S8+"
	fi
	if [ $WHICH_DEVICE = "3" ]; then
		echo "Building Nethunter For Samsung Galaxy Note 8 (N950)"
		DEFCONFIG=exynos8895-greatlte_defconfig
		PrintDevice="Samsung Galaxy Note 8"
	fi
	
	echo "Selected $PrintDevice"
	echo "----------------------------------------------"
}

	CHOOSE_DEVICE

echo "----------------------------------------------"
	make -j$JOBS $DEFCONFIG
	make menuconfig
	cp .config arch/arm64/configs/$DEFCONFIG
	cd $SOURCE_PATH
echo "----------------------------------------------"
	rm arch/arm64/boot/dts/exynos/*dtb*

echo "==================="
echo " Compilation Start "
echo "==================="
echo "----------------------------------------------"

	make -j$JOBS $DEFCONFIG
	make -j$JOBS
	
echo "----------------------------------------------"	
echo "================="
echo " Compilation End "
echo "================="

