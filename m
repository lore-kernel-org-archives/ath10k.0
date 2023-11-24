Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CE1C61DF4
	for <ath10k@archiver.kernel.org>; Fri, 24 Nov 2023 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HLSXE5uQl1pjMU8eXRFwzaxz6tDuCLH3wXJdGOREoYg=; b=pTaQ9NwbsboSMj
	gA4l5wkjq/CJFxQhBtbKIEMxAADjj3nx46IFSJaWacTUtUT6QKRAi/YGjYCTsc6PGx5YYP027PvFb
	PZpSGuH2MP+JF1f90QLDcDvLrykWqUMG5zOb5jptOon+Udk7zIo6FWQ1F/MFwCCTTkv/pu93rYXwM
	CnzAFee1j4dTP/4+kAsLg0hLQ09/KG5e4dDELfsqTIuP2b5J5l0ahEQSCEyzTchsbXG5hBA+0rQfp
	DoSk7eymexG2sLL2cD4eRlZKuT6rUZ5Aj0OgTy+9YU2XBWy2mXyG33LSrbNhEfMl1hS/4MBxMQLsY
	B0qJtPny82KoFavDxJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6U0q-006wZ0-1Q;
	Fri, 24 Nov 2023 11:06:20 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6U0n-006wYD-0P
	for ath10k@lists.infradead.org;
	Fri, 24 Nov 2023 11:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700823977; x=1732359977;
  h=date:from:to:cc:subject:message-id;
  bh=hVhCVJ42kBFSwZIrRKL10Y/77IWGLlReUl4ThezKNFk=;
  b=I2q1TxE+pK3aUfR/78QRU0lWwSTARNW6bB4UksmJwaeg+AzmhckCK2vg
   BlPRanGPpMH2z92IGJkV/twASuWH5XE+z9UNZ49zO4iejspxVioCly9uY
   rUS7vGKb7dn0MbUcw27kIsgwjFRRWNWVJ5/mEt5TIxIqGW6aKm+tsCcvI
   vwmIPmF8E8JsN7X180u6MwI+RPsyt79b8uq4HmOlI4JgnaCrlDXTWV7Iq
   IrdjM+Js9ajynK1YEzls6+4OtDoW5M80Mj+kRnqiXji2DUc8vIFNkFshR
   c/WRdrMNuka3z0NqNH74c2zmR98GYyqL5Yjs7jAZMCNrAAdqoFnwtE68a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423542518"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="423542518"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="885245619"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="885245619"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2023 03:06:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6U0g-0002cy-0f;
	Fri, 24 Nov 2023 11:06:10 +0000
Date: Fri, 24 Nov 2023 19:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 48150730ef38a1d5b551a69d6cf38dcdec6ae3bf
Message-ID: <202311241903.wE6BIf2w-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_030617_173719_ED370335 
X-CRM114-Status: UNSURE (   6.58  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 48150730ef38a1d5b551a69d6cf38dcdec6ae3bf  wifi: ath9k: Fix potential array-index-out-of-bounds read in ath9k_htc_txstatus()

elapsed time: 2418m

configs tested: 66
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231123   gcc  
i386         buildonly-randconfig-002-20231123   gcc  
i386         buildonly-randconfig-003-20231123   gcc  
i386         buildonly-randconfig-004-20231123   gcc  
i386         buildonly-randconfig-005-20231123   gcc  
i386         buildonly-randconfig-006-20231123   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231123   gcc  
i386                  randconfig-002-20231123   gcc  
i386                  randconfig-003-20231123   gcc  
i386                  randconfig-004-20231123   gcc  
i386                  randconfig-005-20231123   gcc  
i386                  randconfig-006-20231123   gcc  
i386                  randconfig-011-20231123   clang
i386                  randconfig-012-20231123   clang
i386                  randconfig-013-20231123   clang
i386                  randconfig-014-20231123   clang
i386                  randconfig-015-20231123   clang
i386                  randconfig-016-20231123   clang
loongarch                        allmodconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                          rv32_defconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231123   gcc  
x86_64       buildonly-randconfig-002-20231123   gcc  
x86_64       buildonly-randconfig-003-20231123   gcc  
x86_64       buildonly-randconfig-004-20231123   gcc  
x86_64       buildonly-randconfig-005-20231123   gcc  
x86_64       buildonly-randconfig-006-20231123   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231123   clang
x86_64                randconfig-002-20231123   clang
x86_64                randconfig-003-20231123   clang
x86_64                randconfig-004-20231123   clang
x86_64                randconfig-005-20231123   clang
x86_64                randconfig-006-20231123   clang
x86_64                randconfig-011-20231123   gcc  
x86_64                randconfig-012-20231123   gcc  
x86_64                randconfig-013-20231123   gcc  
x86_64                randconfig-014-20231123   gcc  
x86_64                randconfig-015-20231123   gcc  
x86_64                randconfig-016-20231123   gcc  
x86_64                randconfig-071-20231123   gcc  
x86_64                randconfig-072-20231123   gcc  
x86_64                randconfig-073-20231123   gcc  
x86_64                randconfig-074-20231123   gcc  
x86_64                randconfig-075-20231123   gcc  
x86_64                randconfig-076-20231123   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
