Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21FDECAAD3
	for <ath10k@archiver.kernel.org>; Sat, 10 Sep 2022 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZMAh9rDFmtHK8C6IHvh8CKByHx9Ofq1h0HlhyfLNcd0=; b=J2S0DdWwV1HgMz
	2n2SmJId/2bNQbSFBChQBDooDBkD5wFzEgEneRT3A2WFjC2/blpQIHgY1J+dWy0nW2l0maMgaGdil
	wDjy1VyRZl7TJsafXWBl+EXiBk94W78X7Tmzhy5UJq/oXFeyc7b96ONEHzMcvufk+xaULv4clSYe+
	7WljRwmESTqqaIc4x1mbyeOHavL0ARArx2ZipTJxhlMjqUPPRkyBx/Z9rXwvsEocSPpn1B20zzDZc
	B9OmVUUmMmLHwtuEcuW8acvC+XdRAN4HxTWvsSgNkl+t0Nuzip/N1VqbWm9foAjpRfg+hFJPRxFCF
	XwghdBxw1eWdanB3qOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX5bk-00CQeA-1U; Sat, 10 Sep 2022 18:53:36 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX5bh-00CQb6-Se
	for ath10k@lists.infradead.org; Sat, 10 Sep 2022 18:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662836013; x=1694372013;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y1b7MH2rsuyqA9DELgqpwNIwq53P2BDaY5Bn1UjBj2w=;
  b=KlTQXmnqF0dwDZ6CANSQ16wuBvnSq4+tDdNAIaZ+hePqTyEOnuYstpg0
   rCNgxMRwAEv0gIom5Oz75CW8KEOnKuB/hdxAKGmLMrXrYRaeidoi4fzBg
   wVvLzLCVyydz81NYgOX5aK65xq4MRUjIkRZtO+5y+61x6ICa8dWCauATY
   TAXISgW1iIVJhKAXHHxgYLsER32PJLXi1J8R6wXSzXGXTRXbgpO7PkJ/y
   sjFhxBQqHA4szNEezPaEoJyrJitl2N2RAdYA8a++KPGBX6KgRkweU85yI
   zOWe8f94St+ParC1mlHZr/FC1t8WQkbeJ14c8RX6/1yAShAtOaTDGeYu/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="297666997"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="297666997"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 11:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="757951662"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2022 11:53:15 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oX5bO-0000O5-2s;
	Sat, 10 Sep 2022 18:53:14 +0000
Date: Sun, 11 Sep 2022 02:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 a16730312d228a5b5d906cd1e43686f80e1be94f
Message-ID: <631cdcea.kw3PyyA/ppWnE2F/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_115334_004399_241C5ED1 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: a16730312d228a5b5d906cd1e43686f80e1be94f  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 721m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
x86_64                              defconfig
i386                             allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a002
arc                  randconfig-r043-20220907
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a006
x86_64                        randconfig-a011
m68k                             allyesconfig
arm                                 defconfig
i386                          randconfig-a001
x86_64                        randconfig-a015
i386                          randconfig-a003
x86_64                        randconfig-a004
i386                          randconfig-a005
i386                          randconfig-a014
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220907
riscv                randconfig-r042-20220907
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
