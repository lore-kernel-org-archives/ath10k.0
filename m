Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F74C001DF
	for <ath10k@archiver.kernel.org>; Fri, 28 Jul 2023 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QnufR/s9cXq3Qe4mDciNN5Zd8eqqG3ejcl7v3BxwZX0=; b=kzSs9j3MYOrJSb
	f2KKVT9mVjged0M9rjWj2hm97iUkmkFLnUmGWavnf8Et/6qPtwOWWJBnImltn9t1kfHmk2jST87GJ
	dI897MSvflLvXPGhLQgMEPJPG4AosJhiwq/wzSDDSTIMfzoByPsu7LgeAwJnA3pdaevRDjEF3q4Je
	Y/fwpC2oa21G4P9G0j12QprphGjV14Z9mJ7HHvTTY6KRXoPRzgLiAHcEzI2cv5n+VygOthyMn906U
	6ZbL5NPK2bLmJp22JiGLJGc5YoNlBdw5jJMBqgIcsVk0XiExZ3L2p8eYedEjkG7brx0gmecTm2GAr
	LvvMj6IJm/F8Ug+mwUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPFv8-001inC-0Z;
	Fri, 28 Jul 2023 05:21:46 +0000
Received: from [192.55.52.115] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPFv5-001ilb-1L
	for ath10k@lists.infradead.org;
	Fri, 28 Jul 2023 05:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690521703; x=1722057703;
  h=date:from:to:cc:subject:message-id;
  bh=VwTPWsG5HFejCSgks2R550mv9OtW9PlUiv2EV1FZ554=;
  b=WdhMUJK4aJRyq8CPv/7RxbOqnWFp9vt161HQmG43bp6RUtTkUSnSSU6D
   8ZzkM4fBZjEcH5FoHVlOtAttEV8c7eOQZfvtXErbpJWN4hBPYEIAR4wE0
   1Ta1BRoomntQiQO3Pm3AkwlEvoPGof0lZqUnvdvB3avY8xBYGZi4OeVde
   kpA9rvBXAXkN/zxaQtfAFBYM+H4Z61cTkIaPHfoTylEkFWE49x1t4gswX
   xBAAawwLRxZ6pZnKQoW4DJbpQ1eqs7k4edSkv1t6AT3x2NUYx5oP1qnQk
   uErWU2InlGj35g6UZZ7iIcVC+db1DxPPz9hDYuq1aI/LguoDvq37n13dT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368526162"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="368526162"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 22:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870722366"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2023 22:21:34 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPFuu-0002um-1N;
	Fri, 28 Jul 2023 05:21:32 +0000
Date: Fri, 28 Jul 2023 13:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 8ca823d3466afe2423405d4135c3ae60761e6ec5
Message-ID: <202307281336.XWYdon5c-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_222143_466189_27DC68FE 
X-CRM114-Status: UNSURE (   5.30  )
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
branch HEAD: 8ca823d3466afe2423405d4135c3ae60761e6ec5  wifi: carl9170: re-fix fortified-memset warning

elapsed time: 721m

configs tested: 105
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230727   gcc  
alpha                randconfig-r024-20230727   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230727   gcc  
arc                  randconfig-r021-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230727   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230727   gcc  
hexagon              randconfig-r041-20230727   clang
hexagon              randconfig-r045-20230727   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230727   gcc  
i386                 randconfig-r012-20230727   gcc  
i386                 randconfig-r032-20230727   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230727   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230727   gcc  
m68k                 randconfig-r034-20230727   gcc  
microblaze           randconfig-r035-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230727   clang
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230727   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230727   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230727   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230727   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230727   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230727   gcc  
sparc                randconfig-r026-20230727   gcc  
sparc                randconfig-r031-20230727   gcc  
sparc64              randconfig-r033-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230727   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230727   clang
x86_64               randconfig-x012-20230727   clang
x86_64               randconfig-x013-20230727   clang
x86_64               randconfig-x014-20230727   clang
x86_64               randconfig-x015-20230727   clang
x86_64               randconfig-x016-20230727   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
