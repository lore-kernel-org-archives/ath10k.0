Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07393C77B73
	for <ath10k@archiver.kernel.org>; Thu, 27 Apr 2023 06:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Rk4FvcOEhjYg1Arx4WY+LpMs3j0uSS8sdOxnY6Q4sY=; b=MyXH6goaLUNU+b
	y9uWXUXU7WdGUsnrMNT63FvWYFbVjWnDHwoGMRYkKSroNCrMA7kGrewuRaT0ZC+OuWQNJ1PKQNDGt
	uv1439dKklRjRYGsS7aI3vTb0yzQIQXLkzGea+sK3qB1Udgb0CSMvQPE74s/XpmV3mVt5ndS2X1Fj
	ZJr1UMw7yKnlNd7uiZGjmmhSzE+fPLM/RZO5qwNaSZN9sjCrGw+3GjxEe8iAqkNeF+S7IUDWTn92G
	BcOEHdwkk9JP76sW3um1tyJONsNIoxkuQxczB7U1uRyK/sapYtJDNvTVVNPCJapMuT12gZKaDEl6h
	abZQohn1ELbD3INiAaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pruyM-005Xz8-1V;
	Thu, 27 Apr 2023 06:19:18 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pruyK-005XyU-1e
	for ath10k@lists.infradead.org;
	Thu, 27 Apr 2023 06:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682576356; x=1714112356;
  h=date:from:to:cc:subject:message-id;
  bh=7olPXrAFwcHT9tuFvyi1Cx8zWuGuCzQw+Uzu1jbN0bs=;
  b=OjGtfFXmoNSyAnnxDlDd1vi/C1A48A4OBO7NSxDA116J+ENAGNSRNhKk
   Nm4K3Qm8Ar4LHc6+T7kh1x62kPPxs8XSkSetJdCUIyqBr2CDdqBIAjw3+
   PADznvSRpzw/I9IBKNRvLN4FM2BNZEMvRUfd6nHfyHAwebYnVcQSNzWuy
   x6wTfBGxcPzlcfb52YgOgPCdt7XO7IkVW/+3/p0HqghtF6qfpOXtVM0Xm
   xc0GfBeXbFQo+ydg+983JkW4xRBlYz2zM3Lh8q5cccKmX5oRj9gfzAcQq
   4Oa4uT0W0J8Fpk5Dw1M9s3F+gjgMyUBFnIYOkB38n9nPJjKMa7PLVCvGK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="350176923"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="350176923"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 23:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="940538904"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="940538904"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Apr 2023 23:19:13 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pruyH-00002n-0r;
	Thu, 27 Apr 2023 06:19:13 +0000
Date: Thu, 27 Apr 2023 14:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 286393e53b48ec9bf20cc54a2e6825b8a36f3d8a
Message-ID: <20230427061844.2kN4D%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_231916_593371_BECC9A5E 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: 286393e53b48ec9bf20cc54a2e6825b8a36f3d8a  Merge branch 'ath-next' into ath-qca

elapsed time: 912m

configs tested: 97
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230426   gcc  
arc                  randconfig-r024-20230426   gcc  
arc                  randconfig-r043-20230426   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230426   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230426   gcc  
hexagon              randconfig-r034-20230426   clang
hexagon              randconfig-r041-20230426   clang
hexagon              randconfig-r045-20230426   clang
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
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230426   gcc  
ia64                 randconfig-r016-20230426   gcc  
ia64                 randconfig-r036-20230426   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230426   gcc  
loongarch            randconfig-r022-20230426   gcc  
loongarch            randconfig-r031-20230426   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230426   gcc  
mips                 randconfig-r025-20230426   clang
nios2        buildonly-randconfig-r001-20230426   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230426   gcc  
openrisc     buildonly-randconfig-r002-20230426   gcc  
openrisc             randconfig-r023-20230426   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230426   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r032-20230426   clang
riscv                randconfig-r042-20230426   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230426   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230426   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230426   gcc  
sparc64              randconfig-r014-20230426   gcc  
sparc64              randconfig-r033-20230426   gcc  
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
xtensa               randconfig-r006-20230426   gcc  
xtensa               randconfig-r012-20230426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
