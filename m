Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32BDC433F5
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 03:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oKYa47kGwqQLhTrEETLiXXOHu9ane99Vfl34u7zdWGk=; b=3HMNC+F7KtD32E
	6KUN2G7M/pCtwRLrenGHI6uBPmFrP5Bh4Eic3YUQCdD5q8CNnvqUe67XQP/XD+MpBHuCkZjn18/eO
	HDKFQB3YS63nCxhlT46cRcquWOGBZip8M9lSkZ2lSwl0pRgRiFWHRU7ziiNKKSobTDPEJ7FolX9Ar
	A6BlVInC0vDd3CVqeM99Qa67GKICIuH0Y5hB3A6A8/0YQ2iesBKcuzcYPhp4SKr+va10TqPwzIlZ3
	el3qsm+14lgxVrUyoSZqn/O7LiT0vvxwjixCiUbVGbS59r2hvy/pAL6AnkF7I9s/tPCOr7zBAKSD/
	oilvy0wcvqEyLI5/hRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5us-0038Ye-Nn; Tue, 11 Oct 2022 03:26:50 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5up-0038WS-Ht
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 03:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665458807; x=1696994807;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YN2nuSbJdFWXu8C9miTpLdNyB5PkcrNFOhvEZvaZtH0=;
  b=IIYY62zp63R3CahzMXX14Z4o35SU2mwGegRmYXVA1Crm5nkZVqs/uV1c
   hKcCQWHoN4+Li1Zy71/FUrtt8FnPYOlCzRvJln5JTXGsugPaIqBVzAxZR
   apfcOdhQOp6mwvb6efDCeJtz934PNC9QXvLVlxdZ0wRjGui/+E9gdnPt0
   fAPNfnC8fwkWbxxihwurKptOee7cIY7h9/pi3gQ7OPfbBCd4ULhFuWGtX
   sZB+JRx/PvBjboSrG5tlsXbb/b5upD9WpvafiJHtajnTQ+vYng1citwES
   X419o5IGaDQHSz8NfidA9QpjpE8iw56OGGL/H3yahfqLuA6ZAN3Izet9t
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="368560769"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; 
   d="scan'208";a="368560769"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 20:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="955176373"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; 
   d="scan'208";a="955176373"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 20:26:44 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oi5ul-0002SQ-2Q;
	Tue, 11 Oct 2022 03:26:43 +0000
Date: Tue, 11 Oct 2022 11:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 260530a8703d1ce6a537928a9535035675bf3976
Message-ID: <6344e245.2Ww3LZntSB752xlv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_202647_707675_9F39422C 
X-CRM114-Status: UNSURE (   3.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 260530a8703d1ce6a537928a9535035675bf3976  Add localversion-wireless-testing-ath

elapsed time: 1053m

configs tested: 151
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221010
s390                 randconfig-r044-20221010
riscv                randconfig-r042-20221010
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
s390                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a014-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a011-20221010
x86_64               randconfig-a013-20221010
x86_64               randconfig-a016-20221010
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                             allyesconfig
i386                                defconfig
arm                       omap2plus_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
parisc                generic-64bit_defconfig
mips                          rb532_defconfig
parisc64                         alldefconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                 randconfig-a013-20221010
i386                 randconfig-a015-20221010
i386                 randconfig-a016-20221010
i386                 randconfig-a011-20221010
i386                 randconfig-a014-20221010
i386                 randconfig-a012-20221010
arm                           h5000_defconfig
arm                        keystone_defconfig
sh                      rts7751r2d1_defconfig
i386                 randconfig-c001-20221010
powerpc                     tqm8541_defconfig
sh                                  defconfig
xtensa                    xip_kc705_defconfig
mips                        bcm47xx_defconfig
xtensa                  nommu_kc705_defconfig
arm                           sama5_defconfig
arm                          pxa910_defconfig
sh                            shmin_defconfig
powerpc                      pcm030_defconfig
powerpc                 canyonlands_defconfig
sh                        sh7785lcr_defconfig
sh                          kfr2r09_defconfig
m68k                        mvme16x_defconfig
sh                         ecovec24_defconfig
arc                        nsim_700_defconfig
arm64                               defconfig
sh                           se7750_defconfig
powerpc                     rainier_defconfig
ia64                             allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                         bigsur_defconfig
powerpc                 linkstation_defconfig
arm                        trizeps4_defconfig
arm                           stm32_defconfig
arm                            pleb_defconfig
arm                         s3c6400_defconfig
arm                         lubbock_defconfig
m68k                        m5272c3_defconfig
m68k                        m5407c3_defconfig
powerpc                     pq2fads_defconfig
powerpc                   currituck_defconfig
arm                      integrator_defconfig
sh                             shx3_defconfig
mips                      maltasmvp_defconfig
arm                        clps711x_defconfig
m68k                          hp300_defconfig
arm                      footbridge_defconfig
sh                     sh7710voipgw_defconfig
loongarch                        allmodconfig
sh                           se7206_defconfig
sh                        edosk7760_defconfig
x86_64               randconfig-k001-20221010
loongarch                           defconfig
loongarch                         allnoconfig
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
m68k                       bvme6000_defconfig
ia64                            zx1_defconfig
arm                      jornada720_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                      mgcoge_defconfig
parisc64                            defconfig
powerpc                    sam440ep_defconfig
ia64                          tiger_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
m68k                        stmark2_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig

clang tested configs:
i386                 randconfig-a005-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a005-20221010
arm                     am200epdkit_defconfig
arm                          ep93xx_defconfig
mips                      maltaaprp_defconfig
i386                             allyesconfig
hexagon                             defconfig
powerpc                  mpc885_ads_defconfig
arm                       imx_v4_v5_defconfig
mips                     cu1000-neo_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
