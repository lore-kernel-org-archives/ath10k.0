Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA361C43217
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 18:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gf0X/edTosXPkSv2xevr3PHXWSwG3+bllTSoCocxio8=; b=T+t0YTpD6d9P7Y
	T6ra4MSC+5bD3IwZNfE1sq7Oz549i57MJd40LIyqJ3UffH3oakd0zU4li8b5fSYW3+/xdx1DbiO5H
	1Nqbl4KBI/z0IvYVh9K8HavMKKJj2nHMiudCJ+Xj27JaL7Sylaz/47s6IpxgzOOUskrVDWz/b/IKt
	iAWx2dJnyd81FuignUw+8rBE7Roo5WGE/4z2YpkYgyQPjC1k0/r4kVMep9u1s01ANDCaYqMR5kkZ2
	U4cAtQlhlhNcoIAQqEa38dYsCnbDjj5v4XaKaOIardCkdxdQHIoXo7oj9vXSN/kTQ/oiE3C62noK2
	l5tRuuPXgbQ6qLjR1zTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqfIM-001LJc-BH; Thu, 03 Nov 2022 18:50:30 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqfIB-001LGL-Fn
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 18:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667501419; x=1699037419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o/d2jmsQ5qrCTZvBNJacO0O5XLOAo4lexXd1DWxtYJM=;
  b=oAXEumqBsRgVUCSuCB90+BVoL88vpP4w56Di+5byotBd3K74HH4fhx+y
   jKjUmDke3WGIKBkQ2y4VVJfqWS4NnytXyycJYAExD8hjL7GkHTz+ChTM9
   qcDyFyWRZ/ox3J9kmeb6ONOKk04Ojmul2FUgz9xMyl+/lwS7kLbV/ck2M
   rCKBUK173mFvUDbhULT/0PmZOVTgCrJRgk0cCUDE6ncrZSOaa9BPftZJi
   snxUBxSnYLYM4QvE8V7AASi6ZSN1yU9lnA+3zhvdgA9lEWiaX5kcXGDLV
   xtk4XmkJfbRYFx8hFV1w9xrPyztHJNTiI3r6rfzywLGo+rTwL8u/6xvnq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="336471962"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="336471962"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 11:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="612766529"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="612766529"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2022 11:50:13 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqfI4-000GDl-1f;
	Thu, 03 Nov 2022 18:50:12 +0000
Date: Fri, 04 Nov 2022 02:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 007979876af42db35d793765c72d665bd812d919
Message-ID: <63640d29.fQCtWL5giXV6gdCi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_115019_605426_4792B39A 
X-CRM114-Status: UNSURE (   5.56  )
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
branch HEAD: 007979876af42db35d793765c72d665bd812d919  Merge branch 'ath-next' into ath-qca

elapsed time: 725m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
s390                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a004
powerpc                           allnoconfig
i386                          randconfig-a003
x86_64                        randconfig-a013
m68k                             allmodconfig
x86_64                        randconfig-a002
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
i386                          randconfig-a005
ia64                             allmodconfig
arc                              allyesconfig
i386                          randconfig-a014
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
alpha                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a011
s390                             allyesconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
m68k                             allyesconfig
x86_64                        randconfig-a015
mips                             allyesconfig
arm                                 defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221103
x86_64                           allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
arm                              allyesconfig
s390                 randconfig-r044-20221102
arc                  randconfig-r043-20221102
riscv                randconfig-r042-20221102

clang tested configs:
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a003
i386                          randconfig-a004
hexagon              randconfig-r045-20221103
hexagon              randconfig-r041-20221103
riscv                randconfig-r042-20221103
s390                 randconfig-r044-20221103
hexagon              randconfig-r041-20221102
hexagon              randconfig-r045-20221102

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
