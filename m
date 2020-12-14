Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kowXv-0007SD-5Q
 for ath10k@lists.infradead.org; Mon, 14 Dec 2020 22:42:24 +0000
Date: Tue, 15 Dec 2020 06:41:33 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-qca6390-bringup] BUILD SUCCESS WITH WARNING
 60fad49a69e7b2f896ce7b1ade4ed532227b8e22
Message-ID: <5fd7ea1d.mxoC+4GbVCKSb1/j%lkp@intel.com>
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
branch HEAD: 60fad49a69e7b2f896ce7b1ade4ed532227b8e22  HACK: Revert "mm/page_alloc: place pages to tail in __free_pages_core()"

Warning in current branch:

drivers/net/wireless/ath/ath11k/qmi.c:1680:46: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- arm-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- c6x-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- h8300-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- i386-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- m68k-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- m68k-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- mips-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- mips-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- nds32-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- nios2-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- nios2-randconfig-r035-20201214
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- parisc-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
|-- parisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int
`-- xtensa-allyesconfig
    `-- drivers-net-wireless-ath-ath11k-qmi.c:warning:format-llx-expects-argument-of-type-long-long-unsigned-int-but-argument-has-type-dma_addr_t-aka-unsigned-int

elapsed time: 721m

configs tested: 97
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
m68k                         apollo_defconfig
x86_64                              defconfig
arm                          exynos_defconfig
arm                            dove_defconfig
arm                        clps711x_defconfig
mips                        jmr3927_defconfig
i386                                defconfig
arm                  colibri_pxa270_defconfig
powerpc                     mpc512x_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
arm                         at91_dt_defconfig
arm                           sama5_defconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
arm                         cm_x300_defconfig
arm                         axm55xx_defconfig
m68k                            q40_defconfig
arm                            lart_defconfig
arm                          prima2_defconfig
h8300                            alldefconfig
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
i386                               tinyconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
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
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
