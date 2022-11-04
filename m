Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D177C433FE
	for <ath10k@archiver.kernel.org>; Fri,  4 Nov 2022 22:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6auhDgS8AUt3+iFOq8yiXDke1u/GBYWU4Qz57IW+4dA=; b=2KgDnysRh8u59Z
	WVUN/+nwT2CFmJRCT/Gl/6sypNxaImIY/+Snyp36OgF7VA46BHZ1Z669tvCH/gQOBe2EdbQYbAxZ5
	kOUdr2k5hJNdLf+Er+1RBd21dSYo7QInZFDjO/0ViLa0gob5X85SARCkriO7VZORhKs2g3pYK+uyB
	Eg/+dOMIQatNVGcaAlKuWt1ZfjBUyNp6oAu3GpoH8aT33UA1IOHVz44G2T5mMZCwsDa39ULF1Pa4u
	pE7/mYyURnETcCWVAC9I1FyjSPpGJnbS/pVfpYkYs+yTXhIilLJv2ZHL2NBsS0+prU4caaFngWlAi
	X4qZGp5dd/chTRhFXZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5eE-005RiQ-Rw; Fri, 04 Nov 2022 22:58:50 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5eC-005Rht-K9
	for ath10k@lists.infradead.org; Fri, 04 Nov 2022 22:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667602728; x=1699138728;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KZYngywFyao1SvqJhL28q55MTc9fWEY0CNmiqRf8LtA=;
  b=knKOwcEGhZa+DrQ4bn1KHI55lHyhMq/tZnHBTDDqJaMh2Bpt5GxPj6b/
   bG/+KsNrntKon9wkmlqaGthxVxpw1ghOggHFrr8aUF++PigjRNm5GC3JZ
   bCAZsCU4vLeAFmORwcugV5LWhp1YRGv7bS6kk9MkIARDx2jM3CtfUp4m9
   g3a93GYimiciKEQGdzEqlcGLoKOF8MY5d2MTnnNs/kANHbWVvDJHYqvqh
   gj3pyMMUSp0XHUi173qS49/jSBVdaJ0txMFoDFKl00EKHDu0u1oQkUgsl
   L1Vi/2Iv9lmXmnQ63Edwqlo/ehvK2MnJ/uB0ObLUju5LWAA6640Sl5WD8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="310093180"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="310093180"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 15:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="586341072"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="586341072"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Nov 2022 15:58:43 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1or5e6-000HPd-32;
	Fri, 04 Nov 2022 22:58:42 +0000
Date: Sat, 05 Nov 2022 06:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 d1ccdcc235931e74695d84596154641bccdf9a3d
Message-ID: <63659921.PPSBYe8xmDWU6o02%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_155848_747596_030A9C4A 
X-CRM114-Status: UNSURE (   5.01  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: d1ccdcc235931e74695d84596154641bccdf9a3d  wifi: ath11k: Trigger sta disconnect on hardware restart

elapsed time: 723m

configs tested: 78
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                                 defconfig
um                             i386_defconfig
x86_64                        randconfig-a015
alpha                               defconfig
um                           x86_64_defconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221104
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
i386                                defconfig
x86_64                              defconfig
arm                                 defconfig
s390                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a003
riscv                randconfig-r042-20221104
alpha                            allyesconfig
i386                          randconfig-a016
m68k                             allyesconfig
s390                 randconfig-r044-20221104
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a014
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a004
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a005
mips                             allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
m68k                       m5208evb_defconfig
sh                   sh7724_generic_defconfig
powerpc                   currituck_defconfig
powerpc                      ppc40x_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 linkstation_defconfig
arm                         cm_x300_defconfig
powerpc                     taishan_defconfig
powerpc                      ppc6xx_defconfig
mips                     loongson1b_defconfig
arm                           viper_defconfig
arm                       multi_v4t_defconfig
powerpc                      pasemi_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
hexagon              randconfig-r041-20221104
i386                          randconfig-a011
hexagon              randconfig-r045-20221104
i386                          randconfig-a002
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a006
powerpc                   bluestone_defconfig
mips                        qi_lb60_defconfig
x86_64                        randconfig-k001
mips                        bcm63xx_defconfig
arm                        spear3xx_defconfig
mips                           ip28_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
