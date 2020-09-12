Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGtjA-00012z-K5
 for ath10k@lists.infradead.org; Sat, 12 Sep 2020 00:49:18 +0000
Date: Sat, 12 Sep 2020 08:48:35 +0800
From: kernel test robot <lkp@intel.com>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 d7f8447aa69cbdf8ee81fa9e2a76cbb85be4bf9d
Message-ID: <5f5c1ae3.bkovnNMHBjyjdFp1%lkp@intel.com>
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
branch HEAD: d7f8447aa69cbdf8ee81fa9e2a76cbb85be4bf9d  Merge branch 'ath-next' into ath-qca

elapsed time: 721m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc832x_rdb_defconfig
arm                            lart_defconfig
powerpc                      ppc64e_defconfig
arm                           omap1_defconfig
powerpc                      acadia_defconfig
arm                        trizeps4_defconfig
xtensa                    xip_kc705_defconfig
mips                         db1xxx_defconfig
sh                        sh7763rdp_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
s390                          debug_defconfig
arm                             rpc_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
c6x                        evmc6472_defconfig
mips                      maltasmvp_defconfig
powerpc                    amigaone_defconfig
powerpc                      pasemi_defconfig
arm                         at91_dt_defconfig
sh                               alldefconfig
m68k                        mvme16x_defconfig
powerpc                        warp_defconfig
powerpc                    sam440ep_defconfig
arc                          axs101_defconfig
sh                          rsk7264_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     akebono_defconfig
sparc                       sparc64_defconfig
arm                            hisi_defconfig
arm                     am200epdkit_defconfig
mips                            e55_defconfig
arm                           efm32_defconfig
arm                              zx_defconfig
mips                          malta_defconfig
arc                             nps_defconfig
arm                     eseries_pxa_defconfig
arm                        mvebu_v5_defconfig
sh                           sh2007_defconfig
mips                           ci20_defconfig
arc                        vdk_hs38_defconfig
arm                          gemini_defconfig
arc                            hsdk_defconfig
powerpc                        icon_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc85xx_cds_defconfig
nios2                         3c120_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
ia64                            zx1_defconfig
arm                         socfpga_defconfig
powerpc                      pmac32_defconfig
sh                           se7722_defconfig
powerpc64                           defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5249evb_defconfig
riscv                          rv32_defconfig
c6x                        evmc6474_defconfig
sh                          lboxre2_defconfig
powerpc                      pcm030_defconfig
mips                          rm200_defconfig
riscv                            alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200911
i386                 randconfig-a006-20200911
i386                 randconfig-a001-20200911
i386                 randconfig-a003-20200911
i386                 randconfig-a002-20200911
i386                 randconfig-a005-20200911
x86_64               randconfig-a014-20200911
x86_64               randconfig-a011-20200911
x86_64               randconfig-a012-20200911
x86_64               randconfig-a016-20200911
x86_64               randconfig-a015-20200911
x86_64               randconfig-a013-20200911
i386                 randconfig-a015-20200911
i386                 randconfig-a014-20200911
i386                 randconfig-a011-20200911
i386                 randconfig-a013-20200911
i386                 randconfig-a016-20200911
i386                 randconfig-a012-20200911
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200911
x86_64               randconfig-a006-20200911
x86_64               randconfig-a003-20200911
x86_64               randconfig-a002-20200911
x86_64               randconfig-a005-20200911
x86_64               randconfig-a001-20200911

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
