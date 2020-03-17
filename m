Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEERE-00082c-QK
 for ath10k@lists.infradead.org; Tue, 17 Mar 2020 15:47:30 +0000
Date: Tue, 17 Mar 2020 23:46:53 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 0af4160761bd5e959e3fb83c675efd3410b0c14e
Message-ID: <5e70f0ed.iSsB6DZLI4QNnYLV%lkp@intel.com>
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
branch HEAD: 0af4160761bd5e959e3fb83c675efd3410b0c14e  Merge branch 'ath-next' into ath-qca

elapsed time: 484m

configs tested: 153
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
mips                              allnoconfig
h8300                       h8s-sim_defconfig
nds32                             allnoconfig
arc                                 defconfig
microblaze                    nommu_defconfig
m68k                           sun3_defconfig
riscv                          rv32_defconfig
ia64                             allmodconfig
s390                                defconfig
ia64                             allyesconfig
mips                             allyesconfig
parisc                           allyesconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                              allnoconfig
ia64                                defconfig
arm64                            allmodconfig
arm                              allmodconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
powerpc                             defconfig
arc                              allyesconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200317
x86_64               randconfig-a002-20200317
x86_64               randconfig-a003-20200317
i386                 randconfig-a001-20200317
i386                 randconfig-a002-20200317
i386                 randconfig-a003-20200317
riscv                randconfig-a001-20200317
alpha                randconfig-a001-20200317
nds32                randconfig-a001-20200317
m68k                 randconfig-a001-20200317
parisc               randconfig-a001-20200317
mips                 randconfig-a001-20200317
xtensa               randconfig-a001-20200317
openrisc             randconfig-a001-20200317
csky                 randconfig-a001-20200317
sh                   randconfig-a001-20200317
s390                 randconfig-a001-20200317
x86_64               randconfig-b001-20200317
x86_64               randconfig-b002-20200317
x86_64               randconfig-b003-20200317
i386                 randconfig-b001-20200317
i386                 randconfig-b002-20200317
i386                 randconfig-b003-20200317
x86_64               randconfig-d001-20200317
i386                 randconfig-d001-20200317
i386                 randconfig-d003-20200317
i386                 randconfig-d002-20200317
x86_64               randconfig-d003-20200317
x86_64               randconfig-d002-20200317
x86_64               randconfig-e001-20200317
x86_64               randconfig-e002-20200317
x86_64               randconfig-e003-20200317
i386                 randconfig-e001-20200317
i386                 randconfig-e002-20200317
i386                 randconfig-e003-20200317
x86_64               randconfig-f001-20200317
x86_64               randconfig-f002-20200317
x86_64               randconfig-f003-20200317
i386                 randconfig-f001-20200317
i386                 randconfig-f002-20200317
i386                 randconfig-f003-20200317
x86_64               randconfig-g001-20200317
x86_64               randconfig-g002-20200317
x86_64               randconfig-g003-20200317
i386                 randconfig-g001-20200317
i386                 randconfig-g002-20200317
i386                 randconfig-g003-20200317
x86_64               randconfig-h001-20200317
x86_64               randconfig-h002-20200317
x86_64               randconfig-h003-20200317
i386                 randconfig-h001-20200317
i386                 randconfig-h002-20200317
i386                 randconfig-h003-20200317
arc                  randconfig-a001-20200317
ia64                 randconfig-a001-20200317
arm                  randconfig-a001-20200317
arm64                randconfig-a001-20200317
sparc                randconfig-a001-20200317
powerpc              randconfig-a001-20200317
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
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
