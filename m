Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhLjT-0001IH-7Z
 for ath10k@lists.infradead.org; Fri, 05 Jun 2020 23:26:40 +0000
Date: Sat, 06 Jun 2020 07:26:11 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS
 6f57a4d38b4e79c1d97a251040e7cb354da9778d
Message-ID: <5edad493.jIuBHymrecgGgWt2%lkp@intel.com>
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
branch HEAD: 6f57a4d38b4e79c1d97a251040e7cb354da9778d  HACK: ath11k: get board file from QCA6390 directory

elapsed time: 485m

configs tested: 126
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
powerpc                          allyesconfig
m68k                       m5475evb_defconfig
nios2                         10m50_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme147_defconfig
arm                          imote2_defconfig
powerpc                     mpc5200_defconfig
arc                        vdk_hs38_defconfig
sh                           se7724_defconfig
powerpc                     mpc512x_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                           ip28_defconfig
sparc64                             defconfig
arm                         s5pv210_defconfig
mips                           ip32_defconfig
sh                          polaris_defconfig
mips                        jmr3927_defconfig
arm                           spitz_defconfig
m68k                         apollo_defconfig
csky                                defconfig
arm                        magician_defconfig
arm                        spear3xx_defconfig
mips                         tb0287_defconfig
ia64                        generic_defconfig
arc                             nps_defconfig
s390                             alldefconfig
h8300                               defconfig
i386                              allnoconfig
sh                          urquell_defconfig
arc                     haps_hs_smp_defconfig
arm                          ep93xx_defconfig
c6x                               allnoconfig
sh                           cayman_defconfig
powerpc                      mgcoge_defconfig
mips                      bmips_stb_defconfig
arm                              alldefconfig
powerpc                      pasemi_defconfig
arc                    vdk_hs38_smp_defconfig
s390                              allnoconfig
arm                         lpc32xx_defconfig
riscv                             allnoconfig
mips                          ath79_defconfig
mips                     loongson1c_defconfig
arm                          pxa910_defconfig
arc                     nsimosci_hs_defconfig
alpha                            alldefconfig
arm                        mvebu_v5_defconfig
mips                        qi_lb60_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
xtensa                              defconfig
h8300                            allmodconfig
h8300                            allyesconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20200605
x86_64               randconfig-a001-20200605
x86_64               randconfig-a006-20200605
x86_64               randconfig-a003-20200605
x86_64               randconfig-a004-20200605
x86_64               randconfig-a005-20200605
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
