Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlRM9-0003jJ-Ia
 for ath10k@lists.infradead.org; Wed, 17 Jun 2020 06:15:31 +0000
Date: Wed, 17 Jun 2020 14:14:41 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS WITH WARNING
 682bd79bb8fe637b426947462daa7bdf155b198a
Message-ID: <5ee9b4d1.uUpcsNf1V6RwPyVB%lkp@intel.com>
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
branch HEAD: 682bd79bb8fe637b426947462daa7bdf155b198a  ath11k: reset MHI during power down and power up

Warning in current branch:

drivers/net/wireless/ath/ath11k/pci.c:1078:21: warning: variable 'ar_pci' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/pci.c:362:6: warning: no previous prototype for 'ath11k_pci_soc_global_reset' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:389:6: warning: no previous prototype for 'ath11k_pci_clear_dbg_registers' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:419:6: warning: no previous prototype for 'ath11k_pci_force_wake' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:425:6: warning: no previous prototype for 'ath11k_pci_force_wake_release' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/pci.c:431:6: warning: no previous prototype for 'ath11k_pci_sw_reset' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- arc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- arm64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- i386-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- ia64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- mips-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- parisc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- powerpc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- sparc64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
|-- sparc64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
|   |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used
`-- xtensa-allyesconfig
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_clear_dbg_registers
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_force_wake_release
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_soc_global_reset
    |-- drivers-net-wireless-ath-ath11k-pci.c:warning:no-previous-prototype-for-ath11k_pci_sw_reset
    `-- drivers-net-wireless-ath-ath11k-pci.c:warning:variable-ar_pci-set-but-not-used

elapsed time: 721m

configs tested: 99
configs skipped: 2

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                         axm55xx_defconfig
mips                         bigsur_defconfig
mips                      bmips_stb_defconfig
sh                            migor_defconfig
arm                             pxa_defconfig
um                           x86_64_defconfig
mips                      pic32mzda_defconfig
arm                       versatile_defconfig
ia64                      gensparse_defconfig
m68k                          hp300_defconfig
powerpc                    mvme5100_defconfig
sh                          r7785rp_defconfig
arm                        magician_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a015-20200615
i386                 randconfig-a011-20200615
i386                 randconfig-a014-20200615
i386                 randconfig-a013-20200615
i386                 randconfig-a016-20200615
i386                 randconfig-a012-20200615
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
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
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
