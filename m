Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knyyi-0005Xq-61
 for ath10k@lists.infradead.org; Sat, 12 Dec 2020 07:06:05 +0000
Date: Sat, 12 Dec 2020 15:05:55 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:pending] BUILD SUCCESS
 708668e014da9bae2cc44f0f9bb8ef7da37e48b5
Message-ID: <5fd46bd3.0KgDGhayWKeiOOAn%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  pending
branch HEAD: 708668e014da9bae2cc44f0f9bb8ef7da37e48b5  ath11k: implement suspend for QCA6390 PCI devices

elapsed time: 723m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 linkstation_defconfig
sh                         apsh4a3a_defconfig
arm                           omap1_defconfig
powerpc                     mpc512x_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
nios2                         3c120_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          r7785rp_defconfig
mips                             allmodconfig
powerpc                     tqm8548_defconfig
m68k                           sun3_defconfig
openrisc                            defconfig
arm                            pleb_defconfig
ia64                             allyesconfig
arm                          collie_defconfig
arm                           sunxi_defconfig
parisc                generic-32bit_defconfig
m68k                       m5275evb_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
arm                      integrator_defconfig
arm                            qcom_defconfig
sh                          rsk7264_defconfig
mips                     cu1000-neo_defconfig
powerpc                        cell_defconfig
arm                      jornada720_defconfig
powerpc                     tqm8541_defconfig
sh                          landisk_defconfig
powerpc                       holly_defconfig
powerpc                 mpc832x_rdb_defconfig
parisc                              defconfig
xtensa                    smp_lx200_defconfig
arm                        mvebu_v7_defconfig
sh                             shx3_defconfig
arm                         socfpga_defconfig
arm                          moxart_defconfig
arm                         s3c6400_defconfig
arm                       aspeed_g4_defconfig
arc                         haps_hs_defconfig
powerpc                        warp_defconfig
parisc                           alldefconfig
powerpc                    klondike_defconfig
mips                      loongson3_defconfig
arm                       spear13xx_defconfig
arm                        trizeps4_defconfig
nios2                         10m50_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                      bamboo_defconfig
riscv                               defconfig
powerpc                     ppa8548_defconfig
arm                          gemini_defconfig
sh                             sh03_defconfig
powerpc                      chrp32_defconfig
mips                           gcw0_defconfig
m68k                       bvme6000_defconfig
powerpc                   currituck_defconfig
nds32                               defconfig
ia64                                defconfig
powerpc                 mpc8560_ads_defconfig
arm                         assabet_defconfig
xtensa                         virt_defconfig
xtensa                generic_kc705_defconfig
sparc                            allyesconfig
powerpc                          g5_defconfig
arm                         mv78xx0_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          simpad_defconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20201209
i386                 randconfig-a005-20201209
i386                 randconfig-a001-20201209
i386                 randconfig-a002-20201209
i386                 randconfig-a006-20201209
i386                 randconfig-a003-20201209
x86_64               randconfig-a016-20201209
x86_64               randconfig-a012-20201209
x86_64               randconfig-a013-20201209
x86_64               randconfig-a014-20201209
x86_64               randconfig-a015-20201209
x86_64               randconfig-a011-20201209
i386                 randconfig-a013-20201209
i386                 randconfig-a014-20201209
i386                 randconfig-a011-20201209
i386                 randconfig-a015-20201209
i386                 randconfig-a012-20201209
i386                 randconfig-a016-20201209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201209
x86_64               randconfig-a006-20201209
x86_64               randconfig-a005-20201209
x86_64               randconfig-a001-20201209
x86_64               randconfig-a002-20201209
x86_64               randconfig-a003-20201209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
