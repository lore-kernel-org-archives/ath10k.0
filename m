Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfeaL-0001Ob-CK
 for ath10k@lists.infradead.org; Thu, 19 Nov 2020 07:42:30 +0000
Date: Thu, 19 Nov 2020 15:41:59 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS
 d801e319b3635aeb5a7b517029c63197a500991e
Message-ID: <5fb621c7.xJyQ1HLX/fobkmQO%lkp@intel.com>
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
branch HEAD: d801e319b3635aeb5a7b517029c63197a500991e  ath11k: qmi: print allocated memory segment addresses and sizes

elapsed time: 722m

configs tested: 211
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                         ap325rxa_defconfig
mips                  maltasmvp_eva_defconfig
mips                      pic32mzda_defconfig
powerpc                      bamboo_defconfig
powerpc                     tqm8560_defconfig
nios2                               defconfig
powerpc                    socrates_defconfig
um                           x86_64_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc6xx_defconfig
arm                            mps2_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      arches_defconfig
m68k                          sun3x_defconfig
powerpc                     tqm8555_defconfig
sh                        apsh4ad0a_defconfig
mips                        workpad_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           sunxi_defconfig
powerpc                    adder875_defconfig
sh                ecovec24-romimage_defconfig
m68k                            mac_defconfig
sh                           sh2007_defconfig
powerpc                     akebono_defconfig
powerpc                 linkstation_defconfig
arm                            xcep_defconfig
arc                     nsimosci_hs_defconfig
sh                          polaris_defconfig
arm                       aspeed_g5_defconfig
arm                           stm32_defconfig
powerpc                     sbc8548_defconfig
arm                   milbeaut_m10v_defconfig
arm                         shannon_defconfig
arc                          axs101_defconfig
mips                         db1xxx_defconfig
m68k                          amiga_defconfig
parisc                generic-32bit_defconfig
arm                         mv78xx0_defconfig
arm                            zeus_defconfig
powerpc                      ep88xc_defconfig
arm                           sama5_defconfig
powerpc                      cm5200_defconfig
arm                        realview_defconfig
powerpc                     rainier_defconfig
xtensa                           alldefconfig
powerpc                     stx_gp3_defconfig
sh                           se7206_defconfig
powerpc                   lite5200b_defconfig
powerpc                          g5_defconfig
arm                           omap1_defconfig
arm                       versatile_defconfig
sh                            hp6xx_defconfig
mips                     loongson1c_defconfig
mips                        jmr3927_defconfig
arm                        oxnas_v6_defconfig
arm                         bcm2835_defconfig
powerpc                      pasemi_defconfig
sh                        dreamcast_defconfig
c6x                        evmc6474_defconfig
arm                         hackkit_defconfig
arm                        clps711x_defconfig
xtensa                    xip_kc705_defconfig
mips                malta_qemu_32r6_defconfig
mips                        nlm_xlr_defconfig
sh                           se7712_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         10m50_defconfig
sh                          sdk7786_defconfig
sparc                            alldefconfig
arc                            hsdk_defconfig
ia64                      gensparse_defconfig
riscv                    nommu_k210_defconfig
powerpc                    ge_imp3a_defconfig
m68k                        mvme16x_defconfig
sh                        sh7757lcr_defconfig
sh                        sh7763rdp_defconfig
arm                           u8500_defconfig
arm                         lubbock_defconfig
arm                       multi_v4t_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      pcm030_defconfig
sparc                            allyesconfig
powerpc                      ppc64e_defconfig
mips                      loongson3_defconfig
powerpc                     skiroot_defconfig
sh                         ecovec24_defconfig
sh                           se7722_defconfig
arc                        vdk_hs38_defconfig
sh                          kfr2r09_defconfig
arm                     am200epdkit_defconfig
arm                           efm32_defconfig
arm                           corgi_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         axm55xx_defconfig
powerpc                       ebony_defconfig
sparc                       sparc32_defconfig
mips                         tb0287_defconfig
sh                            titan_defconfig
sparc64                             defconfig
mips                            gpr_defconfig
sh                           se7705_defconfig
arm                         cm_x300_defconfig
sh                          r7780mp_defconfig
arc                              alldefconfig
powerpc                     mpc83xx_defconfig
powerpc                     tqm8540_defconfig
powerpc                   motionpro_defconfig
powerpc                         wii_defconfig
m68k                           sun3_defconfig
powerpc                     kmeter1_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                        spear6xx_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                    h8300h-sim_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20201118
x86_64               randconfig-a003-20201118
x86_64               randconfig-a004-20201118
x86_64               randconfig-a002-20201118
x86_64               randconfig-a006-20201118
x86_64               randconfig-a001-20201118
i386                 randconfig-a006-20201119
i386                 randconfig-a005-20201119
i386                 randconfig-a002-20201119
i386                 randconfig-a001-20201119
i386                 randconfig-a003-20201119
i386                 randconfig-a004-20201119
i386                 randconfig-a006-20201118
i386                 randconfig-a005-20201118
i386                 randconfig-a002-20201118
i386                 randconfig-a001-20201118
i386                 randconfig-a003-20201118
i386                 randconfig-a004-20201118
x86_64               randconfig-a015-20201119
x86_64               randconfig-a014-20201119
x86_64               randconfig-a011-20201119
x86_64               randconfig-a013-20201119
x86_64               randconfig-a016-20201119
x86_64               randconfig-a012-20201119
i386                 randconfig-a012-20201119
i386                 randconfig-a014-20201119
i386                 randconfig-a016-20201119
i386                 randconfig-a011-20201119
i386                 randconfig-a013-20201119
i386                 randconfig-a015-20201119
i386                 randconfig-a012-20201118
i386                 randconfig-a014-20201118
i386                 randconfig-a016-20201118
i386                 randconfig-a011-20201118
i386                 randconfig-a013-20201118
i386                 randconfig-a015-20201118
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
x86_64               randconfig-a005-20201119
x86_64               randconfig-a003-20201119
x86_64               randconfig-a004-20201119
x86_64               randconfig-a002-20201119
x86_64               randconfig-a006-20201119
x86_64               randconfig-a001-20201119
x86_64               randconfig-a015-20201118
x86_64               randconfig-a014-20201118
x86_64               randconfig-a011-20201118
x86_64               randconfig-a013-20201118
x86_64               randconfig-a016-20201118
x86_64               randconfig-a012-20201118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
