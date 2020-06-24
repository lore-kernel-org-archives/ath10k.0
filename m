Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnvLc-0006xO-KN
 for ath10k@lists.infradead.org; Wed, 24 Jun 2020 02:41:14 +0000
Date: Wed, 24 Jun 2020 10:40:56 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS WITH WARNING
 646898f8c82ec41059a45f84707f2229c2a5060c
Message-ID: <5ef2bd38.gh/jtJp6p/3YUMz9%lkp@intel.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath11k-qca6390-bringup
branch HEAD: 646898f8c82ec41059a45f84707f2229c2a5060c  ath11k: reset MHI during power down and power up

Warning in current branch:

drivers/net/wireless/ath/ath11k/pci.c:1078:21: warning: variable 'ar_pci' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/pci.c:362:6: warning: no previous prototype for 'ath11k_pci_soc_global_reset' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:389:6: warning: no previous prototype for 'ath11k_pci_clear_dbg_registers' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:419:6: warning: no previous prototype for 'ath11k_pci_force_wake' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:425:6: warning: no previous prototype for 'ath11k_pci_force_wake_release' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:431:6: warning: no previous prototype for 'ath11k_pci_sw_reset' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/qmi.c:1734:34: warning: assignment to 'u32 *' {aka 'unsigned int *'} from 'u32' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
drivers/net/wireless/ath/ath11k/qmi.c:1766:34: warning: assignment to 'u32 *' {aka 'unsigned int *'} from 'u32' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]

Warning ids grouped by kconfigs:

recent_errors
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- arm-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- arm-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- arm64-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- c6x-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- h8300-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- h8300-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- i386-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- ia64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- ia64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- m68k-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- m68k-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- mips-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- mips-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- nios2-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- openrisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- parisc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- parisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- riscv-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- riscv-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- sh-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- sparc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- sparc64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
|-- sparc64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast
`-- xtensa-allyesconfig
    `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:assignment-to-u32-aka-unsigned-int-from-u32-aka-unsigned-int-makes-pointer-from-integer-without-a-cast

elapsed time: 725m

configs tested: 132
configs skipped: 9

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                malta_kvm_guest_defconfig
sh                          rsk7203_defconfig
arc                         haps_hs_defconfig
xtensa                          iss_defconfig
arm                          lpd270_defconfig
h8300                     edosk2674_defconfig
sh                           se7722_defconfig
nios2                            alldefconfig
m68k                            q40_defconfig
arm                            pleb_defconfig
arm                           h3600_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
ia64                             allyesconfig
mips                           ip28_defconfig
alpha                            alldefconfig
arc                             nps_defconfig
arm                      integrator_defconfig
arm                      tct_hammer_defconfig
mips                        omega2p_defconfig
powerpc                          g5_defconfig
c6x                         dsk6455_defconfig
arm                          tango4_defconfig
powerpc                      ppc44x_defconfig
m68k                             allyesconfig
mips                           ip27_defconfig
m68k                         amcore_defconfig
powerpc                    gamecube_defconfig
arc                          axs101_defconfig
powerpc                      mgcoge_defconfig
mips                     cu1000-neo_defconfig
sparc                            alldefconfig
sparc64                             defconfig
mips                        nlm_xlr_defconfig
sh                        sh7757lcr_defconfig
arm                        multi_v7_defconfig
arm                          gemini_defconfig
powerpc                 mpc8272_ads_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
arm                        clps711x_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                            mps2_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200623
i386                 randconfig-a002-20200623
i386                 randconfig-a003-20200623
i386                 randconfig-a001-20200623
i386                 randconfig-a005-20200623
i386                 randconfig-a004-20200623
i386                 randconfig-a013-20200623
i386                 randconfig-a016-20200623
i386                 randconfig-a012-20200623
i386                 randconfig-a014-20200623
i386                 randconfig-a015-20200623
i386                 randconfig-a011-20200623
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
