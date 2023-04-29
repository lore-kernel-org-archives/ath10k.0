Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2660C77B7E
	for <ath10k@archiver.kernel.org>; Sat, 29 Apr 2023 05:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ok9vyMYL/OrkEghSHikmB9S7Eu7aS5o/9SxFL3lEMF8=; b=B0tz6/5dIQYE9Y
	i1oUtjiDGt74a9Kwl1Bn4jyKh2z2YAxP/tLJsMkLtKPb2ZKHB41DXe0ocYySCtJ3FW4gEjyzS8hwI
	iK80mIVr5St6E+jmk5xrzQ/Em1ywQEsozAckBD1UkfGCduzrBDFk9Wxdi4jqEGYwxLlFeIh6XbCIC
	3uSgSwmMci+3MwxtXFXK+JydFPxFwGI3dXVKZPS8s9uaNz6ajZ8eS/qkov/vkd2/GAJHJ664VeySL
	xLBdQcvjkjZbw4Nd5gm1TpEYLx3NgL2C6KRP07hrD895btxB0JjpPLg7nMzLG27c8+xGGY8A69FPR
	4CJVVT5nuQFTjC7/3NzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psd7v-00CGSm-2z;
	Sat, 29 Apr 2023 05:28:07 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psd7s-00CGRV-1m
	for ath10k@lists.infradead.org;
	Sat, 29 Apr 2023 05:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682746084; x=1714282084;
  h=date:from:to:cc:subject:message-id;
  bh=jcmjCk6C/RaXSy9BXp+xa9wloqbjpgRAvZQ7b7AWKUE=;
  b=Talf7TA+MnU7OGMerKYSMZHNl8qPb93tGahItIOzZ2430jIN2WqR1OVw
   eaCCsOwT5V6pcDufMwq8GrAiTUVhQbNBJnuB5IezTj3GV4P/H9nJw+QEQ
   ISW6mV58LL/I6iMCQbfX+TS2SekUFRnsFT8uKkw0LlGXm2va3EaotzbEi
   1A/sBGV9EPrVmcNqCQaCPdxem3dyVb5n8CuLXZxpWLFYLZSbTuITw6cvh
   7eDa+H8rrd1eq6WEQTfmULTqM0nL+CVqWWj0dem+58HE0lEY2oib4q+xX
   uWEMV5+/QFqXZdGWaz6qF4riU+H+Nu31PCsbcHeY7mZeEMegyweG2SGlh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="337003591"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="337003591"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 22:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="764582983"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="764582983"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2023 22:27:54 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psd7i-0000vP-0V;
	Sat, 29 Apr 2023 05:27:54 +0000
Date: Sat, 29 Apr 2023 13:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e2ceb1de2f83aafd8003f0b72dfd4b7441e97d14
Message-ID: <20230429052732.fBZNT%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_222804_936770_96A239C6 
X-CRM114-Status: UNSURE (   6.70  )
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
branch HEAD: e2ceb1de2f83aafd8003f0b72dfd4b7441e97d14  wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range

elapsed time: 723m

configs tested: 98
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230428   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r032-20230428   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230428   gcc  
arc                  randconfig-r033-20230428   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r006-20230428   clang
hexagon              randconfig-r041-20230428   clang
hexagon              randconfig-r045-20230428   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230428   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230428   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230428   gcc  
loongarch            randconfig-r016-20230428   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230428   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r003-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r025-20230428   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230428   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230428   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230428   gcc  
riscv                randconfig-r026-20230428   gcc  
riscv                randconfig-r034-20230428   clang
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r024-20230428   gcc  
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r035-20230428   gcc  
sparc        buildonly-randconfig-r001-20230428   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230428   gcc  
sparc64              randconfig-r013-20230428   gcc  
sparc64              randconfig-r036-20230428   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230428   gcc  
xtensa               randconfig-r005-20230428   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
