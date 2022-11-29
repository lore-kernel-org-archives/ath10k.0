Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CC8C4332F
	for <ath10k@archiver.kernel.org>; Tue, 29 Nov 2022 06:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/SkQXN8Lnpdn36JEDskHbybL4f55ah+ij/YojG28prk=; b=pzRts9ENfFO6+i
	t1evLjCrKDUnIFOSWf9+Gx84a6HZxEBbbN2uokZGbeIoTuVvONx1nTdj5RkFI92N++ukHfxcrU1pO
	hepJNoujg4PkHw719BGU/xwmB49TZeTtZLOBRAWWR2IK4ojH/f4sNI6YQi78qH19j9rJ19OBpjXpn
	YtH3/3iIxE970i96jU2tKbSvb72Rgfs1+L0ra0EbBeeEennrunV1Lh1JXIXESfbh6R9qZ4yFBf3Ep
	8t2K5vkZA5Mow+sRJKJD0N5xUVCEgJVzuDXs1pJlTER04QkvovrHiqTjS8sPX3ninqpwZK4KRMn6K
	SqBsLosCOur6qbZVLtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuUD-006iLC-IL; Tue, 29 Nov 2022 06:52:57 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuUA-006iJW-IF
	for ath10k@lists.infradead.org; Tue, 29 Nov 2022 06:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669704774; x=1701240774;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JZcCMNsSSH9snCJl6o6kR2zNN2LZM2xImMJxat5G2rY=;
  b=n/GNKGzbw+rDOyJSpRxTgC1uONdzqCV+bUBbqU4Cu8c6pb21QBOQB6P3
   21AYy5UO2xGsdPsbbf/wqScvKMuwePzQ0j6mpRXsamX++SuF6FAG/M2Jg
   09HeSh/xXQSCAHeCkSmgmfZtslrWZF7zTNL3tZGE+U5bQF6MtuSGySQ5j
   0vGCi/JTr2AzCbpDtiErgxJ1UvnMeiwVUsWWKxPTRGPnD+cetiV0BeNBc
   uiuOYEgqy0zDEttL6Ae7vBx/ckFXilgdxgK1wOgYMKt9zOFlH5j4V3eVp
   DfzzDhdVPjNyIGtKxKYCsP6wzXs/HTjHYBWBeUa5TBeb5yjhoBpQYhfwH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="312665812"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="312665812"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 22:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="712263438"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="712263438"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2022 22:52:50 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ozuU5-0008id-1K;
	Tue, 29 Nov 2022 06:52:49 +0000
Date: Tue, 29 Nov 2022 14:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4dd4e96059ac3423134be5e6c63378a277d2dced
Message-ID: <6385ac1a.vIzMjsanci4fMzFR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_225254_643283_5D04D9E6 
X-CRM114-Status: UNSURE (   6.97  )
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
branch HEAD: 4dd4e96059ac3423134be5e6c63378a277d2dced  Merge branch 'pending' into master-pending

elapsed time: 924m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20221128
um                             i386_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
s390                                defconfig
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
i386                                defconfig
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                           allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
i386                 randconfig-a004-20221128
i386                 randconfig-a002-20221128
arc                              allyesconfig
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
alpha                            allyesconfig
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
i386                             allyesconfig
x86_64               randconfig-a002-20221128
mips                             allyesconfig
x86_64               randconfig-a001-20221128
powerpc                          allmodconfig
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a006-20221128
x86_64               randconfig-a005-20221128
ia64                             allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r041-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a013-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
