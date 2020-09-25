Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLvzx-0000zg-Oz
 for ath10k@lists.infradead.org; Fri, 25 Sep 2020 22:15:27 +0000
Date: Sat, 26 Sep 2020 06:15:03 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS
 8ed948219a2ee1806859f500cdad4fa175bc593c
Message-ID: <5f6e6be7.kMwuMMzN8oDUQ4km%lkp@intel.com>
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
branch HEAD: 8ed948219a2ee1806859f500cdad4fa175bc593c  ath11k: enable idle power save mode

elapsed time: 723m

configs tested: 159
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                        mvme16x_defconfig
powerpc                       holly_defconfig
arc                      axs103_smp_defconfig
arc                            hsdk_defconfig
arm                        multi_v5_defconfig
arm                          ixp4xx_defconfig
mips                      maltaaprp_defconfig
sh                           se7722_defconfig
powerpc                     tqm8548_defconfig
mips                  decstation_64_defconfig
arm                      integrator_defconfig
arm                          imote2_defconfig
powerpc                  mpc885_ads_defconfig
i386                                defconfig
sh                   rts7751r2dplus_defconfig
mips                           ci20_defconfig
arm                        clps711x_defconfig
powerpc                      ppc64e_defconfig
xtensa                  audio_kc705_defconfig
h8300                            alldefconfig
arm                        trizeps4_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          rsk7264_defconfig
sh                          sdk7786_defconfig
mips                    maltaup_xpa_defconfig
arm                         lpc32xx_defconfig
powerpc                   bluestone_defconfig
arc                     haps_hs_smp_defconfig
sh                          r7785rp_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
sh                      rts7751r2d1_defconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
arm                         at91_dt_defconfig
m68k                        m5307c3_defconfig
mips                      bmips_stb_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
powerpc                        icon_defconfig
mips                         tb0287_defconfig
mips                         db1xxx_defconfig
arm                            dove_defconfig
sh                           se7751_defconfig
mips                       capcella_defconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                         virt_defconfig
sh                                  defconfig
sh                           se7724_defconfig
arm                            hisi_defconfig
ia64                                defconfig
mips                        jmr3927_defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g4_defconfig
powerpc                     ksi8560_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
arm                     davinci_all_defconfig
arm                         hackkit_defconfig
ia64                          tiger_defconfig
ia64                            zx1_defconfig
powerpc                        cell_defconfig
arc                          axs103_defconfig
arm                            qcom_defconfig
mips                  maltasmvp_eva_defconfig
arm                            xcep_defconfig
powerpc                  storcenter_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
arm                        mini2440_defconfig
arm                         assabet_defconfig
arc                              alldefconfig
arm                      tct_hammer_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
mips                          ath79_defconfig
mips                           mtx1_defconfig
m68k                          atari_defconfig
sh                             shx3_defconfig
mips                      maltasmvp_defconfig
mips                           ip22_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
arc                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200925
i386                 randconfig-a006-20200925
i386                 randconfig-a003-20200925
i386                 randconfig-a004-20200925
i386                 randconfig-a005-20200925
i386                 randconfig-a001-20200925
x86_64               randconfig-a011-20200925
x86_64               randconfig-a013-20200925
x86_64               randconfig-a014-20200925
x86_64               randconfig-a015-20200925
x86_64               randconfig-a012-20200925
x86_64               randconfig-a016-20200925
i386                 randconfig-a012-20200925
i386                 randconfig-a014-20200925
i386                 randconfig-a016-20200925
i386                 randconfig-a013-20200925
i386                 randconfig-a011-20200925
i386                 randconfig-a015-20200925
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
x86_64               randconfig-a005-20200925
x86_64               randconfig-a003-20200925
x86_64               randconfig-a004-20200925
x86_64               randconfig-a002-20200925
x86_64               randconfig-a006-20200925
x86_64               randconfig-a001-20200925

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
