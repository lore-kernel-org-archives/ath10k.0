Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXcyS-0003cB-MA
 for ath10k@lists.infradead.org; Wed, 28 Oct 2020 04:22:13 +0000
Date: Wed, 28 Oct 2020 12:21:45 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 0f680cf7d40b2049ee12e0d58fd53b315be94eeb
Message-ID: <5f98f1d9.Q9LD2M3Bw98NTxLQ%lkp@intel.com>
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
branch HEAD: 0f680cf7d40b2049ee12e0d58fd53b315be94eeb  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 194
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
arm                  colibri_pxa300_defconfig
arm                          pxa3xx_defconfig
powerpc                    mvme5100_defconfig
arm                            mps2_defconfig
riscv                    nommu_virt_defconfig
powerpc                     tqm8541_defconfig
parisc                           alldefconfig
arm                        spear6xx_defconfig
sh                            titan_defconfig
powerpc                      chrp32_defconfig
mips                      fuloong2e_defconfig
arc                 nsimosci_hs_smp_defconfig
arc                      axs103_smp_defconfig
arm                       cns3420vb_defconfig
arc                              alldefconfig
arm                            dove_defconfig
c6x                                 defconfig
powerpc                     asp8347_defconfig
c6x                        evmc6474_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
mips                      malta_kvm_defconfig
mips                      bmips_stb_defconfig
arc                     haps_hs_smp_defconfig
arm                      pxa255-idp_defconfig
arm                        neponset_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
arm                     am200epdkit_defconfig
arm                          lpd270_defconfig
powerpc                      bamboo_defconfig
powerpc                     kmeter1_defconfig
powerpc                  iss476-smp_defconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
sh                          r7785rp_defconfig
c6x                         dsk6455_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                       ppc64_defconfig
h8300                            allyesconfig
mips                     cu1000-neo_defconfig
mips                     loongson1c_defconfig
powerpc                         wii_defconfig
arm                           h5000_defconfig
arm                        shmobile_defconfig
x86_64                           alldefconfig
sparc                       sparc32_defconfig
arm                        multi_v5_defconfig
sh                         ecovec24_defconfig
sh                           se7750_defconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
mips                    maltaup_xpa_defconfig
sh                           se7206_defconfig
arm                          prima2_defconfig
m68k                       m5249evb_defconfig
mips                          rb532_defconfig
sh                           se7343_defconfig
sh                         ap325rxa_defconfig
mips                           jazz_defconfig
arm                            hisi_defconfig
mips                          ath25_defconfig
powerpc                    klondike_defconfig
powerpc                   lite5200b_defconfig
parisc                generic-64bit_defconfig
arm                       netwinder_defconfig
sparc64                          alldefconfig
mips                       bmips_be_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          r7780mp_defconfig
mips                            ar7_defconfig
mips                           ip22_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
xtensa                    smp_lx200_defconfig
arm                          exynos_defconfig
xtensa                           allyesconfig
sh                          rsk7264_defconfig
arm                         vf610m4_defconfig
nds32                             allnoconfig
m68k                             alldefconfig
sh                           se7712_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                           ip28_defconfig
arm                           spitz_defconfig
mips                             allyesconfig
arm                        realview_defconfig
powerpc                     skiroot_defconfig
arm                          collie_defconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
i386                 randconfig-a002-20201027
i386                 randconfig-a003-20201027
i386                 randconfig-a005-20201027
i386                 randconfig-a001-20201027
i386                 randconfig-a006-20201027
i386                 randconfig-a004-20201027
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201026
i386                 randconfig-a015-20201026
i386                 randconfig-a014-20201026
i386                 randconfig-a012-20201026
i386                 randconfig-a013-20201026
i386                 randconfig-a011-20201026
i386                 randconfig-a016-20201027
i386                 randconfig-a015-20201027
i386                 randconfig-a014-20201027
i386                 randconfig-a012-20201027
i386                 randconfig-a013-20201027
i386                 randconfig-a011-20201027
x86_64               randconfig-a001-20201027
x86_64               randconfig-a003-20201027
x86_64               randconfig-a002-20201027
x86_64               randconfig-a006-20201027
x86_64               randconfig-a004-20201027
x86_64               randconfig-a005-20201027
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026
x86_64               randconfig-a011-20201027
x86_64               randconfig-a013-20201027
x86_64               randconfig-a016-20201027
x86_64               randconfig-a015-20201027
x86_64               randconfig-a012-20201027
x86_64               randconfig-a014-20201027

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
