Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNUjl-0001zS-SW
 for ath10k@lists.infradead.org; Wed, 30 Sep 2020 05:33:11 +0000
Date: Wed, 30 Sep 2020 13:32:57 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:pending] BUILD SUCCESS
 33722636dbd054d9c8dbf9f08c442efc8933105e
Message-ID: <5f741889.dJxytwmXnSLZJ0eJ%lkp@intel.com>
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
branch HEAD: 33722636dbd054d9c8dbf9f08c442efc8933105e  ath11k: Use GFP_ATOMIC instead of GFP_KERNEL in idr_alloc

elapsed time: 720m

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
arm                           h3600_defconfig
powerpc                          g5_defconfig
arm                       spear13xx_defconfig
mips                           ip22_defconfig
arm                         nhk8815_defconfig
ia64                        generic_defconfig
mips                       rbtx49xx_defconfig
powerpc                      pmac32_defconfig
powerpc64                        alldefconfig
sh                        sh7785lcr_defconfig
riscv                            alldefconfig
arm                           viper_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8541_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
arm                       imx_v6_v7_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                          defconfig
arc                        vdk_hs38_defconfig
mips                             allmodconfig
mips                      pic32mzda_defconfig
mips                       lemote2f_defconfig
mips                 decstation_r4k_defconfig
mips                malta_kvm_guest_defconfig
h8300                     edosk2674_defconfig
mips                         tb0219_defconfig
sh                          r7780mp_defconfig
m68k                       m5249evb_defconfig
mips                       capcella_defconfig
sh                   sh7770_generic_defconfig
csky                                defconfig
arm                          ep93xx_defconfig
arm                           h5000_defconfig
sh                           se7780_defconfig
arm                         ebsa110_defconfig
c6x                                 defconfig
sh                      rts7751r2d1_defconfig
alpha                            alldefconfig
m68k                            q40_defconfig
sh                           se7712_defconfig
mips                     loongson1c_defconfig
xtensa                         virt_defconfig
sparc64                             defconfig
powerpc                      ppc6xx_defconfig
arm                      pxa255-idp_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200929
i386                 randconfig-a002-20200929
i386                 randconfig-a003-20200929
i386                 randconfig-a004-20200929
i386                 randconfig-a005-20200929
i386                 randconfig-a001-20200929
i386                 randconfig-a003-20200930
i386                 randconfig-a002-20200930
i386                 randconfig-a006-20200930
i386                 randconfig-a005-20200930
i386                 randconfig-a004-20200930
i386                 randconfig-a001-20200930
x86_64               randconfig-a011-20200929
x86_64               randconfig-a013-20200929
x86_64               randconfig-a015-20200929
x86_64               randconfig-a014-20200929
x86_64               randconfig-a016-20200929
x86_64               randconfig-a012-20200929
i386                 randconfig-a012-20200929
i386                 randconfig-a016-20200929
i386                 randconfig-a014-20200929
i386                 randconfig-a013-20200929
i386                 randconfig-a015-20200929
i386                 randconfig-a011-20200929
i386                 randconfig-a011-20200930
i386                 randconfig-a015-20200930
i386                 randconfig-a012-20200930
i386                 randconfig-a014-20200930
i386                 randconfig-a016-20200930
i386                 randconfig-a013-20200930
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a005-20200929
x86_64               randconfig-a003-20200929
x86_64               randconfig-a004-20200929
x86_64               randconfig-a002-20200929
x86_64               randconfig-a006-20200929
x86_64               randconfig-a001-20200929

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
