Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigNv-0004rp-Jp
 for ath10k@lists.infradead.org; Tue, 09 Jun 2020 15:41:57 +0000
Date: Tue, 09 Jun 2020 23:41:44 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:master] BUILD SUCCESS 1318a212e716ce576233ab7a17722938b34497cd
Message-ID: <5edfadb8.AE7o6Qq1/EfqJoJq%lkp@intel.com>
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
branch HEAD: 1318a212e716ce576233ab7a17722938b34497cd  Add localversion-wireless-testing-ath

i386-tinyconfig vmlinux size:

=======================================================================================================
 TOTAL  TEXT  copy_xstate_to_kernel()  copy_part()                                                     
=======================================================================================================
  +216  +217                     +109          +96  dde2209f0066 Merge branch 'ath-next'               
    +4     0                        0            0  1318a212e716 Add localversion-wireless-testing-ath 
  +220  +217                     +109          +96  b2a5ac927378..1318a212e716 (ALL COMMITS)           
=======================================================================================================

elapsed time: 501m

configs tested: 173
configs skipped: 13

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
m68k                         amcore_defconfig
mips                       rbtx49xx_defconfig
um                                  defconfig
sh                     magicpanelr2_defconfig
powerpc                      ep88xc_defconfig
sh                ecovec24-romimage_defconfig
sparc64                          allmodconfig
powerpc                  mpc885_ads_defconfig
mips                           xway_defconfig
arm                       cns3420vb_defconfig
m68k                          sun3x_defconfig
sparc                       sparc32_defconfig
riscv                          rv32_defconfig
arm                           h3600_defconfig
powerpc                    mvme5100_defconfig
openrisc                 simple_smp_defconfig
sparc                            allyesconfig
arm                           efm32_defconfig
arm                        vexpress_defconfig
xtensa                          iss_defconfig
mips                  decstation_64_defconfig
sh                           cayman_defconfig
sh                           se7705_defconfig
mips                     decstation_defconfig
arm                              zx_defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
c6x                        evmc6678_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        mvebu_v5_defconfig
arm                          iop32x_defconfig
arm                            mps2_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          moxart_defconfig
arc                         haps_hs_defconfig
m68k                            mac_defconfig
c6x                               allnoconfig
arm                        oxnas_v6_defconfig
arm                    vt8500_v6_v7_defconfig
mips                         tb0219_defconfig
m68k                        mvme16x_defconfig
mips                          malta_defconfig
arc                          axs101_defconfig
sh                           se7724_defconfig
arm                       aspeed_g5_defconfig
arm                            dove_defconfig
xtensa                           alldefconfig
arm                         shannon_defconfig
um                                allnoconfig
arm                         socfpga_defconfig
sh                   sh7724_generic_defconfig
arc                            hsdk_defconfig
m68k                        m5272c3_defconfig
m68k                        stmark2_defconfig
nios2                            alldefconfig
nios2                         10m50_defconfig
mips                 pnx8335_stb225_defconfig
ia64                                defconfig
mips                      malta_kvm_defconfig
c6x                         dsk6455_defconfig
arm                            qcom_defconfig
sh                             espt_defconfig
powerpc                          allmodconfig
powerpc                     mpc512x_defconfig
arm                     davinci_all_defconfig
mips                  maltasmvp_eva_defconfig
arm                            xcep_defconfig
arm                         mv78xx0_defconfig
c6x                        evmc6457_defconfig
ia64                      gensparse_defconfig
h8300                       h8s-sim_defconfig
mips                            ar7_defconfig
powerpc                          g5_defconfig
m68k                       bvme6000_defconfig
arm                       omap2plus_defconfig
i386                             alldefconfig
s390                              allnoconfig
parisc                generic-32bit_defconfig
arm                          ep93xx_defconfig
s390                                defconfig
xtensa                         virt_defconfig
powerpc                 mpc8272_ads_defconfig
c6x                                 defconfig
mips                         cobalt_defconfig
mips                        nlm_xlp_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
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
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200607
i386                 randconfig-a006-20200607
i386                 randconfig-a002-20200607
i386                 randconfig-a005-20200607
i386                 randconfig-a004-20200607
i386                 randconfig-a003-20200607
i386                 randconfig-a001-20200609
i386                 randconfig-a002-20200609
i386                 randconfig-a006-20200609
i386                 randconfig-a005-20200609
i386                 randconfig-a003-20200609
i386                 randconfig-a004-20200609
i386                 randconfig-a014-20200607
i386                 randconfig-a015-20200607
i386                 randconfig-a011-20200607
i386                 randconfig-a016-20200607
i386                 randconfig-a012-20200607
i386                 randconfig-a013-20200607
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                               allmodconfig
um                               allyesconfig
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
