Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBQrZ-0003Ss-Ex
 for ath10k@lists.infradead.org; Thu, 27 Aug 2020 22:59:22 +0000
Date: Fri, 28 Aug 2020 06:59:07 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 de7dbc2dbef71aba9331f707e5339874981c2a7f
Message-ID: <5f483abb.94d0kMYxfFyYHldw%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-next
branch HEAD: de7dbc2dbef71aba9331f707e5339874981c2a7f  carl9170: convert tasklets to use new tasklet_setup() API

elapsed time: 725m

configs tested: 112
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
mips                     decstation_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
sh                ecovec24-romimage_defconfig
arm                      pxa255-idp_defconfig
mips                           ip32_defconfig
sh                           se7721_defconfig
powerpc                         ps3_defconfig
arm                             rpc_defconfig
mips                          malta_defconfig
arm                           spitz_defconfig
mips                       rbtx49xx_defconfig
powerpc                     mpc5200_defconfig
mips                           ip22_defconfig
sh                         apsh4a3a_defconfig
microblaze                      mmu_defconfig
microblaze                          defconfig
arc                           tb10x_defconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
mips                      maltaaprp_defconfig
arm                    vt8500_v6_v7_defconfig
sh                             sh03_defconfig
arm                         mv78xx0_defconfig
arc                              allyesconfig
arm                         axm55xx_defconfig
sh                          urquell_defconfig
arm                         assabet_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
sh                          sdk7780_defconfig
c6x                         dsk6455_defconfig
arc                              alldefconfig
arm                  colibri_pxa270_defconfig
mips                       lemote2f_defconfig
m68k                         apollo_defconfig
sh                        edosk7760_defconfig
sh                           sh2007_defconfig
arm                         bcm2835_defconfig
mips                     loongson1b_defconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
alpha                               defconfig
arm                          exynos_defconfig
powerpc                      tqm8xx_defconfig
arm                       aspeed_g4_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20200827
x86_64               randconfig-a002-20200827
x86_64               randconfig-a001-20200827
x86_64               randconfig-a005-20200827
x86_64               randconfig-a006-20200827
x86_64               randconfig-a004-20200827
i386                 randconfig-a002-20200827
i386                 randconfig-a004-20200827
i386                 randconfig-a003-20200827
i386                 randconfig-a005-20200827
i386                 randconfig-a006-20200827
i386                 randconfig-a001-20200827
i386                 randconfig-a013-20200827
i386                 randconfig-a012-20200827
i386                 randconfig-a011-20200827
i386                 randconfig-a016-20200827
i386                 randconfig-a015-20200827
i386                 randconfig-a014-20200827
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
