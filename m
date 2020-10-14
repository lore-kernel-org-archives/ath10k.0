Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSbwF-00008K-O1
 for ath10k@lists.infradead.org; Wed, 14 Oct 2020 08:15:12 +0000
Date: Wed, 14 Oct 2020 16:14:57 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 66ff5220c2017e282046156c593bfb1f38f37b65
Message-ID: <5f86b381.2ZWxb3oh+db7tXLv%lkp@intel.com>
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
branch HEAD: 66ff5220c2017e282046156c593bfb1f38f37b65  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 164
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        sh7763rdp_defconfig
powerpc                     tqm8555_defconfig
powerpc                       eiger_defconfig
ia64                             alldefconfig
mips                        omega2p_defconfig
arm                           stm32_defconfig
sh                            migor_defconfig
arm                         orion5x_defconfig
arc                     nsimosci_hs_defconfig
arm                        spear3xx_defconfig
arm                         hackkit_defconfig
sh                          landisk_defconfig
arm                           h3600_defconfig
x86_64                              defconfig
mips                        nlm_xlr_defconfig
sh                          rsk7203_defconfig
powerpc                     powernv_defconfig
sh                        edosk7760_defconfig
arm                        mvebu_v7_defconfig
sh                           se7619_defconfig
powerpc                     tqm5200_defconfig
powerpc64                           defconfig
arm                          prima2_defconfig
arm                        realview_defconfig
powerpc                  iss476-smp_defconfig
arm                    vt8500_v6_v7_defconfig
xtensa                           allyesconfig
mips                         rt305x_defconfig
powerpc                        warp_defconfig
arm                          iop32x_defconfig
sh                               allmodconfig
sh                          sdk7786_defconfig
mips                      pistachio_defconfig
sh                        sh7785lcr_defconfig
sh                        edosk7705_defconfig
sh                         ap325rxa_defconfig
arm                           corgi_defconfig
ia64                                defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
arm                              zx_defconfig
powerpc                   currituck_defconfig
xtensa                           alldefconfig
microblaze                      mmu_defconfig
powerpc                      tqm8xx_defconfig
nds32                               defconfig
openrisc                         alldefconfig
m68k                        m5307c3_defconfig
sh                              ul2_defconfig
parisc                           alldefconfig
powerpc                     rainier_defconfig
um                             i386_defconfig
sh                   rts7751r2dplus_defconfig
arm                          simpad_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         axm55xx_defconfig
arm                       aspeed_g5_defconfig
sh                ecovec24-romimage_defconfig
mips                         mpc30x_defconfig
powerpc                     mpc5200_defconfig
powerpc                     mpc83xx_defconfig
c6x                              alldefconfig
mips                     loongson1b_defconfig
mips                      malta_kvm_defconfig
arm                           u8500_defconfig
mips                         tb0226_defconfig
mips                 decstation_r4k_defconfig
nds32                             allnoconfig
mips                     decstation_defconfig
arm                          ixp4xx_defconfig
mips                            e55_defconfig
ia64                      gensparse_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
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
x86_64               randconfig-a004-20201013
x86_64               randconfig-a002-20201013
x86_64               randconfig-a006-20201013
x86_64               randconfig-a001-20201013
x86_64               randconfig-a003-20201013
x86_64               randconfig-a005-20201013
i386                 randconfig-a005-20201014
i386                 randconfig-a006-20201014
i386                 randconfig-a001-20201014
i386                 randconfig-a003-20201014
i386                 randconfig-a004-20201014
i386                 randconfig-a002-20201014
i386                 randconfig-a005-20201013
i386                 randconfig-a006-20201013
i386                 randconfig-a001-20201013
i386                 randconfig-a003-20201013
i386                 randconfig-a004-20201013
i386                 randconfig-a002-20201013
x86_64               randconfig-a016-20201014
x86_64               randconfig-a012-20201014
x86_64               randconfig-a015-20201014
x86_64               randconfig-a013-20201014
x86_64               randconfig-a014-20201014
x86_64               randconfig-a011-20201014
i386                 randconfig-a016-20201014
i386                 randconfig-a013-20201014
i386                 randconfig-a015-20201014
i386                 randconfig-a011-20201014
i386                 randconfig-a012-20201014
i386                 randconfig-a014-20201014
i386                 randconfig-a016-20201013
i386                 randconfig-a015-20201013
i386                 randconfig-a013-20201013
i386                 randconfig-a012-20201013
i386                 randconfig-a011-20201013
i386                 randconfig-a014-20201013
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
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201014
x86_64               randconfig-a002-20201014
x86_64               randconfig-a006-20201014
x86_64               randconfig-a001-20201014
x86_64               randconfig-a005-20201014
x86_64               randconfig-a003-20201014
x86_64               randconfig-a016-20201013
x86_64               randconfig-a015-20201013
x86_64               randconfig-a012-20201013
x86_64               randconfig-a013-20201013
x86_64               randconfig-a014-20201013
x86_64               randconfig-a011-20201013

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
