Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRmVk-0006cs-Vm
 for ath10k@lists.infradead.org; Mon, 12 Oct 2020 01:20:26 +0000
Date: Mon, 12 Oct 2020 09:19:45 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:pending] BUILD SUCCESS
 61aec00fdf8182169a6b5d5d342d646596550a3c
Message-ID: <5f83af31.TezPqg6jA+57fdXq%lkp@intel.com>
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
branch HEAD: 61aec00fdf8182169a6b5d5d342d646596550a3c  ath10k: Introduce a devicetree quirk to skip host cap QMI requests

elapsed time: 721m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         socfpga_defconfig
arm                            qcom_defconfig
powerpc                 xes_mpc85xx_defconfig
parisc                generic-32bit_defconfig
arm                         s5pv210_defconfig
arm                        oxnas_v6_defconfig
powerpc                     akebono_defconfig
mips                           ip28_defconfig
powerpc                    ge_imp3a_defconfig
arc                            hsdk_defconfig
arm                         orion5x_defconfig
powerpc                         ps3_defconfig
arm                            lart_defconfig
powerpc                     taishan_defconfig
powerpc                        warp_defconfig
mips                      maltasmvp_defconfig
arm                          collie_defconfig
sh                      rts7751r2d1_defconfig
sh                          rsk7269_defconfig
m68k                          atari_defconfig
arm                         assabet_defconfig
powerpc                     kilauea_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201011
i386                 randconfig-a006-20201011
i386                 randconfig-a001-20201011
i386                 randconfig-a003-20201011
i386                 randconfig-a004-20201011
i386                 randconfig-a002-20201011
i386                 randconfig-a016-20201011
i386                 randconfig-a015-20201011
i386                 randconfig-a013-20201011
i386                 randconfig-a012-20201011
i386                 randconfig-a011-20201011
i386                 randconfig-a014-20201011
x86_64               randconfig-a004-20201011
x86_64               randconfig-a002-20201011
x86_64               randconfig-a006-20201011
x86_64               randconfig-a001-20201011
x86_64               randconfig-a003-20201011
x86_64               randconfig-a005-20201011
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
x86_64               randconfig-a016-20201011
x86_64               randconfig-a015-20201011
x86_64               randconfig-a012-20201011
x86_64               randconfig-a013-20201011
x86_64               randconfig-a014-20201011
x86_64               randconfig-a011-20201011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
