Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20458C4332F
	for <ath10k@archiver.kernel.org>; Tue, 15 Nov 2022 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G/liB2yMxuDX01doxbn+whYZab64zTU5WmMQJOn2/Hk=; b=0zG7RXz7gGUePZ
	68+t+d+sZa/rWUi0Renfg1nXC2UbpsxTzwj1NzirMOZAWNMYksqzgGVz5aE1rM8ozVYhC4FLULnlc
	U8SIPsPHBH7ri6t3vedRH2l17ZYLBl7BqF4MuNteDGzLgBYvgFfx92DgLas2l+Mp3BCXDUV7FUPp7
	ZUCse6HIAmeaeKO4RRvlRRMjhRmq7eniNdLgsEnI+y6M2jehg2DKSPW3FXxrcgDnvEqmGhyz6zI1P
	PvKI+994Ct4VGOMHDEjFwooax+9Ytgu9L7sKrakytzEJCKkVypXSy3ezbYfSCwozWCybwbHP/yGh8
	h1SLPL1cQ8LWiVXsF58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousPp-009TwI-J9; Tue, 15 Nov 2022 09:39:38 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousJV-009PPn-J2
	for ath10k@lists.infradead.org; Tue, 15 Nov 2022 09:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668504785; x=1700040785;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=81sDsPEFZOSvvmB5Xu9vdXLHyGa+Bamje+VU2TbSnMM=;
  b=m0eLfZs4EMANSSHHQEATnLfYtWj/8ys2hs3xRejkvOgKRcLD+7AlQqVF
   Sz9kQViqqN28jdKHhVphhXmmNGq1Fxnk5DB61I1lL35dlerrte/VXwA2N
   rmVenS8ZxS3L45yU/HqEIHp38Dj1aGBZxT8jkbrpRzoP/zcuXTJusIBak
   DVcQz/VF1qQzhFKjjX8+5+Y9k06o9cwnDa3bECHdJhsGVmp1f7RqNj2+p
   kDKPIlG6tswk1BiHszdiBkqWQWZYYblaPBBK4fRRIbI6n3Uzn4FzQqhLa
   NtRL/cYZUq2XBYMJ0Inc09RNs08L6btOvTEGUnnt+iFH9aPFfYb595xhn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="312213107"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="312213107"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 01:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="641145024"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; 
   d="scan'208";a="641145024"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2022 01:33:02 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ousJS-0001Ff-0e;
	Tue, 15 Nov 2022 09:33:02 +0000
Date: Tue, 15 Nov 2022 17:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 ac43b20e7d06e89efad5e501b09fab80cbe69e0c
Message-ID: <63735cb7.F2pbyiwJPKO/vPNU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_013305_698302_E0122D6D 
X-CRM114-Status: UNSURE (   4.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: ac43b20e7d06e89efad5e501b09fab80cbe69e0c  wifi: ath12k: mac: use u32_replace_bits() to set beamforming capabilities

elapsed time: 881m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
powerpc                           allnoconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a003-20221114
x86_64               randconfig-a006-20221114
x86_64               randconfig-a005-20221114
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
i386                                defconfig
i386                 randconfig-a001-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a005-20221114
arm                                 defconfig
i386                 randconfig-a006-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a004-20221114
arc                  randconfig-r043-20221114
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
m68k                             allmodconfig

clang tested configs:
x86_64               randconfig-a014-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a011-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a016-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
hexagon              randconfig-r045-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114
hexagon              randconfig-r041-20221114
s390                 randconfig-r044-20221114
riscv                randconfig-r042-20221114

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
