Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36F0C43334
	for <ath10k@archiver.kernel.org>; Thu, 23 Jun 2022 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3+DmyNZGjz5+jxMpeHLPQNlh3r7FL0Wrr0cEBcdkb8M=; b=JvkE5IfVUnfD+v
	Gv4UN8oa7dZTNFmmuhVkvYl6nLo0o+s9qtRAj8k/1ZA5PZtBJSTDQV4jZ3K/5fh4VHXLungbF0kyy
	lzxbsHh9GVUn5Cl5Wun/Nr4lA0jCH+3Zgv+Rtw1GSrky+TY4MzRvgAcTXzJuUPoet70TTJDO3Pfxv
	jdfcBQwN4pd0Z4khsT19vPagADIQ87fIUzCqgJfU7kd0ka/UYLs95PWXegzyZ0wWR7l+gnP1PRdeH
	Oys5+FPgCh7T6ycTA1UcNTxr3LupvsZnWYbKt3rLPk0DCkXF+WAu+r+Yx9H8qRW4hJdTGIsChEll7
	iDdmYfHT8YAmZWAaz5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IMB-00E7j1-OB; Thu, 23 Jun 2022 08:38:31 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IM8-00E7iO-Qr
	for ath10k@lists.infradead.org; Thu, 23 Jun 2022 08:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655973508; x=1687509508;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VKRCJyEyIYYqbQ01488SUiA36lAL2i4BMqCArkvW57M=;
  b=S/J5RlY1ebpiOfonFb94EVMDLDLcGVOF5NJBIRtLY9MVNxHEsSAC0D98
   5aHmCIFIc2ZGL6Jk/24aNkWfN0YfwBRkJRICTx2BYi9poZGuOLgjMsJmi
   O+o3v1OvA09mE0oGtob2dtmkIppaTMjxgmS4QcXYqS5M8wmq83L/raPjB
   OL3NZdl+p07GAQchjiRxMSrZn4aAL6dW9XK1Rswyyb5BRkmZOXot/q0py
   tqYnTvS8QgyJmwM0U0UDCfqzknMEiy2d6PWclGKJCAUTUNzzsEdKXGyCO
   u6LEw0UucDdRCWtqti0+z73MsP7Mu8jRlSekATiaNIln5E21AeiWnOiJy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281391945"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="281391945"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 01:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="834534952"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2022 01:38:26 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4IM5-0000y1-Vb;
	Thu, 23 Jun 2022 08:38:25 +0000
Date: Thu, 23 Jun 2022 16:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS WITH WARNING
 ff1c40050ac3ca6a55ccc7970e37503e75465977
Message-ID: <62b42658.3LNcVERPiW3rPZVv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_013828_974922_17D294B3 
X-CRM114-Status: UNSURE (   3.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: ff1c40050ac3ca6a55ccc7970e37503e75465977  ath11k: fix number of VHT beamformee spatial streams

Warning reports:

https://lore.kernel.org/lkml/202206222110.WLZh7cQf-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath9k/hif_usb.c:251:57: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- xtensa-randconfig-r033-20220622
    `-- drivers-net-wireless-ath-ath9k-hif_usb.c:warning:suggest-braces-around-empty-body-in-an-else-statement

elapsed time: 2999m

configs tested: 204
configs skipped: 6

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                               defconfig
arm                              allmodconfig
mips                 randconfig-c004-20220619
i386                          randconfig-c001
mips                 randconfig-c004-20220622
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     mpc83xx_defconfig
sh                          urquell_defconfig
sparc                       sparc64_defconfig
m68k                          multi_defconfig
alpha                            alldefconfig
mips                       bmips_be_defconfig
arc                              alldefconfig
mips                         rt305x_defconfig
csky                             alldefconfig
mips                          rb532_defconfig
arc                      axs103_smp_defconfig
m68k                       m5249evb_defconfig
ia64                         bigsur_defconfig
openrisc                 simple_smp_defconfig
s390                          debug_defconfig
m68k                        mvme16x_defconfig
arm                            xcep_defconfig
powerpc                      mgcoge_defconfig
arm                        shmobile_defconfig
arc                          axs103_defconfig
sh                           se7750_defconfig
nios2                               defconfig
powerpc                   currituck_defconfig
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
sh                          landisk_defconfig
m68k                          sun3x_defconfig
xtensa                       common_defconfig
arm                       imx_v6_v7_defconfig
um                                  defconfig
sh                               j2_defconfig
powerpc                       ppc64_defconfig
sh                                  defconfig
mips                 decstation_r4k_defconfig
xtensa                  audio_kc705_defconfig
arm                        multi_v7_defconfig
sh                           se7705_defconfig
arm                           stm32_defconfig
arm64                            alldefconfig
ia64                             alldefconfig
ia64                      gensparse_defconfig
sparc                               defconfig
sh                         microdev_defconfig
powerpc                      pasemi_defconfig
mips                           ci20_defconfig
xtensa                  nommu_kc705_defconfig
m68k                             allyesconfig
sh                           se7724_defconfig
arm                        realview_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                         apsh4a3a_defconfig
arm                           h3600_defconfig
powerpc                 mpc837x_mds_defconfig
arm                         cm_x300_defconfig
m68k                           virt_defconfig
powerpc                         wii_defconfig
sh                          sdk7786_defconfig
arm                         axm55xx_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   sh7770_generic_defconfig
xtensa                    smp_lx200_defconfig
powerpc                       maple_defconfig
sh                        sh7785lcr_defconfig
powerpc                      ppc6xx_defconfig
mips                            ar7_defconfig
riscv                               defconfig
arm                      integrator_defconfig
um                             i386_defconfig
arm                         vf610m4_defconfig
nios2                         10m50_defconfig
parisc                generic-32bit_defconfig
m68k                            q40_defconfig
sh                          kfr2r09_defconfig
arm                           u8500_defconfig
arm                       aspeed_g5_defconfig
xtensa                              defconfig
powerpc                 linkstation_defconfig
mips                            gpr_defconfig
xtensa                         virt_defconfig
um                               alldefconfig
openrisc                            defconfig
arm                         lubbock_defconfig
m68k                        mvme147_defconfig
sh                          rsk7201_defconfig
arm                     eseries_pxa_defconfig
powerpc                     tqm8541_defconfig
arm                             rpc_defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220622
ia64                             allmodconfig
riscv                             allnoconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a004-20220620
x86_64               randconfig-a006-20220620
x86_64               randconfig-a001-20220620
x86_64               randconfig-a005-20220620
x86_64               randconfig-a002-20220620
x86_64               randconfig-a003-20220620
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a005-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a006-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a003-20220620
i386                 randconfig-a002-20220620
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220619
arc                  randconfig-r043-20220620
arc                  randconfig-r043-20220619
s390                 randconfig-r044-20220619
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                         orion5x_defconfig
mips                        maltaup_defconfig
s390                             alldefconfig
mips                        qi_lb60_defconfig
arm64                            allyesconfig
powerpc                       ebony_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      malta_kvm_defconfig
mips                      maltaaprp_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220620
x86_64               randconfig-a012-20220620
x86_64               randconfig-a016-20220620
x86_64               randconfig-a015-20220620
x86_64               randconfig-a011-20220620
x86_64               randconfig-a014-20220620
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a014-20220620
i386                 randconfig-a011-20220620
i386                 randconfig-a012-20220620
i386                 randconfig-a015-20220620
i386                 randconfig-a016-20220620
i386                 randconfig-a013-20220620
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622
hexagon              randconfig-r041-20220621
hexagon              randconfig-r045-20220621

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
