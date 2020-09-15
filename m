Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI27P-0006EJ-9u
 for ath10k@lists.infradead.org; Tue, 15 Sep 2020 03:59:00 +0000
Date: Tue, 15 Sep 2020 11:57:52 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 a5700d64c2f3fdc8941dc1bc0a5e5609445c5c8e
Message-ID: <5f603bc0.WyFJGYmmCCep0A3A%lkp@intel.com>
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
branch HEAD: a5700d64c2f3fdc8941dc1bc0a5e5609445c5c8e  Merge branch 'ath-next' into ath-qca

elapsed time: 722m

configs tested: 140
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  cavium_octeon_defconfig
arc                      axs103_smp_defconfig
m68k                        m5407c3_defconfig
powerpc                      ppc6xx_defconfig
arm                      pxa255-idp_defconfig
arc                          axs103_defconfig
arm                        clps711x_defconfig
arm                          iop32x_defconfig
powerpc                         wii_defconfig
arm                         lpc32xx_defconfig
powerpc                        icon_defconfig
sh                          r7780mp_defconfig
powerpc                    mvme5100_defconfig
um                             i386_defconfig
arc                            hsdk_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         shannon_defconfig
powerpc                      pcm030_defconfig
parisc                generic-64bit_defconfig
sh                        dreamcast_defconfig
arm                            mps2_defconfig
powerpc                 mpc8540_ads_defconfig
mips                 pnx8335_stb225_defconfig
powerpc                 linkstation_defconfig
powerpc                  storcenter_defconfig
alpha                               defconfig
m68k                           sun3_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      mgcoge_defconfig
mips                        bcm47xx_defconfig
arc                        nsimosci_defconfig
ia64                                defconfig
powerpc                     tqm8541_defconfig
arm                         hackkit_defconfig
nds32                             allnoconfig
arm                             ezx_defconfig
m68k                        mvme16x_defconfig
arm                           omap1_defconfig
arm                       multi_v4t_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc64_defconfig
powerpc                     tqm8560_defconfig
riscv                            allmodconfig
arm                        spear3xx_defconfig
m68k                        m5307c3_defconfig
c6x                              alldefconfig
arm                        trizeps4_defconfig
arm                        multi_v7_defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
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
x86_64               randconfig-a004-20200914
x86_64               randconfig-a006-20200914
x86_64               randconfig-a003-20200914
x86_64               randconfig-a002-20200914
x86_64               randconfig-a001-20200914
x86_64               randconfig-a005-20200914
i386                 randconfig-a004-20200913
i386                 randconfig-a006-20200913
i386                 randconfig-a003-20200913
i386                 randconfig-a001-20200913
i386                 randconfig-a002-20200913
i386                 randconfig-a005-20200913
i386                 randconfig-a004-20200914
i386                 randconfig-a006-20200914
i386                 randconfig-a001-20200914
i386                 randconfig-a003-20200914
i386                 randconfig-a002-20200914
i386                 randconfig-a005-20200914
x86_64               randconfig-a014-20200913
x86_64               randconfig-a011-20200913
x86_64               randconfig-a012-20200913
x86_64               randconfig-a016-20200913
x86_64               randconfig-a015-20200913
x86_64               randconfig-a013-20200913
i386                 randconfig-a015-20200913
i386                 randconfig-a014-20200913
i386                 randconfig-a011-20200913
i386                 randconfig-a013-20200913
i386                 randconfig-a016-20200913
i386                 randconfig-a012-20200913
i386                 randconfig-a015-20200914
i386                 randconfig-a014-20200914
i386                 randconfig-a011-20200914
i386                 randconfig-a013-20200914
i386                 randconfig-a016-20200914
i386                 randconfig-a012-20200914
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200914
x86_64               randconfig-a011-20200914
x86_64               randconfig-a016-20200914
x86_64               randconfig-a012-20200914
x86_64               randconfig-a015-20200914
x86_64               randconfig-a013-20200914
x86_64               randconfig-a006-20200913
x86_64               randconfig-a004-20200913
x86_64               randconfig-a003-20200913
x86_64               randconfig-a002-20200913
x86_64               randconfig-a005-20200913
x86_64               randconfig-a001-20200913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
