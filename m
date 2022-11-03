Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BE5C433FE
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4sjES4Kn8xgtYVslaiOCNCkZ6BaNQ+LNeOXXXdWAM+I=; b=KzNTMBImxueIzP
	GEnU9y+T36Qzs+jIYAIhmKFIVx2Kgw/KAQtkw4QwKPiW/fJ6jn+3/uqEk1D4tKUqwNQ00kZBKv/LS
	E5QpOSZx/1uCB/kNY81WyO9y8ynqtnjGROYQeRE32eHvtai/M2nFNXEoAw80DJEBVdoq82uxAAYQw
	mNCqF1/5ZQ5JqUTTM06GqtfxgKrQgeY7k/Mtk2xosDhItfrdUHnZ7S1TF/cqmakb1VcPOIAWSMVne
	snopsnafrlYIDXLa2/Gi3+9t0z6PIA/Ls7WKNydGAGlHF/6ujxCrq/aZ7ayyu4kp2shmDrm/b518X
	7LAmqdxiV/9aPMnocKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTEE-00GF57-RC; Thu, 03 Nov 2022 05:57:26 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTEB-00GF4V-QO
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 05:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667455043; x=1698991043;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y2md2qzdmTZHbC8NZc0hg+crP5/v8mxwB2WgSElPNK8=;
  b=ZV0/Qa4vg/JY0Lb5TDo/xXecORwPTOeLxcV+CKMSUcK9LE9bgUVoaHDo
   J0/WZnFo+u2sEu5suDGBNeqPREtFwepFaJH6zWph9osN33X/DzVzVoah+
   wPHIpv9hkK1C1hexg83bBsIk8AX5EYw1sw5YVC57GjSWomCGC4K7nqgd9
   rUopt7wxuleCQipNZbZFkspHUKEIIIFTMx+rcAr4Syr2i5URhB59sxp4p
   pwUPPtIVi/qthTBtZSKfoyhsZ8rQ87bFxecaZEJfigcYKCJ4OGIc+7m/N
   2VQQ6hzKW8tmfqltduChqDC0dcLp0m6pR3Ejg/pVq+otphkbUQOx89+Wb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="336283157"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="336283157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 22:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="777175709"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="777175709"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2022 22:57:20 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqTE8-000FZ2-13;
	Thu, 03 Nov 2022 05:57:20 +0000
Date: Thu, 03 Nov 2022 13:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 cee4bbcabec1882f7084183c7f1a1ddc3cd32413
Message-ID: <63635830.xI0ZOpNH/Sv3odOo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_225723_914229_9A39CA9D 
X-CRM114-Status: UNSURE (   6.96  )
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
branch HEAD: cee4bbcabec1882f7084183c7f1a1ddc3cd32413  Merge branch 'ath-current' into ath-qca

elapsed time: 736m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
arc                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
alpha                               defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
s390                             allmodconfig
ia64                             allmodconfig
i386                          randconfig-a001
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
i386                          randconfig-a003
m68k                             allyesconfig
i386                          randconfig-a005
x86_64                              defconfig
s390                             allyesconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
i386                          randconfig-a014
i386                                defconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a013
x86_64                           allyesconfig
sh                               allmodconfig
x86_64                        randconfig-a011
arc                  randconfig-r043-20221102
x86_64                        randconfig-a002
riscv                randconfig-r042-20221102
x86_64                        randconfig-a015
s390                 randconfig-r044-20221102
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a015
hexagon              randconfig-r041-20221102
i386                          randconfig-a004
i386                          randconfig-a011
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
