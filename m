Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E154C433FE
	for <ath10k@archiver.kernel.org>; Tue,  8 Nov 2022 23:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SXXFr3YToZqkzKp+gtSqpoECFbYAcGF1C1/DyUCiNWU=; b=w98h2RxklXqQuP
	XIO7s1KV8FpyWy6UFF9r+6NdlcgUPRywRSTBpKOX/PIVBUrMMFsHKM7Yict/rj6RHHYoSJwX31g4G
	Q/PdeGvlWPQg23B2dekpL/vQquXEak47m+x0ofPjYxSgyAopTR62H4U7gva5rlTw8R3GKNmK3OCvd
	SWyu3NGQkgfeY5uMiY+t04cIjrXFhdQhb3eHFq3e948p0/gQrbDeqPsWfwyBz8S7DL4OJREkUUqWG
	WgiubEm58yOM8RYURcCKp3Fc0fmqDMpaRxIzgYo72IXfhwzPP3Fiyue+8n/txIN8HdRkHvZhqyZLo
	Yn/NDtQzHTklEnYZX1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXZu-00917I-Mv; Tue, 08 Nov 2022 23:00:22 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXZr-00915h-Sh
	for ath10k@lists.infradead.org; Tue, 08 Nov 2022 23:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667948419; x=1699484419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p/knkROYb4vYS29d2DppUbBx2pPIrI6qrsqBTzptPRQ=;
  b=cm4YSYKIB6ksckFHI20CTFxoT0iBtnIYG6+0dx/mB1sOglruIK6jLe2u
   273qd4VFFjJ0Lsa75xjdqm4S9QuUAtX2UyEoaD2HPNjj8fJeJC3fHf2o+
   gIO8oWy9/5UNKKb+Uw8itpNP7loXdQy/EGypJQRgNxNOlZBc98pMVMcIh
   4faj4ZtyuxkLwK7XNZsiAFb5BN5tURUrDWcw/4HfgZHrgYIR9dhnxL4I2
   AfBzbOElrgS9cF8GWXqLR8ad9wllZ48X/7FNKVKqr6WbgVfQ9I5RDU5Sb
   5pMSybol+G3XN7ppy/SDSVzRBngDhDF4LcVcYro3AgN+riO/JFGcEKg7O
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="311988096"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="311988096"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 15:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="725727955"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="725727955"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Nov 2022 15:00:04 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osXZb-0000hc-2V;
	Tue, 08 Nov 2022 23:00:03 +0000
Date: Wed, 09 Nov 2022 06:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 b4525848642c946b05956d05354faa9a87f22bf3
Message-ID: <636adf49.+2XTWIeAFObX88Od%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_150020_003118_0A3ABCBE 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: b4525848642c946b05956d05354faa9a87f22bf3  Merge branch 'ath-next' into ath-qca

elapsed time: 726m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
sh                             sh03_defconfig
powerpc                     rainier_defconfig
arm                           sama5_defconfig
sh                     sh7710voipgw_defconfig
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107

clang tested configs:
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a011
riscv                randconfig-r042-20221107
hexagon              randconfig-r041-20221107
hexagon              randconfig-r045-20221107
s390                 randconfig-r044-20221107
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
