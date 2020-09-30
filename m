Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNUjl-0001zB-Sf
 for ath10k@lists.infradead.org; Wed, 30 Sep 2020 05:33:11 +0000
Date: Wed, 30 Sep 2020 13:32:55 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 e53240e2b174e8b42610ff00497423b986c8f7a9
Message-ID: <5f741887.vyz54ocwNgkLJdUN%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  master-pending
branch HEAD: e53240e2b174e8b42610ff00497423b986c8f7a9  Merge branch 'pending' into master-pending

elapsed time: 720m

configs tested: 138
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
mips                         db1xxx_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc8560_ads_defconfig
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
arm                            zeus_defconfig
arm                     davinci_all_defconfig
openrisc                            defconfig
arc                          axs103_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8541_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
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
powerpc                      chrp32_defconfig
arm                          simpad_defconfig
m68k                        stmark2_defconfig
arm                      jornada720_defconfig
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
