Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2B3E7B5F0
	for <ath10k@archiver.kernel.org>; Wed,  4 Oct 2023 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ga5QAUCYmXyBIFgqwFb9HymkurRMQy0XGgvWA9eDQ8w=; b=3yt60QVJE6azEe
	acfM+tdcElmTtt/GNx8rDr97UCL5oUJQNcUx+/G6zzwovu4iiNe8wY9V+t5w7WNDkv1ellskbjWpt
	e6zNZPTH0SsK3pFv6tHxA4R3C9pkK0ONPcN8yp/BWX1OoB0CiK3yCMm6lW0OOQq2PGqHst9JQRXy/
	9jjoHpP9oU4+PXgjMoqWw/FrYbV8HgGZWtuAVLCRV4ptW0U9jnWifk2SMRPSrSMtOpTCRSZXpu0sR
	fYcX1jlTOwcZTksVY5z4IRYJj7DQIhy6vTugVoU7E1tEHS8GgGGj7OFbjbbPH0EBAwPJYCCkgkGvg
	hjJO2BQ0bsqe8ZGOVbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnzkW-00HRQV-3B;
	Wed, 04 Oct 2023 11:09:04 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnzkT-00HRPj-1g
	for ath10k@lists.infradead.org;
	Wed, 04 Oct 2023 11:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696417741; x=1727953741;
  h=date:from:to:cc:subject:message-id;
  bh=/ckiuPYgZW6j6NRkcaJgbnmhtDRB/1tnPUZ264c+2jA=;
  b=Uo97/jUYlngw3LtscVATz7d2owXPQT+jt75Q1CC34LrcHyDbESAN+9Yw
   /mJsRJ8C8YOXKBB4lpRhe9bRgzCW+0okBd1Jtpdj0oclWSRP9aHLFX6ol
   cZeuxacR8es13Z0RGsaICcaqBJZSFplgGB+zWnSKJPTYeZoAsU2jKzkb0
   dggDJKiONxUlY/3PxdC+EIkj9+w3YdaM2bzDEppNYe1G02xVspSGIJ+Ab
   l1rdL9b97b8px8OfaVzX2raNZYjocmpykne0e5PJf3l1fjTJCCYxg/7oq
   uRQ1DlUuSzHlWRVxvQxHCXdxRmyL8cTIcfPegBF6QqtiXdmYD+bDhEmn0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="385956926"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="385956926"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 04:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="867299077"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="867299077"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Oct 2023 04:08:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnzkP-000HgQ-0G;
	Wed, 04 Oct 2023 11:08:57 +0000
Date: Wed, 04 Oct 2023 19:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 322a487c53f84e4586f5bbed33bd373e25abfe42
Message-ID: <202310041922.ShGQsibx-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_040901_629408_A724D897 
X-CRM114-Status: UNSURE (   5.73  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 322a487c53f84e4586f5bbed33bd373e25abfe42  wifi: ath10k: simplify ath10k_peer_create()

elapsed time: 1217m

configs tested: 108
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
arc                   randconfig-001-20231003   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231004   gcc  
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
i386         buildonly-randconfig-001-20231004   gcc  
i386         buildonly-randconfig-002-20231004   gcc  
i386         buildonly-randconfig-003-20231004   gcc  
i386         buildonly-randconfig-004-20231004   gcc  
i386         buildonly-randconfig-005-20231004   gcc  
i386         buildonly-randconfig-006-20231004   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231004   gcc  
i386                  randconfig-002-20231004   gcc  
i386                  randconfig-003-20231004   gcc  
i386                  randconfig-004-20231004   gcc  
i386                  randconfig-005-20231004   gcc  
i386                  randconfig-006-20231004   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231003   gcc  
loongarch             randconfig-001-20231004   gcc  
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
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
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
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231004   gcc  
x86_64                randconfig-002-20231004   gcc  
x86_64                randconfig-003-20231004   gcc  
x86_64                randconfig-004-20231004   gcc  
x86_64                randconfig-005-20231004   gcc  
x86_64                randconfig-006-20231004   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
