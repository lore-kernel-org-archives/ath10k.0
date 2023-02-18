Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73443C6379F
	for <ath10k@archiver.kernel.org>; Sat, 18 Feb 2023 04:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vwZ0w4EcZPJPWtl19ppGNm87IHUg38sB/W63lRueli8=; b=Q28BN0CWW6nsSE
	ExBeywMudgB0jd8CHAxfdI0+rDx9vUm0ydxMZF25sVkmlURpdcysAOWZqrjPh3DGB7Al9njN/s/JU
	DN3hzHlvzFGwmJX+FwPE3cNeyK3/3BNbFdDcyL9mhOoAgo0gWHdEuTVy3q0PDZhbJvQzbjZGet0bx
	NC9J8lwi6FIquzzsbAYI/qUTyPT3d8uX9/3eN9Us6UBTyjYQ0S+sRzV8zI5mM8faMSD8bnElQlAeo
	hKZ8WM+Ex8lGzZGJGM6zDJ5pVIrTdRa1HZQeKqhYv6t0+cfOKSg+9SASLHhcmJAx/CdiOwMyMB2Ey
	uO1FYoHmNQ8VFu5iTwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTEz0-00GLRW-Mi; Sat, 18 Feb 2023 04:37:58 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTEyw-00GLQn-Rh
	for ath10k@lists.infradead.org; Sat, 18 Feb 2023 04:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676695074; x=1708231074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F2QVDXYzBVGY4oGJLTSresAxLlS1FmlUTeUkH0XXDZw=;
  b=jeYy+cLeiq5QPavS14lu5/u1MLU/LVTC04eUNgd9R4kE02bP/nqPIG+W
   Ihze6xn9PXzo6x2lqWpxWefZjOra2MdVn0SP2S8b4z2Z5EWUFJQDuUcFm
   a8fglSysommJjyv296fcg5WPKiWrfmMNHzPZiQsk/PLstnlMgxh8rKze9
   MThbApO3qryKYPfH/jAnTFdBR+bk7ZUWLmoiJIjfrWaGLFMnhm2wdiid8
   3plVgw0Gsn0+zquVXCmSjL8FA3kl2aTBoqqM9aFosQgSU6PPEimTU4wcQ
   UwN6ZfMRI0Ov/DzQTDkbnCgi/JLPFkeyEQEUyzfSf6xPpQjPwgGcu7YcV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="320251991"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="320251991"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 20:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="734542372"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="734542372"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2023 20:37:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTEyp-000C7b-1V;
	Sat, 18 Feb 2023 04:37:47 +0000
Date: Sat, 18 Feb 2023 12:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 bfcc8ba45eb87bfaaff900bbad2b87b204899d41
Message-ID: <63f055f9.OX6Jabou8mwQtJcQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_203755_025235_765FA996 
X-CRM114-Status: UNSURE (   5.88  )
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
branch HEAD: bfcc8ba45eb87bfaaff900bbad2b87b204899d41  wifi: ath: Silence memcpy run-time false positive warning

elapsed time: 722m

configs tested: 78
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230217
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                            ar7_defconfig
nios2                               defconfig
openrisc                         alldefconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                     taishan_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230217
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230217
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-r046-20230217
hexagon              randconfig-r041-20230217
hexagon              randconfig-r045-20230217
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
