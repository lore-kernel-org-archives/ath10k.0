Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCxXL-0005zV-Eo
 for ath10k@lists.infradead.org; Tue, 01 Sep 2020 04:04:49 +0000
Date: Tue, 01 Sep 2020 12:03:47 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master] BUILD SUCCESS 955fe9bbc8e11e5873bc7684f55894468943a485
Message-ID: <5f4dc823.ZnLT+EATJnmGaCON%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  master
branch HEAD: 955fe9bbc8e11e5873bc7684f55894468943a485  Add localversion-wireless-testing-ath

elapsed time: 720m

configs tested: 96
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0287_defconfig
arm                          pxa3xx_defconfig
sh                ecovec24-romimage_defconfig
sh                           se7751_defconfig
arm                           u8500_defconfig
parisc                generic-32bit_defconfig
m68k                        mvme147_defconfig
powerpc                          allmodconfig
arm                         shannon_defconfig
mips                     decstation_defconfig
sh                           se7343_defconfig
sh                     magicpanelr2_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
arm                            u300_defconfig
powerpc                      pmac32_defconfig
parisc                           allyesconfig
mips                       capcella_defconfig
powerpc                      ppc6xx_defconfig
arm                            qcom_defconfig
arc                            hsdk_defconfig
mips                        jmr3927_defconfig
sh                            shmin_defconfig
arm                      jornada720_defconfig
sh                          lboxre2_defconfig
mips                      malta_kvm_defconfig
sh                         microdev_defconfig
mips                      bmips_stb_defconfig
arm                            mps2_defconfig
arm                       imx_v6_v7_defconfig
mips                           rs90_defconfig
nios2                               defconfig
sh                               alldefconfig
arm                           stm32_defconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200831
i386                 randconfig-a002-20200831
i386                 randconfig-a004-20200831
i386                 randconfig-a006-20200831
i386                 randconfig-a005-20200831
i386                 randconfig-a003-20200831
x86_64               randconfig-a012-20200831
x86_64               randconfig-a015-20200831
x86_64               randconfig-a014-20200831
x86_64               randconfig-a011-20200831
x86_64               randconfig-a016-20200831
x86_64               randconfig-a013-20200831
i386                 randconfig-a013-20200831
i386                 randconfig-a011-20200831
i386                 randconfig-a012-20200831
i386                 randconfig-a015-20200831
i386                 randconfig-a016-20200831
i386                 randconfig-a014-20200831
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
