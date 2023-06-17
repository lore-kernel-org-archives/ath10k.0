Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E3FEB64D9
	for <ath10k@archiver.kernel.org>; Sat, 17 Jun 2023 04:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ZBJbvaGZjZT94Lln5k7c8R6t35GkTZdB5sKojwZlLM=; b=g38DrpS9S+EpuX
	/pGtC5bRydsbqDp06jQ52GBM8XLB9RKtDhKteskxUcL/OmgMJJNQVBllaf6FfiCj/tjWXS6pgQiYh
	+Cp5nMdAaP/v3ElzEYUg5llwfUJOTvB8GGW3N8D+pY9LgYOYBUnU7P8acqoDZJJlRPJ7Ugq+VV1BP
	qbw//qciebiNhBKjAt5JeIJIgjOWK6g4zX8e1Wc6tFqC5jzI8vqUZ3IY2OJnk0jsKiwHwOc3q1haS
	vCcSWeCWB6w18pzd2RzXgP/Epw5hd+wr82ZznKYaQJZL8POyC+Hj0/lQUh0jcrmdW6Z0qsElTTpXt
	q/c7YYOijPUngH50pj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qANnR-002iII-1y;
	Sat, 17 Jun 2023 04:44:21 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qANnO-002iHp-39
	for ath10k@lists.infradead.org;
	Sat, 17 Jun 2023 04:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686977058; x=1718513058;
  h=date:from:to:cc:subject:message-id;
  bh=onMfnqTvcT42mTTLNs1bNE4nTFyIkbaWwutMrgyqw90=;
  b=UN5e6tvZVKF2wdpWNsQycJJ3//4SEH7zXWlcsMjCCrzvi6IPuNGQ4al0
   NelKEmS8XtpPP1IEExA8M0vn7oBOli4NyRpSXxs/qeyL1T/thllQVAmqF
   14J7XiaVmeih51aZ+rxjjES00KOAH51l/BfGu5Uki9zBKair4UvpyoCio
   wkbU7cIX3Xk9UIIAW94RFhJrI4+sCbLbDTdCrV+SyLBVbMEFyd5QUk6w/
   V6JVudvn91MzCuh+9LL7VdxL76LVCxeJ5Z5S62uwvUoEn2Jd8sg5mlz34
   UrPf/KzmChRSd8lV72+qcPfZyREAAoyQWcb+mp8R/r7+K/AV2ckH4aBoe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="338976424"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="338976424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 21:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="778384907"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="778384907"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2023 21:44:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qANnK-0002Hk-2n;
	Sat, 17 Jun 2023 04:44:14 +0000
Date: Sat, 17 Jun 2023 12:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 2bcba004a12466b1b76d30933d3fa5c9d777cec8
Message-ID: <202306171254.rWi6EBZw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_214419_120490_8DF95546 
X-CRM114-Status: UNSURE (   3.59  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 2bcba004a12466b1b76d30933d3fa5c9d777cec8  Merge branch 'ath-next' into ath-qca

elapsed time: 722m

configs tested: 101
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230616   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230616   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230616   gcc  
arm                  randconfig-r033-20230616   gcc  
arm                  randconfig-r046-20230616   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r036-20230616   clang
csky                                defconfig   gcc  
csky                 randconfig-r022-20230616   gcc  
csky                 randconfig-r034-20230616   gcc  
hexagon              randconfig-r041-20230616   clang
hexagon              randconfig-r045-20230616   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230616   clang
i386         buildonly-randconfig-r005-20230616   clang
i386         buildonly-randconfig-r006-20230616   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230616   clang
i386                 randconfig-i002-20230616   clang
i386                 randconfig-i003-20230616   clang
i386                 randconfig-i004-20230616   clang
i386                 randconfig-i005-20230616   clang
i386                 randconfig-i006-20230616   clang
i386                 randconfig-i011-20230616   gcc  
i386                 randconfig-i012-20230616   gcc  
i386                 randconfig-i013-20230616   gcc  
i386                 randconfig-i014-20230616   gcc  
i386                 randconfig-i015-20230616   gcc  
i386                 randconfig-i016-20230616   gcc  
i386                 randconfig-r005-20230616   clang
i386                 randconfig-r006-20230616   clang
i386                 randconfig-r011-20230616   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230616   gcc  
loongarch            randconfig-r031-20230616   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r021-20230616   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230616   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r016-20230616   gcc  
openrisc             randconfig-r025-20230616   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r035-20230616   clang
riscv                randconfig-r042-20230616   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230616   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r024-20230616   gcc  
sh                   randconfig-r032-20230616   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230616   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230616   clang
x86_64       buildonly-randconfig-r002-20230616   clang
x86_64       buildonly-randconfig-r003-20230616   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230616   clang
x86_64               randconfig-a002-20230616   clang
x86_64               randconfig-a003-20230616   clang
x86_64               randconfig-a004-20230616   clang
x86_64               randconfig-a005-20230616   clang
x86_64               randconfig-a006-20230616   clang
x86_64               randconfig-a011-20230616   gcc  
x86_64               randconfig-a012-20230616   gcc  
x86_64               randconfig-a013-20230616   gcc  
x86_64               randconfig-a014-20230616   gcc  
x86_64               randconfig-a015-20230616   gcc  
x86_64               randconfig-a016-20230616   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
