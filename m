Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F6AC77B73
	for <ath10k@archiver.kernel.org>; Thu, 20 Apr 2023 03:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9R5Kw2/3sqEHtfO2fzgmwTCuiiHAYt9f4l7LU7V7Rp4=; b=kjuy8W37k1GM6h
	ywfQIE4+HBz67rTxom842+hr1PQ+UZAd43J2Pa1VFRiNh9DMp1DXpx9QNfVogzpGW72ADQp4kyfoR
	lkIl8IS5VNsSGzT6Vm2laDtNCylbr1Q2IBlM2d8/N3mvKv1NRHfMm+qtoOaE4XWAmaL1FrseyR0hR
	DRMQUSyv4/iDtx7sWvCVhdVg5EPXxKxt2tjRCfBhsEIGYMDrRRKgdYiH/ViQHzMfKmoLSE1KMsqZT
	v6Ts02spDI/DoOBiHxE8EhRUIr5o5VaoPv/GMw0SgipWt/uK8N2WSz2C2wLSjGBGdKiAf7kQJM8WZ
	VPZ3r5XLrBMwHEbrI4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppL8l-006xyd-2n;
	Thu, 20 Apr 2023 03:39:23 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppL8i-006xx3-1e
	for ath10k@lists.infradead.org;
	Thu, 20 Apr 2023 03:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681961960; x=1713497960;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YCPaQqAQ/SUKDXwwJSjH87nPLayBALvbkfZgNjEyEzU=;
  b=YICe4vgQsNQe3JJdTuVqvRRnU/jhzkp+FDEUysjwk9J2XsymTiY2bqPY
   1NBudUBbdhmjrlwqUCNveysg3/uvbAzRvGqXRYygW5T2r2O0drRtOoNeL
   2H0R8sD0Jw9LL6MzprQAx1jBPJMb4w3ksdB4NodmbEX7jpia29IU4oDSt
   KP1eRwMCNrYOMX1ABGRr6YUgwEO9nrTH2mt5WC+Bxs7JrxhAEJ9ldouWS
   G1HXyk+oN8cXVtp/XLBlUE4bUmqWNN5ccx2aPLX7TxG0jproDu1kI1Jdo
   5zRCUaJ6Z5iM8H7uv0dqv0WsXIMTesyUyVsZVAEnmAwNu/1zkeeEyISlN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347483930"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="347483930"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="835553989"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="835553989"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2023 20:39:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppL8b-000fQV-2x;
	Thu, 20 Apr 2023 03:39:13 +0000
Date: Thu, 20 Apr 2023 11:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d245ebeb8c120ee01aa769435113ec739de23a0c
Message-ID: <6440b3b6.5rdttLgkuA0Ad4E+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_203920_589948_518DF813 
X-CRM114-Status: UNSURE (   6.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: d245ebeb8c120ee01aa769435113ec739de23a0c  Merge branch 'ath-next' into ath-qca

elapsed time: 728m

configs tested: 43
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
