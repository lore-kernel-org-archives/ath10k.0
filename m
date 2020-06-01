Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfmqY-0004FP-2e
 for ath10k@lists.infradead.org; Mon, 01 Jun 2020 15:59:31 +0000
Date: Mon, 01 Jun 2020 23:58:54 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 6fe1ed81020e3ee70da97bc7932c45df281cd6a7
Message-ID: <5ed525be.zAVM5LZIDd1bSUDg%lkp@intel.com>
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
branch HEAD: 6fe1ed81020e3ee70da97bc7932c45df281cd6a7  Merge branch 'pending' into master-pending

i386-tinyconfig vmlinux size:

+-------+------------------------------------+---------------------------------------------------------+
| DELTA |               SYMBOL               |                         COMMIT                          |
+-------+------------------------------------+---------------------------------------------------------+
|  +220 | TOTAL                              | b2a5ac927378..6fe1ed81020e (ALL COMMITS)                |
|  +216 | TOTAL                              | 6fe1ed81020e Merge branch 'pending' into master-pending |
|  +217 | TEXT                               | 6fe1ed81020e Merge branch 'pending' into master-pending |
|  +136 | arch/x86/events/zhaoxin/built-in.* | 7f69bf1ddcc3 Merge branch 'ath-next'                    |
|  +109 | copy_xstate_to_kernel()            | 6fe1ed81020e Merge branch 'pending' into master-pending |
|   +96 | copy_part()                        | 6fe1ed81020e Merge branch 'pending' into master-pending |
+-------+------------------------------------+---------------------------------------------------------+

elapsed time: 481m

configs tested: 87
configs skipped: 3

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
h8300                       h8s-sim_defconfig
arm                       imx_v4_v5_defconfig
mips                     decstation_defconfig
arm                          collie_defconfig
powerpc                       maple_defconfig
powerpc                      chrp32_defconfig
arm                      footbridge_defconfig
arm                          ixp4xx_defconfig
i386                              allnoconfig
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
xtensa                              defconfig
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
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
um                               allmodconfig
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
