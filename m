Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8CI0-0006VG-Ko
 for ath10k@lists.infradead.org; Wed, 19 Aug 2020 00:49:17 +0000
Date: Wed, 19 Aug 2020 08:48:59 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:pending-deferred] BUILD SUCCESS
 28716dadf518cba275f342fb34335f10c8d33684
Message-ID: <5f3c76fb./m5s5Kr9kG9Cpi8N%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  pending-deferred
branch HEAD: 28716dadf518cba275f342fb34335f10c8d33684  ath10k: change to do napi_enable and napi_disable when insmod and rmmod for sdio

elapsed time: 4244m

configs tested: 195
configs skipped: 23

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
powerpc                     pq2fads_defconfig
sh                        edosk7705_defconfig
sh                           se7705_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
arm                         lpc32xx_defconfig
sh                        apsh4ad0a_defconfig
arm                            hisi_defconfig
ia64                             allyesconfig
riscv                    nommu_k210_defconfig
powerpc                       holly_defconfig
arm                          collie_defconfig
m68k                        stmark2_defconfig
powerpc                         ps3_defconfig
h8300                     edosk2674_defconfig
sh                          urquell_defconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
csky                                defconfig
sh                        edosk7760_defconfig
sh                           se7712_defconfig
arm                         s5pv210_defconfig
arm                        mvebu_v7_defconfig
um                           x86_64_defconfig
sh                           se7724_defconfig
sh                               allmodconfig
mips                           rs90_defconfig
powerpc                      ppc64e_defconfig
sh                         ecovec24_defconfig
sh                          r7780mp_defconfig
arm                           omap1_defconfig
powerpc                    gamecube_defconfig
m68k                          amiga_defconfig
ia64                             alldefconfig
arm                         ebsa110_defconfig
sparc                               defconfig
m68k                       m5275evb_defconfig
ia64                      gensparse_defconfig
powerpc                    adder875_defconfig
nds32                             allnoconfig
mips                          rb532_defconfig
powerpc                     mpc83xx_defconfig
mips                      malta_kvm_defconfig
sparc                            alldefconfig
mips                       capcella_defconfig
powerpc                      ppc6xx_defconfig
arm                             mxs_defconfig
mips                        omega2p_defconfig
mips                       rbtx49xx_defconfig
mips                         cobalt_defconfig
mips                malta_kvm_guest_defconfig
arm                          pcm027_defconfig
ia64                            zx1_defconfig
mips                         mpc30x_defconfig
alpha                               defconfig
arm                           tegra_defconfig
arm                         s3c2410_defconfig
m68k                          hp300_defconfig
arm                        clps711x_defconfig
mips                      pic32mzda_defconfig
mips                      maltasmvp_defconfig
arm                           sunxi_defconfig
riscv                    nommu_virt_defconfig
powerpc                      pmac32_defconfig
arm                      footbridge_defconfig
mips                        nlm_xlr_defconfig
microblaze                      mmu_defconfig
arm                        oxnas_v6_defconfig
arm                       aspeed_g4_defconfig
mips                          ath79_defconfig
nios2                               defconfig
arm                        spear6xx_defconfig
arc                         haps_hs_defconfig
sh                        dreamcast_defconfig
sh                               j2_defconfig
sh                             espt_defconfig
h8300                    h8300h-sim_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
arm                           spitz_defconfig
powerpc                        cell_defconfig
powerpc                      ppc44x_defconfig
powerpc                     powernv_defconfig
arm                           h3600_defconfig
mips                          rm200_defconfig
arc                        nsimosci_defconfig
m68k                       m5208evb_defconfig
arm                   milbeaut_m10v_defconfig
c6x                        evmc6472_defconfig
sh                           sh2007_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200817
x86_64               randconfig-a001-20200817
x86_64               randconfig-a005-20200817
x86_64               randconfig-a003-20200817
x86_64               randconfig-a002-20200817
x86_64               randconfig-a004-20200817
i386                 randconfig-a005-20200816
i386                 randconfig-a001-20200816
i386                 randconfig-a002-20200816
i386                 randconfig-a003-20200816
i386                 randconfig-a006-20200816
i386                 randconfig-a004-20200816
i386                 randconfig-a005-20200817
i386                 randconfig-a001-20200817
i386                 randconfig-a002-20200817
i386                 randconfig-a003-20200817
i386                 randconfig-a006-20200817
i386                 randconfig-a004-20200817
i386                 randconfig-a005-20200818
i386                 randconfig-a002-20200818
i386                 randconfig-a001-20200818
i386                 randconfig-a006-20200818
i386                 randconfig-a003-20200818
i386                 randconfig-a004-20200818
x86_64               randconfig-a013-20200818
x86_64               randconfig-a016-20200818
x86_64               randconfig-a012-20200818
x86_64               randconfig-a011-20200818
x86_64               randconfig-a014-20200818
x86_64               randconfig-a015-20200818
x86_64               randconfig-a013-20200816
x86_64               randconfig-a012-20200816
x86_64               randconfig-a016-20200816
x86_64               randconfig-a011-20200816
x86_64               randconfig-a014-20200816
x86_64               randconfig-a015-20200816
i386                 randconfig-a016-20200817
i386                 randconfig-a011-20200817
i386                 randconfig-a013-20200817
i386                 randconfig-a015-20200817
i386                 randconfig-a014-20200817
i386                 randconfig-a012-20200817
i386                 randconfig-a016-20200816
i386                 randconfig-a011-20200816
i386                 randconfig-a013-20200816
i386                 randconfig-a015-20200816
i386                 randconfig-a014-20200816
i386                 randconfig-a012-20200816
i386                 randconfig-a016-20200818
i386                 randconfig-a011-20200818
i386                 randconfig-a015-20200818
i386                 randconfig-a013-20200818
i386                 randconfig-a012-20200818
i386                 randconfig-a014-20200818
x86_64               randconfig-a006-20200819
x86_64               randconfig-a001-20200819
x86_64               randconfig-a003-20200819
x86_64               randconfig-a005-20200819
x86_64               randconfig-a004-20200819
x86_64               randconfig-a002-20200819
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
