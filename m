Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35ADC4332F
	for <ath10k@archiver.kernel.org>; Fri,  9 Dec 2022 06:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Y1HeV3S90CWc53ZK77xHJirFXgIOMS5NVFmcUAQ3aY=; b=JRWSJJAf+6xBlX
	JeM0W1AUFFKICI1XIx0cn9MQDzsvUwrBkwKM4WauVZv3/s/RRNCa2cYQoZYEa8nBDdJgPpz529Hmj
	Mmod7bXKd3Z7jGegfwUD0BpPFdHCfGbAmlmKSgQ0iWVNEWm2sgMsc62NI/ZdELFFBvoAt6DdFvvl2
	IW9XsF/FG9QFyHnhtJ7/F5OpfvYDtM+ZJxTFNb+MA0Sg7Ik22c0kXQvLq/Nn1Yz2bPB1GwAdGTha6
	UDMSW67o8Bx0W0738UxCV+xtY8LDc91ZTTAse72IRVzBczFgTox9ey5jUaLlINCDKRK52H9KLTrMv
	KT8nFq0jDVi3S/RNFs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Wwf-004cFK-A3; Fri, 09 Dec 2022 06:33:17 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3WwZ-004cCU-JM
	for ath10k@lists.infradead.org; Fri, 09 Dec 2022 06:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670567591; x=1702103591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/DvCI30MnIB0KFuI1WRzJwvO091wG3Ma/CxbKwKduXM=;
  b=n1+rsVTLdzpr0FjC4x8Zptow+kZNo475jjpQXZIOX1Jefl4vD+kpqKLL
   vzfwmhrUl3iD9LGkRdC23nUKzKI01TmIrlSOvRcFFcckEAOd9HuOMc6/Q
   eQEgceFK+LEZqJMQJenCYLhdavUOB0dFbsRSNsgMca9LHCrlzAIo0STJt
   sB43/cljV25FxCkrfs+TkPLuhbzoH1AHIQqwKuPGQ27XiNkDEff0HgEbn
   86evRLgWP5ZuN+glwAxLQPBD0sHluvzVH56xIxV6Z4I0NQznH5hxYDoR3
   iMpncTiW3bjK9ubkw7oQe4gNgMGS/cLyZgS1TfxFHfi6E34HAZ247o+jq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="316098586"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="316098586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 22:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="597634598"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="597634598"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Dec 2022 22:33:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3WwU-0001hD-1p;
	Fri, 09 Dec 2022 06:33:06 +0000
Date: Fri, 09 Dec 2022 14:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 620316837505a32947ddcd996897296dccd4251c
Message-ID: <6392d689.ZbrDVO/fGMkMEGZL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_223311_669216_7866678F 
X-CRM114-Status: UNSURE (   4.66  )
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
branch HEAD: 620316837505a32947ddcd996897296dccd4251c  wifi: ath10k: Implement duplicate detection for non-offloaded PCIe

elapsed time: 725m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
um                           x86_64_defconfig
s390                             allmodconfig
um                             i386_defconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221207
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
x86_64                           allyesconfig
i386                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                                 defconfig
x86_64                          rhel-8.3-rust
ia64                             allmodconfig
i386                          randconfig-a001
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a003
x86_64                          rhel-8.3-func
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arm64                            allyesconfig
x86_64                        randconfig-a015
arm                              allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a015
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
