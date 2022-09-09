Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D6AECAAA1
	for <ath10k@archiver.kernel.org>; Fri,  9 Sep 2022 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JjBMndEkzGYJ0s5I4qOodE695qB+cV1Zxjtdy1M2EPY=; b=jH/prsgcPKFPc/
	WWfuwd+AWntvZHIySC8G/7hnjP+naUV5d7i5Z7z8/rDGv1hTaOZ+62r/QxRcHhvXUkcv+hIjxhg0A
	O0V/efORQJp9zWNE2cSgw9+kZU0eQRodaaDiCNyCLbQZGzVuhBIWz+vtckDEhumqeSCiwY9TqLwRE
	FpYCHBCybpQta7fWaBO9TXU2JWk9FuaZrk2OAn/yWMSi4zD6l5akrLGooKa16Cgle4C9TVTwZsCR1
	0kS+XE8sgsv0w9PoAyFo47zqSgoVbxIj6fpbd9x2ljGSGzrJC+3m6diHUVhU+yPvKPmgdyWbT0/8B
	yXymWRwAk93YREaNFgrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWngX-003wXQ-1B; Fri, 09 Sep 2022 23:45:21 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWngU-003wWn-AW
	for ath10k@lists.infradead.org; Fri, 09 Sep 2022 23:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662767118; x=1694303118;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1/uJbm7gi0aON9rNpzRf1JoEhbQUQosnsVh+x1EFxpg=;
  b=bEx1teHz1+3nFeU5kbJd0M0eRBIChO7QV3911rMiQQ5FBT+UqTJUnaUA
   nJ7BPyl5Gt8ZbuvKxwrhVJCY3jwZ/xNGzovpmXGcrKyRdsT28m9XWaW9c
   r2OowsT4SOl0zTio6mzy9b7+ehp3ExxYv3x7uyhIgZ/7W2YaXUiYbAC3+
   TIEHI4gGHJryx5Vq28S4H1K7jZu8OwhCTK8INPYVdvr2u1IU/KHvd6+q6
   9aP1X4oXCUxxuZLp/cqYfqU6QoQEPWMNf4H8JSLfk2VFo16n+v7hwFpN6
   Cq17BHzgBw7wII66UiZSrlYOx2NpNeOB3dYQETUb4DDqN34tJH7HBmQXz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="323808943"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="323808943"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 16:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="683812216"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2022 16:45:14 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWngP-0001sF-2i;
	Fri, 09 Sep 2022 23:45:13 +0000
Date: Sat, 10 Sep 2022 07:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 d4de3739b6fec86a46b03e9363a3ccd22a8a5823
Message-ID: <631bcff9.uRw+sJG/mlw+6K+u%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_164518_407311_54911518 
X-CRM114-Status: UNSURE (   7.43  )
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
branch HEAD: d4de3739b6fec86a46b03e9363a3ccd22a8a5823  Merge branch 'pending' into master-pending

elapsed time: 777m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a014
x86_64                        randconfig-a013
sh                               allmodconfig
x86_64                        randconfig-a011
i386                          randconfig-a012
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                             allyesconfig
m68k                             allmodconfig
arm64                            allyesconfig
i386                          randconfig-a001
arc                              allyesconfig
i386                          randconfig-a003
alpha                            allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220907
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                          randconfig-a005
x86_64                        randconfig-a006
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
hexagon              randconfig-r041-20220907
riscv                randconfig-r042-20220907
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20220907
x86_64                        randconfig-a005
s390                 randconfig-r044-20220907
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
