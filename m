Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711ADEB64D9
	for <ath10k@archiver.kernel.org>; Sat, 17 Jun 2023 06:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1/9xOkQwLvEuJD5efk7nltNcIvmW7gzR+ElswU/LU9U=; b=AceHOdYt6S3BIa
	llDBpYGUM4Z2ZDeVgWSDsToRdKVx1V7+bA7XiD1QoougEpLRsoAihECROn4eGWAl+ntoTwo50l6ot
	p2tV/t+uv+VdPMg/2NfMGtQ1ZW2wpAYZfj8cVBIO3WNh9INwI021iQjogUVLAjlqLT4XR5UhbUyUE
	BFhQrmkJ0W7Nb2RGEX9VCF/ujk2anBHuncqF348AgjZMGmQ/zAl1ZNV7UOKl+HlfqDFjoXp1Yuhrt
	41TOpHf/jAiBrkB766TvFtpUjR0T9hjY0X6XEQ+4g/P6Zvyn6OH9mBIIWke6U9xeAJfSS+VUG2h7q
	d7wQVnOGq+5FrJmlRJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPT3-002tNy-2R;
	Sat, 17 Jun 2023 06:31:25 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPT0-002tNR-1h
	for ath10k@lists.infradead.org;
	Sat, 17 Jun 2023 06:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686983482; x=1718519482;
  h=date:from:to:cc:subject:message-id;
  bh=P4FSUp7VLVyg90jSogKfJJTRCFfRqjrsdDm2LX41PTM=;
  b=aOJ2cPHNGGlwld3gbXYEGBFnKT1MKlS8UxPWOIxcFiRvj8AHGIxaiB40
   DEPkrymJWO+Ne7Ed778i7sky6NMkMwF49kzM6bIe2af+ypAyzoG3V6Uma
   frE4NzVHFxraAP/d0fFxKtdVo+xW47WiLn1vM8++60FQcLBj+oJ1HrOeh
   TJ+FOhjsMYRCiW80+rv5tLT3LDL4lVWPsUIH39pxVVlRjHndpE96zFtTE
   5yZ+S0r6XzELHm5ccr7UyRg0vmd/GZvqLjoS6LLn/7IXNjeyOZGlCsFm0
   IVsm7436mkWTfhzURTCCcK1RtWL7atYgj9b+iBbjMNyAGk0oqQaI7Fdtp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344104999"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="344104999"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 23:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="803070829"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="803070829"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2023 23:31:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAPSx-0002O8-0X;
	Sat, 17 Jun 2023 06:31:19 +0000
Date: Sat, 17 Jun 2023 14:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 7f6ee56ca0df0484338d12cd142fb5ebde8875a9
Message-ID: <202306171415.8UpIOXLv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_233122_641146_D883292E 
X-CRM114-Status: UNSURE (   5.85  )
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
branch HEAD: 7f6ee56ca0df0484338d12cd142fb5ebde8875a9  dt-bindings: net: wireless: ath10k: add ieee80211-freq-limit property

elapsed time: 830m

configs tested: 68
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230616   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230616   gcc  
arc                  randconfig-r043-20230616   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230616   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r032-20230616   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230616   gcc  
hexagon              randconfig-r021-20230616   clang
hexagon              randconfig-r041-20230616   clang
hexagon              randconfig-r045-20230616   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230616   gcc  
loongarch            randconfig-r025-20230616   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230616   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r023-20230616   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r003-20230616   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r036-20230616   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230616   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230616   gcc  
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r033-20230616   gcc  
sparc64              randconfig-r022-20230616   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r026-20230616   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r034-20230616   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230616   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
