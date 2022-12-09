Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82473C4332F
	for <ath10k@archiver.kernel.org>; Fri,  9 Dec 2022 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DvMMkOH85j6Lr8UtMZ75BPNKAImnSwfNsNGxmIt1BM0=; b=JxBe5bUGzcrmGP
	04lCYzpOvtQrgRdszXAUHX7v2S6GrSfDwRdB3Z9cVlI/a9jEctZy+cNxJi7XL18hNwGfuYXYaMZ6A
	5zvmfqi3MBfBcWiSpO4eYsQIdEfMEk7OVo24824aOJm60Au4xyv9xdDWyEr25Ta/YyU+cBWzxoCm/
	37B7mADAoXYhytSgqDC8XmB3ICycn/TdymUhOPXOwzRcFJEs+17gOPFwGnJR9lupCFqyhjXTDbZKo
	qA8djxlzOQTNZsgjjckIClQIQj7Mi9uXLzQtDIjprLcQ2Pe96uNiPHoIqQ9cnt8VDo4yoqE7KlYvg
	vet/51hdk/VJID8SR2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Wwg-004cFe-SC; Fri, 09 Dec 2022 06:33:18 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3WwZ-004cCJ-Jq
	for ath10k@lists.infradead.org; Fri, 09 Dec 2022 06:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670567591; x=1702103591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+OGwkjMJXsnXZHQnYQPcMOYL74kovAavdZSD1tS0FJw=;
  b=GrZYYeBLd2puQdkbUZppGET0zwhigwRakodj0aKxXmqhb7KySJKFDbkg
   fc14n1Y3p8U0W8jmu95loNk3BgRM8OveYsT8vM3iNP41XMxnuvVzm7IYi
   azDy681QLxWrJ9w1P/R16olcWKCUySoCa5f3Ebr+Z+wq7W4DGsmYCbVBs
   m9jSpJicQKZ3W2iuuEwPrREsANYQKgOfnbMHzzi9XFb1KbRAtWFwiO7Hx
   fcTD96PdXNVwXrvpvQWsa7kaNMvHze6SQGuh3+h9eI3dLPQ65hoPSJjiX
   rMu7LvrG23UvN88lfGdz2O4Ipq81mzr1R2FvqndnwKyU526s9FJmJztoj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="319256176"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="319256176"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 22:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="715922153"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="715922153"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2022 22:33:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3WwU-0001h8-1Z;
	Fri, 09 Dec 2022 06:33:06 +0000
Date: Fri, 09 Dec 2022 14:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 922932ca02191a390f7f52fb6e21c44b50e14025
Message-ID: <6392d683.eopDP7hvEcH7xHrm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_223311_720247_B6FCFE7C 
X-CRM114-Status: UNSURE (   4.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 922932ca02191a390f7f52fb6e21c44b50e14025  Add localversion-wireless-testing-ath

elapsed time: 726m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
um                             i386_defconfig
alpha                            allyesconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                              defconfig
arc                  randconfig-r043-20221207
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a013
i386                          randconfig-a014
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a003
x86_64                        randconfig-a006
ia64                             allmodconfig
x86_64                        randconfig-a015
i386                          randconfig-a005
i386                          randconfig-a001
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a013
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
i386                          randconfig-a011
x86_64                        randconfig-a012
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a004
x86_64                        randconfig-a014
i386                          randconfig-a015
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
