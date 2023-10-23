Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05273C001E0
	for <ath10k@archiver.kernel.org>; Mon, 23 Oct 2023 15:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FjBpGWUebtj4u5OmE7lsFpp3RfiEapqD55eS5chjouE=; b=gWEa2UBuZDf+3N
	LLBI0B7IbcUGRBQYr545NAm7vscMDyMIY1VgB8QS020kHYMTVw/GpLAHIlB8hWBTPGGBBfkUYkYJ9
	fFpGWfSUsBK12CRpRAmB0Ek0kXzetv3NMO+9da00LdH4lliG8PFkk3sQPSdqOOy1VM2dlu8CaV+jh
	bTPRbyMd2KGiJA6lPCZUY+fcVv7GnjFTwCUM8uxFFhN93uGQv10Ym6Hu252U71CmBTfKAkwkE6V1J
	yePQvClipXZfgMJrUHt7Za7/iFoMHnLrFzPT+DYRBOdSGEGhOgIlnVu2juErA/Xo9w096PNVuoqKn
	wgkqPHuMI2u3oACvAjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxD3-007kd1-0Z;
	Mon, 23 Oct 2023 15:51:17 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxCt-007kYA-0g
	for ath10k@lists.infradead.org;
	Mon, 23 Oct 2023 15:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698076267; x=1729612267;
  h=date:from:to:cc:subject:message-id;
  bh=yVs+KUpsZCRPx+yJGyM8krQG0BqVaYhZs70DFDr2Jn0=;
  b=JbvJRFQNDr1ZJNV1YmzySNicP0ZXuwj35w7JEuxUAFcdmsaK1krtuiay
   ZJgQIJVcP0QZ4wI3iRPXckEQoY6F5JbOo669y6OA+AmX8QtjpFBeR314h
   /WAYCn+7jO7E3EDEA4T6MfHWX4wmGs1goo97IR9ERtipJtNTtQz4NYI+d
   o3ZJ9IjYSxkpDBQY6twdwQAr5pIyNRgo2mAIa6/X/TmQ1lSL8Xi8dz2r4
   bzUXXZGYttSbrm4fdoZE+JuWAb9STJ7EIqBa8AGiG9/IHnVjUqsW3I7j4
   U8sqrWLQq/ptm6gPkDAr1kz6xWsHxhYLH68RTaA6HrbkeiyBo35p5dEmu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="384069145"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="384069145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 08:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="787488442"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="787488442"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Oct 2023 08:50:59 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quxCj-00072X-01;
	Mon, 23 Oct 2023 15:50:57 +0000
Date: Mon, 23 Oct 2023 23:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 a3cfdc79c4a8fc1096676e4b68da8ae1f84fbefd
Message-ID: <202310232349.Ut0L5tNo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_085107_291228_3DCAEFFA 
X-CRM114-Status: UNSURE (   4.45  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: a3cfdc79c4a8fc1096676e4b68da8ae1f84fbefd  wifi: ath10k: mac: enable WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON on ath10k

elapsed time: 6072m

configs tested: 133
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20231020   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231021   gcc  
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
i386         buildonly-randconfig-001-20231021   gcc  
i386         buildonly-randconfig-002-20231021   gcc  
i386         buildonly-randconfig-003-20231021   gcc  
i386         buildonly-randconfig-004-20231021   gcc  
i386         buildonly-randconfig-005-20231021   gcc  
i386         buildonly-randconfig-006-20231021   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231021   gcc  
i386                  randconfig-002-20231021   gcc  
i386                  randconfig-003-20231021   gcc  
i386                  randconfig-004-20231021   gcc  
i386                  randconfig-005-20231021   gcc  
i386                  randconfig-006-20231021   gcc  
i386                  randconfig-011-20231021   gcc  
i386                  randconfig-012-20231021   gcc  
i386                  randconfig-013-20231021   gcc  
i386                  randconfig-014-20231021   gcc  
i386                  randconfig-015-20231021   gcc  
i386                  randconfig-016-20231021   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231020   gcc  
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
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231020   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231020   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231021   gcc  
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
x86_64       buildonly-randconfig-001-20231021   gcc  
x86_64       buildonly-randconfig-002-20231021   gcc  
x86_64       buildonly-randconfig-003-20231021   gcc  
x86_64       buildonly-randconfig-004-20231021   gcc  
x86_64       buildonly-randconfig-005-20231021   gcc  
x86_64       buildonly-randconfig-006-20231021   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231021   gcc  
x86_64                randconfig-002-20231021   gcc  
x86_64                randconfig-003-20231021   gcc  
x86_64                randconfig-004-20231021   gcc  
x86_64                randconfig-005-20231021   gcc  
x86_64                randconfig-006-20231021   gcc  
x86_64                randconfig-011-20231022   gcc  
x86_64                randconfig-012-20231022   gcc  
x86_64                randconfig-013-20231022   gcc  
x86_64                randconfig-014-20231022   gcc  
x86_64                randconfig-015-20231022   gcc  
x86_64                randconfig-016-20231022   gcc  
x86_64                randconfig-071-20231021   gcc  
x86_64                randconfig-072-20231021   gcc  
x86_64                randconfig-073-20231021   gcc  
x86_64                randconfig-074-20231021   gcc  
x86_64                randconfig-075-20231021   gcc  
x86_64                randconfig-076-20231021   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
