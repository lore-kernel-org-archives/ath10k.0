Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG6Wr-0003Im-3L
 for ath10k@lists.infradead.org; Wed, 09 Sep 2020 20:17:18 +0000
Date: Thu, 10 Sep 2020 04:17:08 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 00c578c77ee7571c5d1c3bbee575d71707865f7c
Message-ID: <5f593844.KakEbtEnp545TwW5%lkp@intel.com>
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
branch HEAD: 00c578c77ee7571c5d1c3bbee575d71707865f7c  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 153
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             mxs_defconfig
arm                            zeus_defconfig
powerpc                 linkstation_defconfig
sparc64                             defconfig
h8300                       h8s-sim_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
arm                      footbridge_defconfig
sh                         ecovec24_defconfig
c6x                        evmc6678_defconfig
arm                        vexpress_defconfig
c6x                        evmc6472_defconfig
i386                             allyesconfig
mips                malta_kvm_guest_defconfig
sh                            shmin_defconfig
powerpc                        cell_defconfig
powerpc                     powernv_defconfig
powerpc                      mgcoge_defconfig
arm                        neponset_defconfig
m68k                        stmark2_defconfig
mips                      loongson3_defconfig
arm                          lpd270_defconfig
mips                         cobalt_defconfig
sh                     magicpanelr2_defconfig
arm                       mainstone_defconfig
mips                           mtx1_defconfig
sh                          r7785rp_defconfig
arc                           tb10x_defconfig
arm                        spear3xx_defconfig
arm                           sama5_defconfig
arm                       netwinder_defconfig
microblaze                      mmu_defconfig
sh                           se7721_defconfig
sparc                       sparc64_defconfig
arm                          badge4_defconfig
arm                            dove_defconfig
arm                         lpc18xx_defconfig
mips                           jazz_defconfig
m68k                       m5249evb_defconfig
arm                         assabet_defconfig
arc                          axs101_defconfig
mips                       bmips_be_defconfig
powerpc                     mpc83xx_defconfig
m68k                           sun3_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7757lcr_defconfig
s390                             allyesconfig
arm                        cerfcube_defconfig
sh                             shx3_defconfig
mips                         bigsur_defconfig
s390                                defconfig
m68k                                defconfig
arm                    vt8500_v6_v7_defconfig
arm                  colibri_pxa300_defconfig
xtensa                generic_kc705_defconfig
arm                         s3c2410_defconfig
um                            kunit_defconfig
nios2                         3c120_defconfig
arm                       aspeed_g5_defconfig
mips                           rs90_defconfig
arm                        clps711x_defconfig
arc                        vdk_hs38_defconfig
openrisc                         alldefconfig
sh                         ap325rxa_defconfig
arm                        mvebu_v7_defconfig
arm                       spear13xx_defconfig
openrisc                 simple_smp_defconfig
arm                          collie_defconfig
sh                           se7750_defconfig
arm                         hackkit_defconfig
arm                          gemini_defconfig
sh                         microdev_defconfig
arm                          ixp4xx_defconfig
nds32                               defconfig
arm                      tct_hammer_defconfig
powerpc                           allnoconfig
powerpc                  mpc885_ads_defconfig
mips                           ip28_defconfig
sh                          landisk_defconfig
arc                     haps_hs_smp_defconfig
arm                           tegra_defconfig
sparc                               defconfig
parisc                generic-32bit_defconfig
arm                         s5pv210_defconfig
h8300                               defconfig
sh                           se7206_defconfig
xtensa                    xip_kc705_defconfig
mips                          rb532_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
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
parisc                              defconfig
parisc                           allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20200909
x86_64               randconfig-a006-20200909
x86_64               randconfig-a003-20200909
x86_64               randconfig-a001-20200909
x86_64               randconfig-a005-20200909
x86_64               randconfig-a002-20200909
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
i386                 randconfig-a016-20200909
i386                 randconfig-a015-20200909
i386                 randconfig-a011-20200909
i386                 randconfig-a013-20200909
i386                 randconfig-a014-20200909
i386                 randconfig-a012-20200909
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
x86_64               randconfig-a013-20200909
x86_64               randconfig-a016-20200909
x86_64               randconfig-a011-20200909
x86_64               randconfig-a012-20200909
x86_64               randconfig-a015-20200909
x86_64               randconfig-a014-20200909

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
