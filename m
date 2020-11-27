Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiTe0-0002Kk-W1
 for ath10k@lists.infradead.org; Fri, 27 Nov 2020 02:37:59 +0000
Date: Fri, 27 Nov 2020 10:37:25 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 5d9d3fee1c6b7c65e896ef87a604d7ba6743f490
Message-ID: <5fc06665.Rm8frW8a29KyMlts%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-qca
branch HEAD: 5d9d3fee1c6b7c65e896ef87a604d7ba6743f490  Merge branch 'ath-next' into ath-qca

elapsed time: 722m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7203_defconfig
arm                         lubbock_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc837x_mds_defconfig
arc                          axs101_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
powerpc64                        alldefconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
csky                             alldefconfig
xtensa                          iss_defconfig
arc                     haps_hs_smp_defconfig
arm                        mini2440_defconfig
powerpc                   currituck_defconfig
sh                           se7343_defconfig
powerpc                 canyonlands_defconfig
xtensa                    xip_kc705_defconfig
parisc                generic-32bit_defconfig
arm                        magician_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
arm                      tct_hammer_defconfig
powerpc                     rainier_defconfig
m68k                        mvme147_defconfig
powerpc                      pasemi_defconfig
sh                          sdk7786_defconfig
powerpc                     sequoia_defconfig
arm                         lpc32xx_defconfig
arm                         hackkit_defconfig
sh                          r7780mp_defconfig
m68k                        m5407c3_defconfig
sh                ecovec24-romimage_defconfig
sh                            titan_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      arches_defconfig
x86_64                           alldefconfig
sh                             shx3_defconfig
powerpc                        cell_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          pxa3xx_defconfig
mips                       rbtx49xx_defconfig
powerpc                     tqm8540_defconfig
powerpc                     skiroot_defconfig
arm                        trizeps4_defconfig
arm                         nhk8815_defconfig
powerpc                 mpc8272_ads_defconfig
xtensa                              defconfig
mips                       lemote2f_defconfig
xtensa                  cadence_csp_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
arm                       spear13xx_defconfig
um                            kunit_defconfig
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
powerpc                           allnoconfig
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
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
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
