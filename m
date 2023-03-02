Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE7C6FA8E
	for <ath10k@archiver.kernel.org>; Thu,  2 Mar 2023 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqZrdJQS9SZgXYzSbnj9R0Z3wcOESqMt+yJI4dZBtBw=; b=kuY7pf2OdTu4he
	GrkhoPWt9SuizJRSDQtX7spUJIbDczGDQcyzKD+t8QGCDRq6bWI4Qt+HZBjjU9vSk5arSoCbHZjhY
	2LiVyCDXEiPWHtqyOUpkL9DyQi3miI2/jTmkd3Mo2mWOBG9ipLiozaYSHuh6bAXADwXA48uDfm1T/
	2BT2rwQ4l/O0cgFOtQepINnsDXEm0blOR8nweWORGctInedEw5LpbKcsILRDLSRER6SsWABffrFOi
	vjXh+3Z5P80nf02DkuYJ4W8h6MBnhxQH9cupyvdU9nBGu+Ym3CGq/PI8JWS2PgF7+YUJb5pYw1aLT
	vnxhbpKnWyAuipOlKoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjyp-002Tay-Ek; Thu, 02 Mar 2023 14:32:23 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjym-002Ta4-1R
	for ath10k@lists.infradead.org; Thu, 02 Mar 2023 14:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677767540; x=1709303540;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=19OQ4LezRgs8qvW8HyW4JG9UZ0u3ajKyxWFMUuLVXcs=;
  b=Vky3+aiP+7OIopRz2osMwEdxb3gjktLyI8wlZE/mNq+cnL7anRpdXTIj
   NE0Mw+XK3Q+9Cmz27aNmgTRHja3DIEx7uHg5qEndzqxU92I/dTCoj33Dc
   1Rek1dYhuYBFNKv29Bli+jNexbHVrUwGXF7lGd1TpnWF1NUyXPfyQeyMM
   7mUw8rRMimCSgdRVfmNd+ek9vqu8wmQJ5ZSc0j3EOcDigve7+oT5aILiJ
   mJbO8SciOPiVABpqaGbYC95HmYElyZ43dX15Bq1XpHErM8AuzDiLxWjUp
   DrxNwRFLzmqd0bw5vDweQV+nk8bwIdIjHc7397E6oREvaYN2/3SES/+1K
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362326955"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="362326955"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 06:32:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="677231724"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="677231724"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2023 06:32:15 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXjyh-0000WO-0s;
	Thu, 02 Mar 2023 14:32:15 +0000
Date: Thu, 02 Mar 2023 22:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 01c6c9fccbd51c1d9eab0f5794b0271b026178df
Message-ID: <6400b36a.8m/VeXtPvKfBFF7i%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_063220_150614_EB313DA5 
X-CRM114-Status: UNSURE (   6.19  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 01c6c9fccbd51c1d9eab0f5794b0271b026178df  wifi: ath11k: Add tx ack signal support for management packets

elapsed time: 1441m

configs tested: 96
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230302   gcc  
alpha                randconfig-r021-20230302   gcc  
alpha                randconfig-r023-20230302   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230227   gcc  
arc                  randconfig-r014-20230302   gcc  
arc                  randconfig-r043-20230302   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230302   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230302   gcc  
csky         buildonly-randconfig-r006-20230302   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r022-20230302   gcc  
csky                 randconfig-r024-20230302   gcc  
csky                 randconfig-r034-20230302   gcc  
csky                 randconfig-r035-20230302   gcc  
hexagon      buildonly-randconfig-r005-20230302   clang
hexagon              randconfig-r025-20230302   clang
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r045-20230302   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230302   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r003-20230302   gcc  
microblaze           randconfig-r011-20230302   gcc  
microblaze           randconfig-r015-20230302   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r003-20230302   clang
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r004-20230302   gcc  
openrisc             randconfig-r004-20230226   gcc  
openrisc             randconfig-r004-20230302   gcc  
parisc       buildonly-randconfig-r002-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230302   gcc  
parisc               randconfig-r031-20230302   gcc  
parisc               randconfig-r033-20230302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230302   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r026-20230302   clang
s390                 randconfig-r044-20230302   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230302   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64               randconfig-a003-20230227   clang
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230227   gcc  
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
