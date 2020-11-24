Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khTv8-0005Rc-BZ
 for ath10k@lists.infradead.org; Tue, 24 Nov 2020 08:43:31 +0000
Date: Tue, 24 Nov 2020 16:43:10 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 11af6de4799ee6eeae3730f18fd417414d212e2d
Message-ID: <5fbcc79e.1XRmxvCWFJk0Ouwi%lkp@intel.com>
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
branch HEAD: 11af6de4799ee6eeae3730f18fd417414d212e2d  ath11k: Fix the rx_filter flag setting for peer rssi stats

elapsed time: 721m

configs tested: 197
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                          axs101_defconfig
c6x                        evmc6678_defconfig
mips                          malta_defconfig
parisc                           alldefconfig
sh                          kfr2r09_defconfig
m68k                       m5208evb_defconfig
powerpc                     asp8347_defconfig
arm                           viper_defconfig
mips                         cobalt_defconfig
arc                              allyesconfig
sh                         microdev_defconfig
c6x                         dsk6455_defconfig
powerpc                     tqm8560_defconfig
sh                   rts7751r2dplus_defconfig
arm                        keystone_defconfig
mips                           ip32_defconfig
arm                            u300_defconfig
mips                         bigsur_defconfig
mips                           jazz_defconfig
powerpc                      pmac32_defconfig
mips                       lemote2f_defconfig
mips                      maltasmvp_defconfig
powerpc                      ppc44x_defconfig
powerpc                      tqm8xx_defconfig
m68k                        mvme16x_defconfig
powerpc                  storcenter_defconfig
powerpc                      acadia_defconfig
powerpc                     mpc512x_defconfig
mips                        vocore2_defconfig
mips                     loongson1b_defconfig
arm                           sama5_defconfig
arc                            hsdk_defconfig
mips                       rbtx49xx_defconfig
m68k                        m5272c3_defconfig
m68k                        m5307c3_defconfig
mips                     cu1000-neo_defconfig
sh                             espt_defconfig
mips                          ath79_defconfig
mips                      bmips_stb_defconfig
m68k                         amcore_defconfig
powerpc                     tqm8540_defconfig
powerpc                     akebono_defconfig
sh                             shx3_defconfig
sparc                               defconfig
sh                           se7750_defconfig
arm                       imx_v6_v7_defconfig
sh                          sdk7786_defconfig
sh                            titan_defconfig
xtensa                       common_defconfig
m68k                        stmark2_defconfig
mips                  cavium_octeon_defconfig
sh                          landisk_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc8272_ads_defconfig
sh                        edosk7760_defconfig
mips                        workpad_defconfig
m68k                       m5475evb_defconfig
arm                             ezx_defconfig
powerpc                       eiger_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                        m5407c3_defconfig
arm                            lart_defconfig
m68k                          amiga_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc40x_defconfig
powerpc                      makalu_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                         nhk8815_defconfig
arm                        clps711x_defconfig
mips                           ip27_defconfig
arm                              zx_defconfig
sh                           se7712_defconfig
arm                       mainstone_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                           h5000_defconfig
arm                        oxnas_v6_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                           omap1_defconfig
arm                          pxa168_defconfig
powerpc                     ksi8560_defconfig
mips                         rt305x_defconfig
arc                      axs103_smp_defconfig
powerpc                      arches_defconfig
powerpc                      ppc64e_defconfig
arm                          collie_defconfig
arm                           corgi_defconfig
powerpc                       ppc64_defconfig
powerpc                     taishan_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    sam440ep_defconfig
xtensa                         virt_defconfig
mips                         tb0226_defconfig
sh                         ecovec24_defconfig
xtensa                    xip_kc705_defconfig
mips                            ar7_defconfig
arm                     am200epdkit_defconfig
arm                         orion5x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20201124
x86_64               randconfig-a003-20201124
x86_64               randconfig-a004-20201124
x86_64               randconfig-a005-20201124
x86_64               randconfig-a001-20201124
x86_64               randconfig-a002-20201124
i386                 randconfig-a004-20201123
i386                 randconfig-a003-20201123
i386                 randconfig-a002-20201123
i386                 randconfig-a005-20201123
i386                 randconfig-a001-20201123
i386                 randconfig-a006-20201123
i386                 randconfig-a004-20201124
i386                 randconfig-a003-20201124
i386                 randconfig-a002-20201124
i386                 randconfig-a005-20201124
i386                 randconfig-a001-20201124
i386                 randconfig-a006-20201124
x86_64               randconfig-a015-20201123
x86_64               randconfig-a011-20201123
x86_64               randconfig-a014-20201123
x86_64               randconfig-a016-20201123
x86_64               randconfig-a012-20201123
x86_64               randconfig-a013-20201123
i386                 randconfig-a012-20201123
i386                 randconfig-a013-20201123
i386                 randconfig-a011-20201123
i386                 randconfig-a016-20201123
i386                 randconfig-a014-20201123
i386                 randconfig-a015-20201123
i386                 randconfig-a012-20201124
i386                 randconfig-a013-20201124
i386                 randconfig-a011-20201124
i386                 randconfig-a016-20201124
i386                 randconfig-a014-20201124
i386                 randconfig-a015-20201124
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
x86_64               randconfig-a006-20201123
x86_64               randconfig-a003-20201123
x86_64               randconfig-a004-20201123
x86_64               randconfig-a005-20201123
x86_64               randconfig-a002-20201123
x86_64               randconfig-a001-20201123
x86_64               randconfig-a015-20201124
x86_64               randconfig-a011-20201124
x86_64               randconfig-a014-20201124
x86_64               randconfig-a016-20201124
x86_64               randconfig-a012-20201124
x86_64               randconfig-a013-20201124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
