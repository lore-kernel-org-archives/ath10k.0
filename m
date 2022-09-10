Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5D0C6FA82
	for <ath10k@archiver.kernel.org>; Sat, 10 Sep 2022 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xRxHosD03xe7cL3JtHjBgVEO6fK5Xr8sAj7+gVjokbw=; b=DMhpetjHRLkqfs
	czuq3DU209gSDns7aN3EigP+UzITJFuKSwOIMmgUhnHWfLIdmKq8pUzcZqt94RrpUV6AJttvcMRd4
	GPlOyCF8jlvgzVimIwEwdYFR9u0VyXB1dKtQj3j7ml0hfA3pccks5/+bDpdShQUzd0jKi2GuGErmd
	nCDeFVbsGOEKapfq67WgFZ7Io131E5nv80OBB54PIsIRkMWWBXseVuvPVgDWxKFEROJ1KobsFT5NL
	+4eNyAH1snID+bCMSCCKajz3FO8woLuAa48iHy7MG+sUwg6n9GWU8f27985/Yf6OxCSWqRDnk6GiY
	lTX+GLXlDWv3pF85Ks4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6Mx-00CeU7-LN; Sat, 10 Sep 2022 19:42:23 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6Mu-00CeTU-La
	for ath10k@lists.infradead.org; Sat, 10 Sep 2022 19:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662838940; x=1694374940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5C9GKX9CFAug0fT6UFz6Q5WRPgKiGxDYVnf26bugkqo=;
  b=aS6gHurqoxQQVCgh4bUbGN666bnmUDJK0DQViNPHBAweCix89JDOi2zq
   Tew4Qafbpw60xOvm0HPZc53XMdx7HOJYkfCmuLezFx1182o3ydNjgfWL9
   aqp9moZxq9CYuWiSZiADHDCIz9bKkgrtcVFptKPv+pNOwSBC1hkYgcAyW
   xyZhXzEcSjZjei9yKjeqnSKSxJZ7Z0rv9xc1nSq+RB4+UBuU9zIDTaa2m
   d+wNgC9q2eiCqwwgpBJzdozXUunagvt9armmg9NU/BmM66Mu4o3yI3KoH
   oMRaQikdjO+DcdVXs+XeLODvleWbiSV4QGPurx6ozJtrq4rPerXCnybui
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="359393715"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="359393715"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 12:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="684002123"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Sep 2022 12:42:16 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oX6Mp-0000Py-2L;
	Sat, 10 Sep 2022 19:42:15 +0000
Date: Sun, 11 Sep 2022 03:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 e522bd3df8ab17f661547603a44f4b7d84223d73
Message-ID: <631ce885.3/vMNCaX7y1cdlAW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_124220_829526_2D683353 
X-CRM114-Status: UNSURE (   5.55  )
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
branch HEAD: e522bd3df8ab17f661547603a44f4b7d84223d73  ath11k: Add WoW support for WCN6750

elapsed time: 740m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
mips                             allyesconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
sh                               allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                          rhel-8.3-func
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
s390                 randconfig-r044-20220908
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220908
x86_64                        randconfig-a004
x86_64                        randconfig-a015
riscv                randconfig-r042-20220908
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
i386                             allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a014
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arc                  randconfig-r043-20220907
ia64                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
s390                 randconfig-r044-20220907
i386                          randconfig-a006
i386                          randconfig-a013
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220907
i386                          randconfig-a015
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220908
x86_64                        randconfig-a001
x86_64                        randconfig-a016
riscv                randconfig-r042-20220907
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220908
hexagon              randconfig-r045-20220907

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
