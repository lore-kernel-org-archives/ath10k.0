Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBBO4-0006TP-DA
 for ath10k@lists.infradead.org; Thu, 27 Aug 2020 06:27:54 +0000
Date: Thu, 27 Aug 2020 14:26:55 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 4bb371f85f44d35fe5bdc17e2832a2b4ee4d5465
Message-ID: <5f47522f.omtct2ZrLKb6vScO%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-qca
branch HEAD: 4bb371f85f44d35fe5bdc17e2832a2b4ee4d5465  Merge branch 'ath-next' into ath-qca

elapsed time: 723m

configs tested: 129
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                        workpad_defconfig
mips                        maltaup_defconfig
sh                   rts7751r2dplus_defconfig
arm                        oxnas_v6_defconfig
sh                        edosk7705_defconfig
m68k                            q40_defconfig
arm                              zx_defconfig
mips                        jmr3927_defconfig
sh                        sh7757lcr_defconfig
c6x                        evmc6457_defconfig
c6x                              alldefconfig
mips                      malta_kvm_defconfig
mips                           jazz_defconfig
arm                        multi_v5_defconfig
riscv                            allmodconfig
m68k                         apollo_defconfig
sh                ecovec24-romimage_defconfig
sh                        apsh4ad0a_defconfig
arm                       spear13xx_defconfig
arm                        trizeps4_defconfig
arc                                 defconfig
m68k                       m5249evb_defconfig
arm                         palmz72_defconfig
m68k                          multi_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
sh                           se7722_defconfig
sh                   sh7770_generic_defconfig
mips                         tb0226_defconfig
powerpc                     skiroot_defconfig
mips                malta_kvm_guest_defconfig
sh                          sdk7780_defconfig
sh                         apsh4a3a_defconfig
mips                           mtx1_defconfig
powerpc                          alldefconfig
arm                         lpc18xx_defconfig
sh                          urquell_defconfig
mips                         bigsur_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
arm                            zeus_defconfig
powerpc                 mpc8272_ads_defconfig
arm                          ixp4xx_defconfig
openrisc                    or1ksim_defconfig
arc                          axs103_defconfig
m68k                             allmodconfig
mips                             allyesconfig
powerpc                         wii_defconfig
alpha                               defconfig
m68k                        stmark2_defconfig
sh                                  defconfig
arc                    vdk_hs38_smp_defconfig
arc                             nps_defconfig
arm                  colibri_pxa270_defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                          iss_defconfig
mips                        bcm47xx_defconfig
sh                            shmin_defconfig
sh                     sh7710voipgw_defconfig
mips                  cavium_octeon_defconfig
nios2                         10m50_defconfig
arm                            mmp2_defconfig
m68k                       m5275evb_defconfig
m68k                           sun3_defconfig
sh                          sdk7786_defconfig
mips                       rbtx49xx_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         orion5x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
powerpc                             defconfig
i386                 randconfig-a002-20200826
i386                 randconfig-a004-20200826
i386                 randconfig-a003-20200826
i386                 randconfig-a005-20200826
i386                 randconfig-a006-20200826
i386                 randconfig-a001-20200826
x86_64               randconfig-a015-20200826
x86_64               randconfig-a016-20200826
x86_64               randconfig-a012-20200826
x86_64               randconfig-a014-20200826
x86_64               randconfig-a011-20200826
x86_64               randconfig-a013-20200826
i386                 randconfig-a013-20200826
i386                 randconfig-a012-20200826
i386                 randconfig-a011-20200826
i386                 randconfig-a016-20200826
i386                 randconfig-a015-20200826
i386                 randconfig-a014-20200826
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
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
