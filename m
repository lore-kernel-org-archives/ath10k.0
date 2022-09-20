Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF46EC6FA90
	for <ath10k@archiver.kernel.org>; Tue, 20 Sep 2022 01:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C6PvCinwYxc9F713TkRH5A6gim4+zsoYIIEKbDvJwrU=; b=VxgdoEH6Z9dCZc
	Bl9TfRJWSNp5wyF/h+L3txDCPuxtKctRmFc6QrNHQzI1ENcsE2+PGwLVgjgA0iGP8lZMqwyoc9/4o
	+bX9lM9c2rh6Sv3/3HGGa64LgXrNZo+C9ECMBxZICWX/N8/ubq0vQwP8BCnOzmNnirvTqvfC8o3Jw
	/5jLEkGk/Xr8LpHMWYBwRIlHT5KWl9qFrW6tm3wbeRKizl29dBLxjnrkkqqQLSMxJ+fNYYPtbh6DO
	YaDJmI7QwaO/3NnIthT/AMhB8UBQVeNg5Q/i2fjIc8c1c3OtzewamldNrVvj4HWmpco3Ox0YCSyiL
	6/PHErzs1rOW5Bg24iTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSEu-00H3f3-8t; Tue, 20 Sep 2022 01:39:56 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSEq-00H3ca-AV
	for ath10k@lists.infradead.org; Tue, 20 Sep 2022 01:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663637992; x=1695173992;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mw6TQMnuYUBvfCm0IK84+WmPGBV0qHCL44Mu90Ep8ns=;
  b=gBx8QSfmoVBAlx7+7SJ897cq0gYrhBvqi6C6v+2QVkw1sE+d0l9sK0M2
   4mnk0N9YP3CXtVI9xjl3XXprS0rEmPuDqn0FPeXOY4xp1cnshWBH3ksJ8
   f+rS/hlAs2AzK9ee3Zq7Q6ulx/UuXKVUsQysWQAkMbtcWN3fxj1brppc/
   11V/oBhfzuN5hcfzGFIxyQh9Ix4kZ27/zbzCSNEbd4txY8Lo0YB0eoSiT
   ppQ1EjCQkSKP8ju7In73MhUPfw9Lows14mZkET/r4Qi4ctJ5MjRp7TwqD
   PwjELhRDUTKgbAckPNc5VZtFSkmwQf4bp3F9Lr+f1sz21pPUnhbBDM2/6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279947369"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="279947369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 18:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="651901269"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2022 18:39:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaSEj-0002N4-0J;
	Tue, 20 Sep 2022 01:39:45 +0000
Date: Tue, 20 Sep 2022 09:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 69ccee619a38f223308d5da43f0926ac9ca10182
Message-ID: <632919cf.HoHoJ40KroQXWHVn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_183952_420699_CCA7EF9B 
X-CRM114-Status: UNSURE (   6.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 69ccee619a38f223308d5da43f0926ac9ca10182  wifi: ath11k: Add WoW support for WCN6750

elapsed time: 724m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
riscv                randconfig-r042-20220919
arc                  randconfig-r043-20220919
s390                 randconfig-r044-20220919
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
s390                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
s390                                defconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64               randconfig-a012-20220919
arc                              allyesconfig
i386                 randconfig-a013-20220919
x86_64               randconfig-a016-20220919
i386                 randconfig-a012-20220919
x86_64               randconfig-a011-20220919
i386                 randconfig-a014-20220919
mips                             allyesconfig
x86_64               randconfig-a014-20220919
powerpc                           allnoconfig
i386                 randconfig-a011-20220919
x86_64               randconfig-a015-20220919
i386                 randconfig-a015-20220919
s390                             allyesconfig
i386                 randconfig-a016-20220919
x86_64                           allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a013-20220919
sh                               allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                     pq2fads_defconfig
powerpc                 linkstation_defconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
i386                 randconfig-c001-20220919
sh                             shx3_defconfig
sh                          kfr2r09_defconfig
arm                          exynos_defconfig
powerpc                       holly_defconfig

clang tested configs:
hexagon              randconfig-r041-20220919
hexagon              randconfig-r045-20220919
x86_64               randconfig-a003-20220919
x86_64               randconfig-a001-20220919
x86_64               randconfig-a002-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a005-20220919
x86_64               randconfig-a006-20220919
powerpc                          g5_defconfig
mips                        qi_lb60_defconfig
arm                         palmz72_defconfig
i386                 randconfig-a003-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a005-20220919
i386                 randconfig-a006-20220919
i386                 randconfig-a001-20220919
hexagon                             defconfig
powerpc                     tqm5200_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
