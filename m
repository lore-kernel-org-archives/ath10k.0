Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNPkx-0002FE-F6
 for ath10k@lists.infradead.org; Wed, 30 Sep 2020 00:14:04 +0000
Date: Wed, 30 Sep 2020 08:13:06 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 82b4f9b857e7ac38d26f853a28ca719fdc415cbe
Message-ID: <5f73cd92.sg65loCEBmFMgaIn%lkp@intel.com>
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
branch HEAD: 82b4f9b857e7ac38d26f853a28ca719fdc415cbe  ath11k: Move non-fatal warn logs to dbg level

elapsed time: 724m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
arc                      axs103_smp_defconfig
arc                         haps_hs_defconfig
arm                         orion5x_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                        m5407c3_defconfig
mips                         db1xxx_defconfig
powerpc                      cm5200_defconfig
arm                        keystone_defconfig
arm                        multi_v5_defconfig
mips                         tb0219_defconfig
mips                         bigsur_defconfig
arc                             nps_defconfig
h8300                            alldefconfig
sh                            hp6xx_defconfig
ia64                        generic_defconfig
mips                       rbtx49xx_defconfig
powerpc                      pmac32_defconfig
powerpc64                        alldefconfig
sh                        sh7785lcr_defconfig
powerpc                     tqm8541_defconfig
csky                                defconfig
arm                         vf610m4_defconfig
xtensa                         virt_defconfig
powerpc                   bluestone_defconfig
arm                         s5pv210_defconfig
m68k                        mvme147_defconfig
arm                            zeus_defconfig
arm                     davinci_all_defconfig
openrisc                            defconfig
arc                          axs103_defconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
powerpc                 mpc832x_mds_defconfig
arm                       spear13xx_defconfig
powerpc                     kmeter1_defconfig
xtensa                           allyesconfig
mips                          rm200_defconfig
m68k                       m5249evb_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        maltaup_defconfig
arm                       versatile_defconfig
powerpc                  mpc885_ads_defconfig
arm                             pxa_defconfig
sh                           se7722_defconfig
riscv                    nommu_virt_defconfig
mips                      loongson3_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc8560_ads_defconfig
mips                      pistachio_defconfig
s390                                defconfig
powerpc                 mpc837x_rdb_defconfig
s390                       zfcpdump_defconfig
powerpc                      ep88xc_defconfig
sh                         apsh4a3a_defconfig
s390                             allyesconfig
arm                            u300_defconfig
sh                           se7206_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8560_defconfig
microblaze                    nommu_defconfig
arc                            hsdk_defconfig
powerpc                       eiger_defconfig
arc                        vdk_hs38_defconfig
arm                      pxa255-idp_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          simpad_defconfig
sh                        edosk7705_defconfig
c6x                        evmc6457_defconfig
arm                      tct_hammer_defconfig
arm                         s3c6400_defconfig
arm                           sama5_defconfig
powerpc                    mvme5100_defconfig
powerpc                        fsp2_defconfig
sh                   sh7770_generic_defconfig
arm                           h5000_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                       multi_v4t_defconfig
sh                             shx3_defconfig
microblaze                          defconfig
mips                   sb1250_swarm_defconfig
arm                          ep93xx_defconfig
sh                           se7780_defconfig
parisc                           alldefconfig
arm                             mxs_defconfig
mips                            gpr_defconfig
ia64                            zx1_defconfig
c6x                        evmc6474_defconfig
arm                        spear3xx_defconfig
mips                       capcella_defconfig
c6x                                 defconfig
um                             i386_defconfig
mips                        jmr3927_defconfig
arm                      integrator_defconfig
um                           x86_64_defconfig
arm                        multi_v7_defconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
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
i386                 randconfig-a006-20200929
i386                 randconfig-a002-20200929
i386                 randconfig-a003-20200929
i386                 randconfig-a004-20200929
i386                 randconfig-a005-20200929
i386                 randconfig-a001-20200929
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
