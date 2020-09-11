Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGdLT-0006Ga-CN
 for ath10k@lists.infradead.org; Fri, 11 Sep 2020 07:19:44 +0000
Date: Fri, 11 Sep 2020 15:19:17 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:pending] BUILD SUCCESS
 cf12d5a47f42aacd99a2a7e339b62bbc70c83bb4
Message-ID: <5f5b24f5.h4DY1oKfp0fFPPZT%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  pending
branch HEAD: cf12d5a47f42aacd99a2a7e339b62bbc70c83bb4  ath10k: Remove unused macro ATH10K_ROC_TIMEOUT_HZ

elapsed time: 723m

configs tested: 166
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                         cm_x300_defconfig
powerpc                       maple_defconfig
openrisc                         alldefconfig
sh                            titan_defconfig
ia64                        generic_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                            lart_defconfig
powerpc                      ppc64e_defconfig
arm                           omap1_defconfig
powerpc                      acadia_defconfig
arm                        trizeps4_defconfig
arm                     davinci_all_defconfig
sh                         apsh4a3a_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
sparc64                             defconfig
arm                           efm32_defconfig
arm                       aspeed_g4_defconfig
mips                         tb0226_defconfig
mips                          ath79_defconfig
arm                      integrator_defconfig
mips                           ip22_defconfig
sh                          sdk7786_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
sh                            shmin_defconfig
mips                        qi_lb60_defconfig
mips                            e55_defconfig
powerpc                     ksi8560_defconfig
ia64                             alldefconfig
sh                          lboxre2_defconfig
mips                        workpad_defconfig
mips                           gcw0_defconfig
sh                          sdk7780_defconfig
openrisc                    or1ksim_defconfig
arm                          imote2_defconfig
xtensa                           allyesconfig
arm                       omap2plus_defconfig
h8300                    h8300h-sim_defconfig
mips                            gpr_defconfig
powerpc                    sam440ep_defconfig
arc                          axs101_defconfig
sh                          rsk7264_defconfig
arc                    vdk_hs38_smp_defconfig
arm                         ebsa110_defconfig
powerpc                    adder875_defconfig
powerpc                     asp8347_defconfig
arm                         s3c2410_defconfig
h8300                     edosk2674_defconfig
powerpc                   bluestone_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            u300_defconfig
xtensa                           alldefconfig
nios2                         3c120_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
ia64                            zx1_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                mpc7448_hpc2_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
arm                         at91_dt_defconfig
mips                       capcella_defconfig
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
mips                      loongson3_defconfig
microblaze                    nommu_defconfig
arc                          axs103_defconfig
mips                         rt305x_defconfig
sh                          kfr2r09_defconfig
sh                          polaris_defconfig
mips                        maltaup_defconfig
arm                           h3600_defconfig
powerpc                     rainier_defconfig
sh                        apsh4ad0a_defconfig
arm                        multi_v5_defconfig
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
powerpc                             defconfig
i386                 randconfig-a004-20200911
i386                 randconfig-a006-20200911
i386                 randconfig-a001-20200911
i386                 randconfig-a003-20200911
i386                 randconfig-a002-20200911
i386                 randconfig-a005-20200911
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
i386                 randconfig-a004-20200910
i386                 randconfig-a006-20200910
i386                 randconfig-a001-20200910
i386                 randconfig-a003-20200910
i386                 randconfig-a002-20200910
i386                 randconfig-a005-20200910
x86_64               randconfig-a014-20200911
x86_64               randconfig-a011-20200911
x86_64               randconfig-a012-20200911
x86_64               randconfig-a016-20200911
x86_64               randconfig-a015-20200911
x86_64               randconfig-a013-20200911
i386                 randconfig-a015-20200911
i386                 randconfig-a014-20200911
i386                 randconfig-a011-20200911
i386                 randconfig-a013-20200911
i386                 randconfig-a016-20200911
i386                 randconfig-a012-20200911
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
x86_64               randconfig-a004-20200911
x86_64               randconfig-a006-20200911
x86_64               randconfig-a003-20200911
x86_64               randconfig-a002-20200911
x86_64               randconfig-a005-20200911
x86_64               randconfig-a001-20200911

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
