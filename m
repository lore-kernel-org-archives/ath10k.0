Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIVqJ-0007ck-CZ
 for ath10k@lists.infradead.org; Wed, 16 Sep 2020 11:43:20 +0000
Date: Wed, 16 Sep 2020 19:42:50 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS
 cd12af39345715a38f2e1644b9ac79835c64b472
Message-ID: <5f61fa3a.9gnF8IlruwOiDdRu%lkp@intel.com>
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
branch HEAD: cd12af39345715a38f2e1644b9ac79835c64b472  ath11k: fix AP mode for QCA6390

elapsed time: 1158m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         socfpga_defconfig
sh                          r7785rp_defconfig
s390                             alldefconfig
mips                        nlm_xlp_defconfig
microblaze                    nommu_defconfig
sh                           se7780_defconfig
i386                             alldefconfig
powerpc                     tqm5200_defconfig
m68k                        m5407c3_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
powerpc                      ep88xc_defconfig
arm                              zx_defconfig
h8300                            alldefconfig
microblaze                          defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltasmvp_defconfig
arm                         shannon_defconfig
arm                         ebsa110_defconfig
arm                          gemini_defconfig
arc                           tb10x_defconfig
powerpc                     tqm8560_defconfig
xtensa                    xip_kc705_defconfig
arm                        spear6xx_defconfig
mips                           jazz_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc64e_defconfig
arm                         lpc18xx_defconfig
mips                     loongson1c_defconfig
sh                   secureedge5410_defconfig
mips                  decstation_64_defconfig
powerpc                     pq2fads_defconfig
sh                          rsk7269_defconfig
mips                         db1xxx_defconfig
powerpc                       ppc64_defconfig
mips                          rb532_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
powerpc                       eiger_defconfig
arm                      integrator_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      katmai_defconfig
sh                        apsh4ad0a_defconfig
powerpc                         wii_defconfig
arm                          exynos_defconfig
ia64                         bigsur_defconfig
powerpc                      chrp32_defconfig
sh                          landisk_defconfig
mips                            ar7_defconfig
mips                        jmr3927_defconfig
mips                       lemote2f_defconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200916
x86_64               randconfig-a004-20200916
x86_64               randconfig-a003-20200916
x86_64               randconfig-a002-20200916
x86_64               randconfig-a001-20200916
x86_64               randconfig-a005-20200916
i386                 randconfig-a004-20200916
i386                 randconfig-a006-20200916
i386                 randconfig-a003-20200916
i386                 randconfig-a001-20200916
i386                 randconfig-a002-20200916
i386                 randconfig-a005-20200916
i386                 randconfig-a015-20200916
i386                 randconfig-a014-20200916
i386                 randconfig-a011-20200916
i386                 randconfig-a013-20200916
i386                 randconfig-a016-20200916
i386                 randconfig-a012-20200916
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

clang tested configs:
x86_64               randconfig-a014-20200916
x86_64               randconfig-a011-20200916
x86_64               randconfig-a016-20200916
x86_64               randconfig-a012-20200916
x86_64               randconfig-a015-20200916
x86_64               randconfig-a013-20200916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
