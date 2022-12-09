Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCCCC4332F
	for <ath10k@archiver.kernel.org>; Fri,  9 Dec 2022 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HU4pY0jHXvBYZxzfYngtAM7c3LVnG1GplKUlu+U84OU=; b=gpDOfmFZeWNhH7
	Ok5Lm/zuf5d//k8Vuk1AkcwQpQUS7PmjoAOmLuWsfLa9qWMvHfb45C/kr5llgf5HYCiPyNQDCKW5Q
	lNZGXgzinwWxfH0JzZUK+3BXUi9f5W9pmdiMwXN5di6/dmEkA8kM0qgiFkIhrvlX8hkF/CI6wkloR
	W1aCcQftCON0iWXXvwx/ChjcwwF/CRTTxUYm2nuYsQOU/7/8Ivopcj5F96DnV4c53+WntAroEzoiV
	KpzmxauzvlnHAkbwG40OMGrBsNgk1Rv8ws+oPMag4qMDl9zGCByD8AfCvhDFOcLJLlwYk7Qs1ASoQ
	ZxheSvl7dMazx36G0G1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Wwb-004cEZ-Rn; Fri, 09 Dec 2022 06:33:13 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3WwZ-004cCO-1w
	for ath10k@lists.infradead.org; Fri, 09 Dec 2022 06:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670567591; x=1702103591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pKXwjzSM3fExfDeH8RiCG1MN2o3a6aiVUx9w4YsGw9A=;
  b=irUhH0N6nilx6AebHQmCN4tviKtVrassFT6QFlweFf4BI6YQKsG1bgjr
   2nWDty2IA9KIhpuKWi0uKsl8vOhKoL7lLD6h54saOmIUfKdOc2d9I2e9q
   ZMshYbTjGcPX3XhH1LeW5Mx7s8nCN7+9NrrE2j8OnFU7RnA5rBhv7vaj4
   1fE101Rr++qnDYDDIzPJN7X/GSFLFd3+nJYElL1f/9XcxV1ArDBFd0SUM
   7H5WgjKCjxrNwW/Ze0ULjk24Au80/C0ta1LWbdGwFtVulgLVIPNclYTNc
   f0crjRaZxk+VoxwTFGdJh2trfMhtq0HZN9A7vYl9/oPcbD7LLroyjKwDw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="403647247"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="403647247"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 22:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="771766942"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="771766942"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2022 22:33:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3WwU-0001h3-1O;
	Fri, 09 Dec 2022 06:33:06 +0000
Date: Fri, 09 Dec 2022 14:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 00ec8d72b7a6e3b11a9d0128f2ffbac1d8243ce4
Message-ID: <6392d68c.GefL8MTrW2Hb3+rs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_223311_149440_7F6DD13B 
X-CRM114-Status: UNSURE (   3.19  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 00ec8d72b7a6e3b11a9d0128f2ffbac1d8243ce4  Merge branch 'pending' into master-pending

elapsed time: 726m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
m68k                             allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                                 defconfig
s390                             allmodconfig
arc                  randconfig-r043-20221207
alpha                               defconfig
s390                                defconfig
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
s390                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                        randconfig-a002
x86_64                        randconfig-a011
i386                          randconfig-a001
arm                                 defconfig
i386                          randconfig-a003
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                          rhel-8.3-rust
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                          rhel-8.3-func
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
