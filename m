Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnqDK-0000yk-49
 for ath10k@lists.infradead.org; Tue, 23 Jun 2020 21:12:19 +0000
Date: Wed, 24 Jun 2020 05:11:17 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 a9bf090932032bd259672814670df701ecb3ff51
Message-ID: <5ef26ff5.YJ2PS36BHQduR486%lkp@intel.com>
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
branch HEAD: a9bf090932032bd259672814670df701ecb3ff51  ath11k: remove define ATH11K_QMI_DEFAULT_CAL_FILE_NAME

elapsed time: 725m

configs tested: 138
configs skipped: 10

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
powerpc                      mgcoge_defconfig
sh                ecovec24-romimage_defconfig
arm                        mvebu_v7_defconfig
arm                        multi_v5_defconfig
mips                malta_kvm_guest_defconfig
sh                          rsk7203_defconfig
arc                         haps_hs_defconfig
xtensa                          iss_defconfig
riscv                               defconfig
arm                          lpd270_defconfig
h8300                     edosk2674_defconfig
sh                           se7722_defconfig
nios2                            alldefconfig
m68k                            q40_defconfig
arm                            pleb_defconfig
arm                           h3600_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
ia64                             allyesconfig
mips                           ip28_defconfig
alpha                            alldefconfig
arc                             nps_defconfig
arm                      integrator_defconfig
arm                      tct_hammer_defconfig
mips                        omega2p_defconfig
powerpc                          g5_defconfig
c6x                         dsk6455_defconfig
arm                          tango4_defconfig
powerpc                      ppc44x_defconfig
m68k                             allyesconfig
mips                           ip27_defconfig
m68k                         amcore_defconfig
powerpc                    gamecube_defconfig
arc                          axs101_defconfig
arc                              allyesconfig
mips                     cu1000-neo_defconfig
sparc                            alldefconfig
sparc64                             defconfig
mips                        nlm_xlr_defconfig
sh                        sh7757lcr_defconfig
arm                        multi_v7_defconfig
arm                          gemini_defconfig
powerpc                 mpc8272_ads_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
arm                        clps711x_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                            mps2_defconfig
sh                          rsk7264_defconfig
mips                          malta_defconfig
mips                    maltaup_xpa_defconfig
alpha                               defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200623
i386                 randconfig-a002-20200623
i386                 randconfig-a003-20200623
i386                 randconfig-a001-20200623
i386                 randconfig-a005-20200623
i386                 randconfig-a004-20200623
i386                 randconfig-a013-20200623
i386                 randconfig-a016-20200623
i386                 randconfig-a012-20200623
i386                 randconfig-a014-20200623
i386                 randconfig-a015-20200623
i386                 randconfig-a011-20200623
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
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
