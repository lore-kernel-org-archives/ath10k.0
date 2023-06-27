Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B5EEB64D7
	for <ath10k@archiver.kernel.org>; Tue, 27 Jun 2023 01:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pfq2LT4KzsGCJXs2J3stEpErS5/U5/GmcNvLV3iY458=; b=NcsV5iktGr1aZZ
	tVxeUc/WSf5AxJFwD9SFcEpQQQgcAM2HOXfapaXMx3Kjt30DlyFDh2S5F08ybtAKVrsWKzTmfh6Jj
	t2cB4sct+Wgaahn1CvWHQAl/q8Zn0McWpJ5bJqCeiU56KcSJpKAB3LQmXNDXxlMxA4D6CALFgmiK3
	42l7e8VOZTMxlIuxxN9ugo7KM2JqwbxCOCjVpBmN4bKIVE1eGsBNesEL3PyWEiWBJDeglu6ZfPaGm
	BvNXjqNnQ0TOeqqIlvkSFUFe7t3FayfOe9Zoh3bnm7jZFbAPAV0mp54lWFLrSLgLxZpflzH+r/Jrf
	dVce6jPlPjKM6FTa/8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxMv-00BMCD-2b;
	Tue, 27 Jun 2023 01:19:45 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxMs-00BMBT-25
	for ath10k@lists.infradead.org;
	Tue, 27 Jun 2023 01:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828782; x=1719364782;
  h=date:from:to:cc:subject:message-id;
  bh=dYNSyvodqRGJmhTtCm6HVcTHYHyxHGBbcT3f6hjXsDk=;
  b=IDYzoxvIxnB0F12iFiJ8Z7/wOELqlv01F+1LCJUqUu+7NNOZH2bhkc4f
   +J5XaEXmvRdCbO/xgY5N3g66dF4N6TyoRbK+QAQt3Nfo5gz/8ssjXUSZi
   az1NG5wo+MzMjIUhN0/eff5ymEzEGZFo/CHi9nRCHX7/J7YXqTyscYUOJ
   RleCus0AlStGqgjV/Rq3Sx3s9xvsPe6waH3G5KXEiRJm8rAWGIEol8MJ3
   s8duLSkim/HfZChdeXUvNBP8Z2o7Fov+cRfV2Br5f1sRutma80ATIJSDV
   3nIsDSA+ax4IEqESuM1mQtUs5ZbN75m/j9hZBof7b9CbrNgWt2hayDKEi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="447822527"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="447822527"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="840494072"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="840494072"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2023 18:19:40 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDxMp-000BLQ-2R;
	Tue, 27 Jun 2023 01:19:39 +0000
Date: Tue, 27 Jun 2023 09:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 b21fe5be53eb873c02e7479372726c8aeed171e3
Message-ID: <202306270916.rgxq10YT-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_181942_697946_22B45F46 
X-CRM114-Status: UNSURE (   4.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: b21fe5be53eb873c02e7479372726c8aeed171e3  Add localversion-wireless-testing-ath

elapsed time: 7450m

configs tested: 93
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r034-20230621   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230622   gcc  
arc                  randconfig-r043-20230621   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230621   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230621   clang
hexagon              randconfig-r045-20230621   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230621   gcc  
i386         buildonly-randconfig-r005-20230621   gcc  
i386         buildonly-randconfig-r006-20230621   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230621   gcc  
i386                 randconfig-i002-20230621   gcc  
i386                 randconfig-i003-20230621   gcc  
i386                 randconfig-i004-20230621   gcc  
i386                 randconfig-i005-20230621   gcc  
i386                 randconfig-i006-20230621   gcc  
i386                 randconfig-i011-20230621   clang
i386                 randconfig-i012-20230621   clang
i386                 randconfig-i013-20230621   clang
i386                 randconfig-i014-20230621   clang
i386                 randconfig-i015-20230621   clang
i386                 randconfig-i016-20230621   clang
i386                 randconfig-r002-20230622   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r014-20230621   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r031-20230621   gcc  
m68k                 randconfig-r036-20230621   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230621   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230621   gcc  
nios2                randconfig-r013-20230621   gcc  
nios2                randconfig-r015-20230621   gcc  
openrisc             randconfig-r001-20230622   gcc  
openrisc             randconfig-r005-20230622   gcc  
openrisc             randconfig-r035-20230621   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230621   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230621   clang
sh                               allmodconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230621   gcc  
x86_64       buildonly-randconfig-r002-20230621   gcc  
x86_64       buildonly-randconfig-r003-20230621   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r032-20230621   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
