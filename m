Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHy7F-0006ro-1d
 for ath10k@lists.infradead.org; Fri, 27 Mar 2020 23:10:18 +0000
Date: Sat, 28 Mar 2020 07:09:07 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:pending] BUILD REGRESSION
 36332b8f9975bbd686bde4d6ee23d02ed177d9a8
Message-ID: <5e7e8793.n5TEc0dzh+RWK3Ir%lkp@intel.com>
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
branch HEAD: 36332b8f9975bbd686bde4d6ee23d02ed177d9a8  ath10k: enable alt data of TX path for sdio

Regressions in current branch:

(void *)msdu->data + HAL_RX_DESC_SIZE, hdr_len);
drivers/net/wireless/ath/ath11k/dp_rx.c:1010:20: warning: The scope of the variable 'rx_tid' can be reduced. [variableScope]
drivers/net/wireless/ath/ath11k/dp_rx.c:3002:49: warning: '(void*)msdu->data+(sizeof(struct hal_rx_desc))' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]
drivers/net/wireless/ath/ath11k/dp_rx.c:3013:22: warning: The scope of the variable 'rx_desc' can be reduced. [variableScope]
drivers/net/wireless/ath/ath11k/dp_rx.c:3204:6: warning: The scope of the variable 'cmp' can be reduced. [variableScope]
drivers/net/wireless/ath/ath11k/hal.c:1138:19: warning: The scope of the variable 'srng' can be reduced. [variableScope]
drivers/net/wireless/ath/ath11k/hal.c:1139:29: warning: The scope of the variable 'irq_grp' can be reduced. [variableScope]
drivers/net/wireless/ath/ath11k/hal.c:1140:25: warning: The scope of the variable 'ce_pipe' can be reduced. [variableScope]
memmove((void *)msdu->data + HAL_RX_DESC_SIZE + crypto_len,
msdu_link = (struct hal_rx_msdu_link *)(link_desc_banks[desc_bank].vaddr +
struct ath11k_ce_pipe *ce_pipe;
struct ath11k_ext_irq_grp *irq_grp;
struct dp_rx_tid *rx_tid;
struct hal_rx_desc *rx_desc;
struct hal_srng *srng;

Error ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   |-- (void-)msdu-data-HAL_RX_DESC_SIZE-hdr_len)
|   |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:(void-)msdu-data-(sizeof(struct-hal_rx_desc))-is-of-type-void-.-When-using-void-pointers-in-calculations-the-behaviour-is-undefined.-arithOperationsOnVo
|   |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:The-scope-of-the-variable-cmp-can-be-reduced.-variableScope
|   |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:The-scope-of-the-variable-rx_desc-can-be-reduced.-variableScope
|   |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:The-scope-of-the-variable-rx_tid-can-be-reduced.-variableScope
|   |-- drivers-net-wireless-ath-ath11k-hal.c:warning:The-scope-of-the-variable-ce_pipe-can-be-reduced.-variableScope
|   |-- drivers-net-wireless-ath-ath11k-hal.c:warning:The-scope-of-the-variable-irq_grp-can-be-reduced.-variableScope
|   |-- drivers-net-wireless-ath-ath11k-hal.c:warning:The-scope-of-the-variable-srng-can-be-reduced.-variableScope
|   |-- memmove((void-)msdu-data-HAL_RX_DESC_SIZE-crypto_len
|   |-- msdu_link-(struct-hal_rx_msdu_link-)(link_desc_banks-desc_bank-.vaddr
|   |-- struct-ath11k_ce_pipe-ce_pipe
|   |-- struct-ath11k_ext_irq_grp-irq_grp
|   |-- struct-dp_rx_tid-rx_tid
|   |-- struct-hal_rx_desc-rx_desc
|   `-- struct-hal_srng-srng
`-- x86_64-allyesconfig
    |-- (void-)msdu-data-HAL_RX_DESC_SIZE-hdr_len)
    |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:(void-)msdu-data-(sizeof(struct-hal_rx_desc))-is-of-type-void-.-When-using-void-pointers-in-calculations-the-behaviour-is-undefined.-arithOperationsOnVo
    |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:The-scope-of-the-variable-cmp-can-be-reduced.-variableScope
    |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:The-scope-of-the-variable-rx_desc-can-be-reduced.-variableScope
    |-- drivers-net-wireless-ath-ath11k-dp_rx.c:warning:The-scope-of-the-variable-rx_tid-can-be-reduced.-variableScope
    |-- drivers-net-wireless-ath-ath11k-hal.c:warning:The-scope-of-the-variable-ce_pipe-can-be-reduced.-variableScope
    |-- drivers-net-wireless-ath-ath11k-hal.c:warning:The-scope-of-the-variable-irq_grp-can-be-reduced.-variableScope
    |-- drivers-net-wireless-ath-ath11k-hal.c:warning:The-scope-of-the-variable-srng-can-be-reduced.-variableScope
    |-- memmove((void-)msdu-data-HAL_RX_DESC_SIZE-crypto_len
    |-- msdu_link-(struct-hal_rx_msdu_link-)(link_desc_banks-desc_bank-.vaddr
    |-- struct-ath11k_ce_pipe-ce_pipe
    |-- struct-ath11k_ext_irq_grp-irq_grp
    |-- struct-dp_rx_tid-rx_tid
    |-- struct-hal_rx_desc-rx_desc
    `-- struct-hal_srng-srng

elapsed time: 480m

configs tested: 162
configs skipped: 0

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
sh                            titan_defconfig
sh                               allmodconfig
riscv                            allmodconfig
riscv                             allnoconfig
um                                  defconfig
um                           x86_64_defconfig
microblaze                    nommu_defconfig
sparc64                          allyesconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200327
x86_64               randconfig-a002-20200327
x86_64               randconfig-a003-20200327
i386                 randconfig-a001-20200327
i386                 randconfig-a002-20200327
i386                 randconfig-a003-20200327
alpha                randconfig-a001-20200327
m68k                 randconfig-a001-20200327
mips                 randconfig-a001-20200327
nds32                randconfig-a001-20200327
parisc               randconfig-a001-20200327
riscv                randconfig-a001-20200327
h8300                randconfig-a001-20200327
nios2                randconfig-a001-20200327
c6x                  randconfig-a001-20200327
sparc64              randconfig-a001-20200327
microblaze           randconfig-a001-20200327
s390                 randconfig-a001-20200327
xtensa               randconfig-a001-20200327
csky                 randconfig-a001-20200327
openrisc             randconfig-a001-20200327
sh                   randconfig-a001-20200327
x86_64               randconfig-b001-20200327
x86_64               randconfig-b002-20200327
x86_64               randconfig-b003-20200327
i386                 randconfig-b001-20200327
i386                 randconfig-b002-20200327
i386                 randconfig-b003-20200327
x86_64               randconfig-c001-20200327
x86_64               randconfig-c002-20200327
x86_64               randconfig-c003-20200327
i386                 randconfig-c001-20200327
i386                 randconfig-c002-20200327
i386                 randconfig-c003-20200327
x86_64               randconfig-d001-20200327
x86_64               randconfig-d002-20200327
x86_64               randconfig-d003-20200327
i386                 randconfig-d001-20200327
i386                 randconfig-d002-20200327
i386                 randconfig-d003-20200327
x86_64               randconfig-e001-20200327
x86_64               randconfig-e002-20200327
x86_64               randconfig-e003-20200327
i386                 randconfig-e001-20200327
i386                 randconfig-e002-20200327
i386                 randconfig-e003-20200327
x86_64               randconfig-f001-20200327
x86_64               randconfig-f002-20200327
x86_64               randconfig-f003-20200327
i386                 randconfig-f001-20200327
i386                 randconfig-f002-20200327
i386                 randconfig-f003-20200327
x86_64               randconfig-g001-20200327
x86_64               randconfig-g002-20200327
x86_64               randconfig-g003-20200327
i386                 randconfig-g001-20200327
i386                 randconfig-g002-20200327
i386                 randconfig-g003-20200327
x86_64               randconfig-h001-20200327
x86_64               randconfig-h002-20200327
x86_64               randconfig-h003-20200327
i386                 randconfig-h001-20200327
i386                 randconfig-h002-20200327
i386                 randconfig-h003-20200327
arm                  randconfig-a001-20200327
arm64                randconfig-a001-20200327
ia64                 randconfig-a001-20200327
powerpc              randconfig-a001-20200327
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                             defconfig
um                             i386_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
