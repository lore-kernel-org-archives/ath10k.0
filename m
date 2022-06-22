Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8916DC433EF
	for <ath10k@archiver.kernel.org>; Wed, 22 Jun 2022 06:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/Nv/f/gGZWQAIwPomuqC665lo2lX6Obe/UCq7TRnPA=; b=yLAMFRgTEYEdUU
	k+HNFnGlUL9ZCEsFPanK+RKijk11TZrimmNera4aQFBf/+AQCqYEIvWJ7IEZiaL0SRDlacDnRKb/h
	O4dI/JZIUiqDfi8ig07Y3Gfy1+WyeInIN8wRFXemdIN5qyP0+d/IPVVNtVFJtCCjUNihmp0hJq7B3
	I6AWc5Cm6VBwQM2Fqa+buXl0lFlyVjjk2HFulLZDrzpSskprRZYNzAeDyK7G7o+bvdgtVkAhbqeQs
	d1amwO56EZl+sb1nQ4mzI6vc6f0+peT1j1KirXW13rDAjaMOLM0Y+6lFlq75/MH6HPGjrT4z/KZ+6
	qORzZoaVlTVs5UxEwj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3u7R-008u8y-MJ; Wed, 22 Jun 2022 06:45:41 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3u7O-008u78-0T
	for ath10k@lists.infradead.org; Wed, 22 Jun 2022 06:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655880338; x=1687416338;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=joK4yYVr/ykaB41AUfYiJZtPkc9ncFjgw9DAM3gAnDw=;
  b=mtfVucEw4SZoboRlXhgkeJpn8j82FZBF/0mZkXoQ0dx1neL5CwYnmKQT
   r6C8308G0BS9KeKH/vb1Uz1CtqnSLwpW2u/Mkzh9H+XOegaY6KRAgbWVR
   LBlYIkBm6pYrEgJaQLj3C8FuPzNyPjvztKf2O/bEAPs5ZAad2TKmxHjeD
   NKYgQVfKKGMPsd+9IG29jVDWMt12Uu154wduCcAsSEMNATXKusBqDUjeN
   zt2j4j9fTeCepJ8YpUhETWQsyUylGcDpefNSf3/sz7Ux9KgtajuuOAV19
   ev0WeReYWdopM3ufkD+bsM8y2Oq2a9Uo1oCBb9vKoZfVkY2jzEI1ykcwh
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="277879334"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="277879334"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 23:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="690334223"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2022 23:45:35 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3u7L-0000wv-C8;
	Wed, 22 Jun 2022 06:45:35 +0000
Date: Wed, 22 Jun 2022 14:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS WITH WARNING
 cc108fac9c287f5624daedca923743587adcafd1
Message-ID: <62b2ba77.vuERUoJXywvnEspA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_234538_148493_BD7026CC 
X-CRM114-Status: UNSURE (   6.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: cc108fac9c287f5624daedca923743587adcafd1  ath12k: increase CE count to maximum supported by firmware

Warning reports:

https://lore.kernel.org/lkml/202206220630.i3KlrkEC-lkp@intel.com
https://lore.kernel.org/lkml/202206221338.iV0Co3Bt-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath12k/dbring.c:271:7: warning: variable 'ring' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
drivers/net/wireless/ath/ath12k/dp_mon.c:2140:18: warning: variable 'rx_buf_sz' is uninitialized when used here [-Wuninitialized]

Unverified Warning (likely false positive, please contact us if interested):

drivers/net/wireless/ath/ath12k/dp_mon.c:884:13: warning: variable 'pkt_type' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath12k/dp_rx.c:2815:33: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
drivers/net/wireless/ath/ath12k/dp_tx.c:1064:2: warning: variable 'cmd' is uninitialized when used here [-Wuninitialized]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- arm64-allyesconfig
    |-- drivers-net-wireless-ath-ath12k-dbring.c:warning:variable-ring-is-used-uninitialized-whenever-switch-case-is-taken
    |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:variable-pkt_type-set-but-not-used
    |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:variable-rx_buf_sz-is-uninitialized-when-used-here
    |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:variable-i-is-uninitialized-when-used-here
    `-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:variable-cmd-is-uninitialized-when-used-here

elapsed time: 1561m

configs tested: 177
configs skipped: 5

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
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
sh                          landisk_defconfig
m68k                          sun3x_defconfig
xtensa                       common_defconfig
arm                       imx_v6_v7_defconfig
um                                  defconfig
sh                               j2_defconfig
powerpc                       ppc64_defconfig
xtensa                  audio_kc705_defconfig
arm                        multi_v7_defconfig
sh                           se7705_defconfig
m68k                       m5249evb_defconfig
arm64                            alldefconfig
ia64                             alldefconfig
sh                                  defconfig
ia64                      gensparse_defconfig
mips                           ci20_defconfig
xtensa                  nommu_kc705_defconfig
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
nios2                         10m50_defconfig
parisc                generic-32bit_defconfig
powerpc                   currituck_defconfig
m68k                            q40_defconfig
arm                           stm32_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
mips                            gpr_defconfig
arm                      integrator_defconfig
riscv                               defconfig
xtensa                         virt_defconfig
um                               alldefconfig
openrisc                            defconfig
arm                         lubbock_defconfig
m68k                        mvme147_defconfig
sh                          rsk7201_defconfig
arm                     eseries_pxa_defconfig
powerpc                     tqm8541_defconfig
arm                             rpc_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220622
ia64                             allmodconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
nios2                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
sparc                            allyesconfig
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
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz

clang tested configs:
s390                             alldefconfig
mips                        qi_lb60_defconfig
arm64                            allyesconfig
powerpc                       ebony_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      malta_kvm_defconfig
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
