Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6F8FA3741
	for <ath10k@archiver.kernel.org>; Sat, 29 Oct 2022 02:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m87PCDFKWxLHEqBO5BoVmwykO1Jc+7T1VExPtILAGWk=; b=R8F4dihduUp+nU
	W5j5eBCD5GI5H0DGbv1iDk9flSVgG3wZKJLNBlXXYdY5upA6FnF+uwu9gkopNY52112mk1bdT6w/V
	exCu9iICTL4+6/7kb9/xzRLgazNuZIlEvriZ/R+fVYz9orwx0GL2iI60fV745urLQ6kcfpXfF29J/
	bnNF7oLkpOefNRPHJ39pDZ4IRmmh+sca/gavRWSfwX5/M4bVAXeuVN/35erq6jlZnNzjXb7RsN2J1
	M0Ilnp7md4RfQpvUJHLMC3o5SuhS2o7TZ5cduYZBh53+WaN8YuKcvJ4jvHkjB4WVBMiW1uBy6guxV
	9YhPaIAPeeDFtdkpJmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oobkG-003e0w-4e; Sat, 29 Oct 2022 02:38:48 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oobkD-003e0V-8h
	for ath10k@lists.infradead.org; Sat, 29 Oct 2022 02:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667011125; x=1698547125;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hwP9QzrMUEMHQZhjYiMzNXmiuZukfTtLe6DD4bareCw=;
  b=B7ve+8+IRwrDwArvYZE4Xyu4kGj2CtH1EkR/0nmCgLKA8gD7g1VorJZv
   d2s01FqM9so5bM44yTJE+KepxDdXifzEBmFfVbjjcL6nw3nIEbs0Y/AQH
   1ulLcEGYG2pjDjLlYNGidPEOj5PKwQdkOLijCgE3FbyJqFzx6IXvSGpim
   SIsoiQThiP01isxkj8JW6RxAvthnpDDyyPCO2yDwbTlb1ND+DZCpvze83
   0k+NrOn7hzp1S+jWTM6iQmotdE1IcFtqK/zPNPLzD0HNKaTv5JP+BExkF
   V62k3Z4Zu7hkczsCdIfOAvzU/h508Sz6PeILHGq5oPpZjT3e/miCRCmxw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="308629586"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="308629586"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 19:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="962233637"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="962233637"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Oct 2022 19:38:41 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oobk8-000ATB-1z;
	Sat, 29 Oct 2022 02:38:40 +0000
Date: Sat, 29 Oct 2022 10:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 1257cf24291099cc34451fabe425280cea36761d
Message-ID: <635c91ff.M02qYgyOufWClqUF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_193845_387759_7381BBC0 
X-CRM114-Status: UNSURE (   4.57  )
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
branch HEAD: 1257cf24291099cc34451fabe425280cea36761d  Merge branch 'ath-next' into ath-qca

elapsed time: 737m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221028
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
riscv                randconfig-r042-20221028
x86_64                              defconfig
i386                          randconfig-a014
x86_64                        randconfig-a006
s390                 randconfig-r044-20221028
i386                          randconfig-a012
x86_64                        randconfig-a004
i386                          randconfig-a016
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                        randconfig-a015
powerpc                           allnoconfig
i386                                defconfig
arm                                 defconfig
sh                               allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
i386                             allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a005
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
i386                          randconfig-a006
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
s390                 randconfig-r044-20221029
hexagon              randconfig-r041-20221029
hexagon              randconfig-r045-20221029
riscv                randconfig-r042-20221029

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
