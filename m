Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX8qH-0007IK-Ai
 for ath10k@lists.infradead.org; Mon, 26 Oct 2020 20:11:47 +0000
Date: Tue, 27 Oct 2020 04:10:44 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 832b4d71e20e396862f0b1ef99d101816096b49b
Message-ID: <5f972d44.rlGqI1KbqV8mtgxL%lkp@intel.com>
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
branch HEAD: 832b4d71e20e396862f0b1ef99d101816096b49b  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
arm                     davinci_all_defconfig
arm                         hackkit_defconfig
powerpc                      acadia_defconfig
um                            kunit_defconfig
m68k                          atari_defconfig
arm                           stm32_defconfig
alpha                            allyesconfig
arm                            dove_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        bcm63xx_defconfig
mips                         tb0287_defconfig
mips                        workpad_defconfig
m68k                         amcore_defconfig
arm                          badge4_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      ppc6xx_defconfig
m68k                       bvme6000_defconfig
arm                            zeus_defconfig
mips                         mpc30x_defconfig
arm                         s3c2410_defconfig
sh                           se7780_defconfig
arm                  colibri_pxa300_defconfig
arm                         ebsa110_defconfig
sparc64                             defconfig
mips                         tb0226_defconfig
powerpc                     tqm8540_defconfig
arm                          collie_defconfig
powerpc                     pq2fads_defconfig
sh                           se7751_defconfig
arm                      footbridge_defconfig
ia64                             alldefconfig
nds32                               defconfig
m68k                         apollo_defconfig
sh                             shx3_defconfig
powerpc                      makalu_defconfig
arm                          pxa3xx_defconfig
mips                         tb0219_defconfig
arc                                 defconfig
powerpc                          g5_defconfig
mips                        nlm_xlp_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     tqm8541_defconfig
sh                          polaris_defconfig
arm                             rpc_defconfig
mips                          rb532_defconfig
openrisc                    or1ksim_defconfig
mips                  cavium_octeon_defconfig
ia64                        generic_defconfig
powerpc                     pseries_defconfig
arm                           sunxi_defconfig
sh                   secureedge5410_defconfig
powerpc                      ppc40x_defconfig
mips                         rt305x_defconfig
sh                          rsk7203_defconfig
arm64                            alldefconfig
sh                        dreamcast_defconfig
ia64                      gensparse_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201026
i386                 randconfig-a015-20201026
i386                 randconfig-a014-20201026
i386                 randconfig-a012-20201026
i386                 randconfig-a013-20201026
i386                 randconfig-a011-20201026
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
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
