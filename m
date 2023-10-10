Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AF3CD68ED
	for <ath10k@archiver.kernel.org>; Tue, 10 Oct 2023 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8V/t0zrd2sRm5V3ty2+fOSp7fH21SdNJNTwKZrVkGfw=; b=sJlaYQqu3mNd9D
	+byZIcwDVwqNKyk7qpbtVErMmfDpUDowdznASATVaNNOmk2cmvAiZvmFunoMJSj0KinIkwAyYUUN9
	piGX0/mqotdi5GwJN3Kk5ZxCzyHIm+h6kZ0EjewRgj7eflnJv5ANsSPd3OyAihrx0ITDM1dbeXVab
	AfNUorWFt3Ek1EqOWZWXu9i9jdnbQzYOegZMwO4ZgcKCrs7fsiEvnaTjCDfla9GMJO24Z4AIegIRp
	hkhJREmMdxXTSbpCjODIOJ89bY0giszAWaPJQeXjh/Q7m7ezcJq073gyXHXmDYkav8kETGHFM4Uxm
	Bt6ZZLdel9th6/8NO8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7FO-00CiIq-2M;
	Tue, 10 Oct 2023 07:33:42 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7FL-00CiGJ-17
	for ath10k@lists.infradead.org;
	Tue, 10 Oct 2023 07:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696923219; x=1728459219;
  h=date:from:to:cc:subject:message-id;
  bh=34aTr+tkINF0quKXR9wCPhJ206RE4b+4Q6TjwXXu+oc=;
  b=ZRrw/2aYzwUSDAGnrQEtaJ//zE1ZTLX+zE1nSsVetjsiXuCEVBNoXoER
   CcUqlnN+pX3zlrP8vp2e6It4qVmPyHyO6iub+BW2SCuIEr7AB5jayof0T
   LGcp9CUWHCAQIRSCxuYZcF6N0Hb+WrnEyUMEE8HpFymtcxyGnRDNmDx32
   AiCkS6yuogjbNaW/UHykZ0P+i0YKojk4caDY1E4vtrg7kex7QnpVWSkQM
   3p32uarstp/g8ayKIh/Id3K/tS6lEaMJNtEunegMDbD18x65/8EAJJXvt
   vY+nDNGc3HpOnhZ8vwRSnzVahydIbg0RpCjCuAS07D+S99y4L+XkwBbou
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="374674068"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="374674068"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 00:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="844015088"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="844015088"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2023 00:32:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq7Ea-0000AH-0Q;
	Tue, 10 Oct 2023 07:32:52 +0000
Date: Tue, 10 Oct 2023 15:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 4b2448d5d5095bdddb4e35ba2ccff51a2a139a09
Message-ID: <202310101503.BKlVrLGv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_003339_433733_9D749F76 
X-CRM114-Status: UNSURE (   6.18  )
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
branch HEAD: 4b2448d5d5095bdddb4e35ba2ccff51a2a139a09  wifi: ath11k: debugfs: fix truncation for pdev

elapsed time: 1248m

configs tested: 145
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20231009   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231009   gcc  
arm                   randconfig-001-20231010   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231009   gcc  
i386         buildonly-randconfig-002-20231009   gcc  
i386         buildonly-randconfig-003-20231009   gcc  
i386         buildonly-randconfig-004-20231009   gcc  
i386         buildonly-randconfig-005-20231009   gcc  
i386         buildonly-randconfig-006-20231009   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231009   gcc  
i386                  randconfig-002-20231009   gcc  
i386                  randconfig-003-20231009   gcc  
i386                  randconfig-004-20231009   gcc  
i386                  randconfig-005-20231009   gcc  
i386                  randconfig-006-20231009   gcc  
i386                  randconfig-011-20231009   gcc  
i386                  randconfig-012-20231009   gcc  
i386                  randconfig-013-20231009   gcc  
i386                  randconfig-014-20231009   gcc  
i386                  randconfig-015-20231009   gcc  
i386                  randconfig-016-20231009   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231009   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                        icon_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231009   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231009   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231009   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231009   gcc  
x86_64       buildonly-randconfig-002-20231009   gcc  
x86_64       buildonly-randconfig-003-20231009   gcc  
x86_64       buildonly-randconfig-004-20231009   gcc  
x86_64       buildonly-randconfig-005-20231009   gcc  
x86_64       buildonly-randconfig-006-20231009   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231009   gcc  
x86_64                randconfig-002-20231009   gcc  
x86_64                randconfig-003-20231009   gcc  
x86_64                randconfig-004-20231009   gcc  
x86_64                randconfig-005-20231009   gcc  
x86_64                randconfig-006-20231009   gcc  
x86_64                randconfig-011-20231009   gcc  
x86_64                randconfig-012-20231009   gcc  
x86_64                randconfig-013-20231009   gcc  
x86_64                randconfig-014-20231009   gcc  
x86_64                randconfig-015-20231009   gcc  
x86_64                randconfig-016-20231009   gcc  
x86_64                randconfig-071-20231009   gcc  
x86_64                randconfig-072-20231009   gcc  
x86_64                randconfig-073-20231009   gcc  
x86_64                randconfig-074-20231009   gcc  
x86_64                randconfig-075-20231009   gcc  
x86_64                randconfig-076-20231009   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
