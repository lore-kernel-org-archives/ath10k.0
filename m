Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC67CC54EBD
	for <ath10k@archiver.kernel.org>; Thu, 12 Jan 2023 03:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewIjZm+7365fJs6osDpg6WRbYNJajBL6hWudrrGxfDQ=; b=JClgRB4q4bu8kL
	nd4tsyE9l3bfKbk4LGxNvWqVQRyd0s+VxSENZ7cG0G3DTv7+VYJHTISDfIwUfpfINYnxHOyfeIqOJ
	7j9ktbYBwbcgaDro1G08zD39rP0uHga7EruPAvOuTxFsDI9UJsTz5OkHs/2A1FfH3N7iv5e+kJa9J
	WG+tBVHe3W36/ouRwR+y0HhVNJClAPy32FCAa7g6QINIbKvz06RzVTA8wbr3Tcsqp8SR68fvXqpyg
	sMDmDeNJ7mKIh0uGZFrBVyrfvcBW8VcO58deF1UVk+wISNawZ5mN75tzjX9KMlnDdEbS0DZYVMOdk
	1fRoMmjDqkqsb8WXc3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFoe1-00DcnX-II; Thu, 12 Jan 2023 03:52:49 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFodw-00Dclb-5V
	for ath10k@lists.infradead.org; Thu, 12 Jan 2023 03:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673495564; x=1705031564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CEQ7PoL7tThPDDZ+JoDzA88x9EHjkD5aNhSv87NfIwE=;
  b=MifHGScCQOA5Dr22LxJ8HaC28GfXrOW6RDF77sEjvLKDZtna7DiD0dJn
   0MIVeuDwrATkaVBFmHSahIr+pSyuedXqo8D2ljKgtX1E3hpTBkJ1jjleT
   G8h++3ZpW4xix8cVxr/BC9dtipU5kdrsw9sYRr8rXne2UEtH3Uvc058BI
   QJRFwxE8A/vgUHAiU4z2y+FUSjA+3qkKze4qf2Qi6oq05iil68k2mnuwf
   E8SkyiNV/nqM/6Pq5geAIEAbqGW7qqRa7Hb6zVZSXvTO7fQ9D9jWa9Vn1
   rTaV8xifQiCFL+FUaKYVCOhInB9VL9Y7z0Xyp4SmcQxnjGMqlY03DaBPx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350830391"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="350830391"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 19:52:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659622942"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="659622942"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jan 2023 19:52:37 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFodo-0009lf-2l;
	Thu, 12 Jan 2023 03:52:36 +0000
Date: Thu, 12 Jan 2023 11:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 7236cc2516c00e0183f7898133d3e6ce256f07d9
Message-ID: <63bf83f0.Wy2PA/mZuAUx9bjg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_195244_271300_126D9B7C 
X-CRM114-Status: UNSURE (   6.64  )
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
branch HEAD: 7236cc2516c00e0183f7898133d3e6ce256f07d9  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20230110
s390                 randconfig-r044-20230110
riscv                randconfig-r042-20230110
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                            allnoconfig
s390                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
s390                             allyesconfig
i386                          randconfig-a005
x86_64                              defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
arm                                 defconfig
powerpc                           allnoconfig
x86_64                           allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
arm64                            allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
x86_64                        randconfig-a015
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
x86_64                           rhel-8.3-bpf
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
i386                             allyesconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
mips                             allyesconfig
powerpc                          allmodconfig

clang tested configs:
hexagon              randconfig-r041-20230110
arm                  randconfig-r046-20230110
hexagon              randconfig-r045-20230110
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
