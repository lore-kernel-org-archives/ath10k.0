Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6No1-0008BT-4c
 for ath10k@lists.infradead.org; Fri, 14 Aug 2020 00:42:50 +0000
Date: Fri, 14 Aug 2020 08:41:46 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 f0d798d8db833956b7fc80c08b303c221e68c72d
Message-ID: <5f35ddca.DtjCk1553zM15CBD%lkp@intel.com>
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
branch HEAD: f0d798d8db833956b7fc80c08b303c221e68c72d  Merge branch 'pending' into master-pending

elapsed time: 721m

configs tested: 153
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        edosk7760_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
m68k                       m5275evb_defconfig
arm                        vexpress_defconfig
arm                            xcep_defconfig
mips                          ath25_defconfig
sh                           se7619_defconfig
powerpc                        cell_defconfig
m68k                          multi_defconfig
m68k                          atari_defconfig
openrisc                            defconfig
sh                        sh7763rdp_defconfig
arm                      pxa255-idp_defconfig
sh                           se7750_defconfig
m68k                         apollo_defconfig
mips                        maltaup_defconfig
powerpc                     pseries_defconfig
arc                          axs103_defconfig
h8300                     edosk2674_defconfig
sh                         ap325rxa_defconfig
arm                            pleb_defconfig
sh                           se7780_defconfig
xtensa                    xip_kc705_defconfig
csky                             alldefconfig
m68k                       bvme6000_defconfig
arm                            lart_defconfig
sh                            migor_defconfig
sh                        sh7785lcr_defconfig
powerpc64                           defconfig
sh                          sdk7780_defconfig
sh                          sdk7786_defconfig
powerpc                          g5_defconfig
microblaze                      mmu_defconfig
mips                        vocore2_defconfig
mips                malta_kvm_guest_defconfig
sh                           se7722_defconfig
powerpc                             defconfig
mips                      malta_kvm_defconfig
mips                         mpc30x_defconfig
arm                          ixp4xx_defconfig
sh                          landisk_defconfig
sh                          urquell_defconfig
mips                      pic32mzda_defconfig
arm                           viper_defconfig
arm                     davinci_all_defconfig
arm                          simpad_defconfig
arc                             nps_defconfig
arm                     am200epdkit_defconfig
arm                          collie_defconfig
arm                     eseries_pxa_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            hisi_defconfig
xtensa                          iss_defconfig
mips                     decstation_defconfig
sh                             sh03_defconfig
powerpc                     mpc512x_defconfig
sh                          lboxre2_defconfig
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
x86_64               randconfig-a006-20200811
x86_64               randconfig-a001-20200811
x86_64               randconfig-a003-20200811
x86_64               randconfig-a005-20200811
x86_64               randconfig-a004-20200811
x86_64               randconfig-a002-20200811
x86_64               randconfig-a006-20200813
x86_64               randconfig-a001-20200813
x86_64               randconfig-a005-20200813
x86_64               randconfig-a003-20200813
x86_64               randconfig-a004-20200813
x86_64               randconfig-a002-20200813
i386                 randconfig-a005-20200813
i386                 randconfig-a001-20200813
i386                 randconfig-a002-20200813
i386                 randconfig-a003-20200813
i386                 randconfig-a006-20200813
i386                 randconfig-a004-20200813
i386                 randconfig-a005-20200812
i386                 randconfig-a001-20200812
i386                 randconfig-a002-20200812
i386                 randconfig-a003-20200812
i386                 randconfig-a006-20200812
i386                 randconfig-a004-20200812
i386                 randconfig-a005-20200811
i386                 randconfig-a001-20200811
i386                 randconfig-a002-20200811
i386                 randconfig-a003-20200811
i386                 randconfig-a006-20200811
i386                 randconfig-a004-20200811
i386                 randconfig-a016-20200812
i386                 randconfig-a011-20200812
i386                 randconfig-a013-20200812
i386                 randconfig-a015-20200812
i386                 randconfig-a012-20200812
i386                 randconfig-a014-20200812
i386                 randconfig-a016-20200811
i386                 randconfig-a011-20200811
i386                 randconfig-a015-20200811
i386                 randconfig-a013-20200811
i386                 randconfig-a012-20200811
i386                 randconfig-a014-20200811
i386                 randconfig-a016-20200813
i386                 randconfig-a011-20200813
i386                 randconfig-a013-20200813
i386                 randconfig-a015-20200813
i386                 randconfig-a012-20200813
i386                 randconfig-a014-20200813
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
