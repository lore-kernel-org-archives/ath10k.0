Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kklbu-0002aW-SI
 for ath10k@lists.infradead.org; Thu, 03 Dec 2020 10:13:17 +0000
Date: Thu, 03 Dec 2020 18:12:39 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master] BUILD SUCCESS 73ab5855a7cfaa9f487629b5d4858ae7e3f889ba
Message-ID: <5fc8ba17.ov9CUcGuzhn2q/Qz%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  master
branch HEAD: 73ab5855a7cfaa9f487629b5d4858ae7e3f889ba  Add localversion-wireless-testing-ath

elapsed time: 724m

configs tested: 203
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             pxa_defconfig
arm                           h3600_defconfig
m68k                       m5275evb_defconfig
arm                          tango4_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                   motionpro_defconfig
mips                     cu1830-neo_defconfig
sh                        sh7763rdp_defconfig
powerpc                   lite5200b_defconfig
powerpc                     sbc8548_defconfig
arm                      footbridge_defconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
powerpc                     pseries_defconfig
sparc                       sparc64_defconfig
mips                           ip22_defconfig
m68k                          multi_defconfig
mips                           mtx1_defconfig
m68k                          sun3x_defconfig
arm                         s5pv210_defconfig
ia64                             alldefconfig
arm                         nhk8815_defconfig
sh                           se7705_defconfig
c6x                        evmc6457_defconfig
mips                      malta_kvm_defconfig
arm                           sama5_defconfig
arm                         mv78xx0_defconfig
powerpc                     ksi8560_defconfig
sh                          rsk7264_defconfig
powerpc                        fsp2_defconfig
sh                             shx3_defconfig
sh                        sh7785lcr_defconfig
powerpc                    adder875_defconfig
powerpc                     powernv_defconfig
powerpc                     ep8248e_defconfig
mips                         tb0226_defconfig
arc                        nsimosci_defconfig
mips                  maltasmvp_eva_defconfig
openrisc                            defconfig
parisc                generic-32bit_defconfig
h8300                               defconfig
arm                         orion5x_defconfig
powerpc                           allnoconfig
powerpc                      ep88xc_defconfig
arm                        mini2440_defconfig
sh                        apsh4ad0a_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                      loongson3_defconfig
microblaze                          defconfig
m68k                         apollo_defconfig
arm                     am200epdkit_defconfig
sh                         ecovec24_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
mips                        bcm47xx_defconfig
sh                              ul2_defconfig
arm                        oxnas_v6_defconfig
mips                        nlm_xlp_defconfig
nds32                             allnoconfig
sh                           se7724_defconfig
arm                       versatile_defconfig
sh                            hp6xx_defconfig
arm                           sunxi_defconfig
nds32                               defconfig
mips                     decstation_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v7_defconfig
xtensa                           alldefconfig
arm                          pxa168_defconfig
powerpc                          g5_defconfig
powerpc                         wii_defconfig
riscv                             allnoconfig
microblaze                      mmu_defconfig
um                            kunit_defconfig
nios2                            alldefconfig
sparc64                             defconfig
sparc                       sparc32_defconfig
sh                           se7343_defconfig
arm                          pxa3xx_defconfig
arm                              zx_defconfig
s390                             alldefconfig
powerpc                   currituck_defconfig
powerpc                 mpc8272_ads_defconfig
mips                         bigsur_defconfig
arm                          prima2_defconfig
arc                           tb10x_defconfig
powerpc                       maple_defconfig
parisc                           alldefconfig
um                             i386_defconfig
powerpc                       ppc64_defconfig
ia64                         bigsur_defconfig
powerpc                     tqm8560_defconfig
arm                       cns3420vb_defconfig
arm                           omap1_defconfig
mips                         mpc30x_defconfig
mips                       rbtx49xx_defconfig
arm                         s3c2410_defconfig
arm                       omap2plus_defconfig
arc                     haps_hs_smp_defconfig
arm                            lart_defconfig
riscv                    nommu_virt_defconfig
powerpc                    gamecube_defconfig
arm                           corgi_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                       m5208evb_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20201202
x86_64               randconfig-a006-20201202
x86_64               randconfig-a001-20201202
x86_64               randconfig-a002-20201202
x86_64               randconfig-a005-20201202
x86_64               randconfig-a003-20201202
i386                 randconfig-a004-20201202
i386                 randconfig-a005-20201202
i386                 randconfig-a001-20201202
i386                 randconfig-a002-20201202
i386                 randconfig-a006-20201202
i386                 randconfig-a003-20201202
i386                 randconfig-a004-20201203
i386                 randconfig-a005-20201203
i386                 randconfig-a001-20201203
i386                 randconfig-a002-20201203
i386                 randconfig-a006-20201203
i386                 randconfig-a003-20201203
x86_64               randconfig-a016-20201203
x86_64               randconfig-a012-20201203
x86_64               randconfig-a014-20201203
x86_64               randconfig-a013-20201203
x86_64               randconfig-a015-20201203
x86_64               randconfig-a011-20201203
i386                 randconfig-a014-20201202
i386                 randconfig-a013-20201202
i386                 randconfig-a011-20201202
i386                 randconfig-a015-20201202
i386                 randconfig-a012-20201202
i386                 randconfig-a016-20201202
i386                 randconfig-a014-20201203
i386                 randconfig-a013-20201203
i386                 randconfig-a011-20201203
i386                 randconfig-a015-20201203
i386                 randconfig-a012-20201203
i386                 randconfig-a016-20201203
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201202
x86_64               randconfig-a012-20201202
x86_64               randconfig-a014-20201202
x86_64               randconfig-a013-20201202
x86_64               randconfig-a015-20201202
x86_64               randconfig-a011-20201202
x86_64               randconfig-a004-20201203
x86_64               randconfig-a006-20201203
x86_64               randconfig-a001-20201203
x86_64               randconfig-a002-20201203
x86_64               randconfig-a005-20201203
x86_64               randconfig-a003-20201203

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
