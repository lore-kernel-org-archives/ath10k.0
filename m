Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXzNg-0003UU-3a
 for ath10k@lists.infradead.org; Thu, 29 Oct 2020 04:17:45 +0000
Date: Thu, 29 Oct 2020 12:17:22 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 16f283f0a4bbc4cc84be574882706fa0d244186e
Message-ID: <5f9a4252.RcmWEYWRz/fXLZcF%lkp@intel.com>
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
branch HEAD: 16f283f0a4bbc4cc84be574882706fa0d244186e  ath11k: remove repeated words in comments and warnings

elapsed time: 722m

configs tested: 192
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                        m5307c3_defconfig
c6x                                 defconfig
s390                             allyesconfig
arm                          prima2_defconfig
ia64                          tiger_defconfig
openrisc                         alldefconfig
powerpc                 mpc8272_ads_defconfig
mips                        maltaup_defconfig
sh                           se7721_defconfig
arc                          axs103_defconfig
powerpc                    socrates_defconfig
powerpc64                           defconfig
arm                         nhk8815_defconfig
arm                          pxa3xx_defconfig
ia64                                defconfig
ia64                        generic_defconfig
mips                          malta_defconfig
sh                          lboxre2_defconfig
mips                           gcw0_defconfig
powerpc                       ebony_defconfig
sh                   sh7770_generic_defconfig
c6x                              allyesconfig
arm                          simpad_defconfig
arm                        mvebu_v5_defconfig
m68k                         amcore_defconfig
arm                        mvebu_v7_defconfig
mips                       lemote2f_defconfig
alpha                            alldefconfig
sh                          r7780mp_defconfig
arm                            lart_defconfig
mips                      bmips_stb_defconfig
arm                        magician_defconfig
m68k                        mvme147_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                              zx_defconfig
c6x                         dsk6455_defconfig
parisc                generic-32bit_defconfig
powerpc                    gamecube_defconfig
arm                      integrator_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5249evb_defconfig
arm                           tegra_defconfig
powerpc                 mpc834x_mds_defconfig
arm                     davinci_all_defconfig
mips                     loongson1b_defconfig
mips                             allyesconfig
sh                           se7343_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      bamboo_defconfig
arm                      pxa255-idp_defconfig
xtensa                           alldefconfig
powerpc                     tqm8560_defconfig
sh                             sh03_defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
sh                        dreamcast_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
sh                ecovec24-romimage_defconfig
riscv                            alldefconfig
powerpc                     asp8347_defconfig
powerpc                     mpc512x_defconfig
mips                       capcella_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     akebono_defconfig
powerpc                      pcm030_defconfig
arm                             ezx_defconfig
powerpc64                        alldefconfig
powerpc                  iss476-smp_defconfig
arm                          imote2_defconfig
arm                         s5pv210_defconfig
arm                          tango4_defconfig
arm                          badge4_defconfig
powerpc                     tqm8540_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                malta_qemu_32r6_defconfig
sh                             espt_defconfig
arm                          ixp4xx_defconfig
um                            kunit_defconfig
m68k                          multi_defconfig
nds32                            alldefconfig
um                           x86_64_defconfig
arm                      tct_hammer_defconfig
mips                       bmips_be_defconfig
arm                           viper_defconfig
powerpc                    sam440ep_defconfig
sh                          urquell_defconfig
powerpc                      walnut_defconfig
sh                          sdk7780_defconfig
powerpc                     pseries_defconfig
sh                              ul2_defconfig
arm                            zeus_defconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
ia64                      gensparse_defconfig
arm                          pxa168_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                 randconfig-a002-20201029
i386                 randconfig-a005-20201029
i386                 randconfig-a003-20201029
i386                 randconfig-a001-20201029
i386                 randconfig-a004-20201029
i386                 randconfig-a006-20201029
i386                 randconfig-a002-20201028
i386                 randconfig-a005-20201028
i386                 randconfig-a003-20201028
i386                 randconfig-a001-20201028
i386                 randconfig-a004-20201028
i386                 randconfig-a006-20201028
x86_64               randconfig-a011-20201028
x86_64               randconfig-a013-20201028
x86_64               randconfig-a016-20201028
x86_64               randconfig-a015-20201028
x86_64               randconfig-a012-20201028
x86_64               randconfig-a014-20201028
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201028
i386                 randconfig-a014-20201028
i386                 randconfig-a015-20201028
i386                 randconfig-a013-20201028
i386                 randconfig-a012-20201028
i386                 randconfig-a011-20201028
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
x86_64               randconfig-a001-20201028
x86_64               randconfig-a002-20201028
x86_64               randconfig-a003-20201028
x86_64               randconfig-a006-20201028
x86_64               randconfig-a005-20201028
x86_64               randconfig-a004-20201028
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
