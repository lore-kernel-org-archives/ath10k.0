Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjbv8-0000Cq-6c
 for ath10k@lists.infradead.org; Fri, 12 Jun 2020 05:08:03 +0000
Date: Fri, 12 Jun 2020 13:07:24 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 f28b7b78aad32bcbec49e77baf140be14c7dd99b
Message-ID: <5ee30d8c.9sDji9DpPtuhjFUi%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-next
branch HEAD: f28b7b78aad32bcbec49e77baf140be14c7dd99b  ath11k: build HE 6 GHz capability

elapsed time: 1432m

configs tested: 137
configs skipped: 7

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
sh                          sdk7780_defconfig
s390                             alldefconfig
ia64                         bigsur_defconfig
powerpc                       maple_defconfig
powerpc                          g5_defconfig
ia64                             alldefconfig
riscv                          rv32_defconfig
powerpc                      tqm8xx_defconfig
mips                        maltaup_defconfig
arm                           u8500_defconfig
m68k                          multi_defconfig
arm                  colibri_pxa300_defconfig
arm                       imx_v4_v5_defconfig
xtensa                         virt_defconfig
mips                            ar7_defconfig
arm                            mmp2_defconfig
m68k                            mac_defconfig
arm                    vt8500_v6_v7_defconfig
arm                           sama5_defconfig
powerpc                    mvme5100_defconfig
arm                        trizeps4_defconfig
mips                     loongson1b_defconfig
arm                       imx_v6_v7_defconfig
m68k                             allyesconfig
sh                     magicpanelr2_defconfig
m68k                        mvme16x_defconfig
riscv                            alldefconfig
powerpc                      ppc64e_defconfig
mips                            gpr_defconfig
i386                              allnoconfig
mips                           ip27_defconfig
sh                               alldefconfig
xtensa                              defconfig
arm                         socfpga_defconfig
c6x                              alldefconfig
arm                        spear3xx_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                                defconfig
m68k                           sun3_defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
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
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a006-20200611
i386                 randconfig-a002-20200611
i386                 randconfig-a001-20200611
i386                 randconfig-a004-20200611
i386                 randconfig-a005-20200611
i386                 randconfig-a003-20200611
x86_64               randconfig-a015-20200611
x86_64               randconfig-a011-20200611
x86_64               randconfig-a016-20200611
x86_64               randconfig-a012-20200611
x86_64               randconfig-a014-20200611
x86_64               randconfig-a013-20200611
x86_64               randconfig-a001-20200612
x86_64               randconfig-a003-20200612
x86_64               randconfig-a002-20200612
x86_64               randconfig-a006-20200612
x86_64               randconfig-a005-20200612
x86_64               randconfig-a004-20200612
i386                 randconfig-a015-20200611
i386                 randconfig-a011-20200611
i386                 randconfig-a014-20200611
i386                 randconfig-a013-20200611
i386                 randconfig-a016-20200611
i386                 randconfig-a012-20200611
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
