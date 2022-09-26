Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BADC32771
	for <ath10k@archiver.kernel.org>; Mon, 26 Sep 2022 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BbkLMaUJTjSq12l8zKyUwTE3Ss1DqkAJHfubk9CpApk=; b=C9m/ieR4ZA6WW/
	zR5iZtNTJySP003mucYi5XXugtn5miahPmYnd0g2EuPauUve5xeP8YDijoS70iH60fnCVBpKOi60Z
	3wBunytUQ3gzydUJchhLCWdOnh9iPeO9kXTXP1DeDtZWSPKNinX4sO0lQy3+E2YMV6kjx9j7wN1pN
	SSqRqHXa7rfaDQpdyjpu9ZoR8PNVTcTuZFYFhQvaZYhqWdhbrDuf7EDt6i4jm1Vg6S1FDNRg/PkR+
	zjX8J/56yjbCMqgMu1Z/hnlYLEZWneSiMJjtSKsfecodObUN+uznxOfBRYB0fnhRSjsicbk3UTHoZ
	kZyFtsJULdqQo3+nQssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocwgK-007Bsc-0i; Mon, 26 Sep 2022 22:34:32 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocwg8-007Bqi-Jr
	for ath10k@lists.infradead.org; Mon, 26 Sep 2022 22:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664231660; x=1695767660;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ECPMHBZIcMgHEEaoeENA4dEX21YxWc8eidaOB5qQPPI=;
  b=gbRMMZWK4+winfi6cUKYmg/VfyIANzHPvBefGCQ/zB1/j7lXejPdls+U
   4JIDeVT7swPmqx8zgZI/T7sHGghu63POikuBOf99L5mCNhMPRJ8Xf98UY
   w08tmNNWg5dXTOgLKwQ7dTqF6osWNQkPl5dIbNjsIYCpX/ltmcFAvp0k4
   gzRTO0JoFBYrN4UIEF/ypBKMp+2yuubu0x1HU6/cR+9WxQZv9pDcUSKo1
   FXy9oEg0VxK0tiPSEP94jFGHUtlrzHwHCCXQOX+Gcq/Im5lJONOjVUT4P
   7HGUm55bLHbneHJO4RRf4X9lK3u//2UUoQ0jcO1o+O0CUJU9z+VgV6sMr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="365193547"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="365193547"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 15:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654476345"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="654476345"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2022 15:34:18 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocwg0-0000JT-1g;
	Mon, 26 Sep 2022 22:34:12 +0000
Date: Tue, 27 Sep 2022 06:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 94b477e266563b528fc2efbf6a4302d7c8216093
Message-ID: <633228b8.NsDGT5/ZwM9mDDIB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_153420_722571_42622C0A 
X-CRM114-Status: UNSURE (   5.89  )
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
branch HEAD: 94b477e266563b528fc2efbf6a4302d7c8216093  Merge branch 'ath-next' into ath-qca

elapsed time: 760m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
s390                             allyesconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a005-20220926
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a006-20220926
i386                             allyesconfig
x86_64                           allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arm                              allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20220925
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
riscv                randconfig-r042-20220925
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
hexagon              randconfig-r041-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a012-20220926
x86_64               randconfig-a014-20220926
hexagon              randconfig-r045-20220926
x86_64               randconfig-a013-20220926
hexagon              randconfig-r041-20220925
x86_64               randconfig-a011-20220926
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
