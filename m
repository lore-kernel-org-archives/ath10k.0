Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA780C6FA8B
	for <ath10k@archiver.kernel.org>; Tue, 20 Sep 2022 01:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZ+MZLEfSFOROE7wKJefK8PQCojwmyBRAJ/ScPtk5w4=; b=0o9vuKblU97lYl
	JMjbhSXlst1Qo8bYjsbeNgieMedsjpvIixxrM4zJSMgf0vyYmJCrvuXyq8QO3NFLcr+isYr9DiLEK
	UHbOetMjxW5T43Htp0KQq8KJJU59sd7Ga9FmRRubrD7Ss0+fMf8wLMeP9sJy0nYE+5zhq6LLbKAus
	IeQSP36JfUv8QNsJ8emKwaN+kPfpLRO/KJocRqrfFblLMlMUFChOwLRF1DxT7+gj2JmOHB28KguzN
	HR7sueVH0nep6Zfn0iOeXbIlZz8hXTM/6tSVn719OQGRSphXeh1CXA0twWjDYkqTH1T+48091gHTt
	Btao/b28wQvUdHsBTE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSFm-00H4LZ-2n; Tue, 20 Sep 2022 01:40:50 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSFj-00H4Jv-MV
	for ath10k@lists.infradead.org; Tue, 20 Sep 2022 01:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663638047; x=1695174047;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2lILeyHlsR/ZRdcw+CsX5jDdHxEej4qDQB2ESwEIsik=;
  b=ig8XJJnCXA+vve/dIAiDDs/H/Ee+6gS3LOOV0Vdk650FNGBF7fG0wziz
   rVvCg7u0r3qRw9v2B5yb0K7FBZrfGhxiNDHZ/o2R249RK22T3VdTA4gRX
   Xjtl+4MnuZKWyiBs9WIlOKKkN1V+IwjUbvgs1KjfflUfy0Dm6DxlUEVW6
   Vc/19N1JhJBDp1PL1pc0so4vWWCbHTAUyepwS3S5pro0jEZ6JTVv4334H
   Q0dU/zIWOxw0sk3eRHj6IoQ5V+xWGuOYzHMNC0kJxmyLmM6vHSB1z+SNX
   Jx2sHeWcipUxLlpXe7FAxR/guIN1EkMoHnvEq4CAvwYhfMWR9JLpfcsms
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299556618"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="299556618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 18:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="649381163"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Sep 2022 18:40:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaSFh-0002NH-0Z;
	Tue, 20 Sep 2022 01:40:45 +0000
Date: Tue, 20 Sep 2022 09:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 bd11ae8f66702626f893dc1dffc8d77c5682634f
Message-ID: <632919e3.SLzVl4k+58EkQC2r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_184047_781214_684F452C 
X-CRM114-Status: UNSURE (   5.16  )
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
branch HEAD: bd11ae8f66702626f893dc1dffc8d77c5682634f  wifi: ath11k: Fix deadlock during WoWLAN suspend

elapsed time: 723m

configs tested: 76
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
riscv                randconfig-r042-20220919
m68k                             allmodconfig
arc                  randconfig-r043-20220919
x86_64                               rhel-8.3
s390                 randconfig-r044-20220919
m68k                             allyesconfig
s390                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64                           rhel-8.3-syz
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a012-20220919
x86_64               randconfig-a011-20220919
x86_64               randconfig-a014-20220919
i386                 randconfig-a014-20220919
x86_64               randconfig-a015-20220919
i386                 randconfig-a011-20220919
x86_64               randconfig-a013-20220919
i386                 randconfig-a013-20220919
x86_64               randconfig-a016-20220919
i386                 randconfig-a012-20220919
i386                 randconfig-a016-20220919
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-a015-20220919
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
x86_64               randconfig-a005-20220919
x86_64               randconfig-a002-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a006-20220919
i386                 randconfig-a001-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a003-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a005-20220919
i386                 randconfig-a006-20220919
powerpc                          g5_defconfig
mips                        qi_lb60_defconfig
arm                         palmz72_defconfig
hexagon                             defconfig
powerpc                     tqm5200_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
