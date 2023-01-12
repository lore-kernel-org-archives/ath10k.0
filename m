Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69FFC54EBC
	for <ath10k@archiver.kernel.org>; Thu, 12 Jan 2023 03:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P5ZbnOVOiqGQIdqNEMzEQlbmIsMHJkjVDImBE1DElGc=; b=PRROgATeA7Q0j2
	jceJYbg/3N81JfkCujXMtUJEQ5ptWFyfNgMFIPGkgREiPc2elHY5sXdO3BgYbqivMwwsJx4Zop6pF
	xTffKyG+pjWNyw8ps7RiDzi5HSV+CO0ZEWZ77Pgf0xKQHFZKMsq080c+0UXKChRHhQfm+TfiRGwMP
	T43JXdXCT2laXUhypO6mkdJ4JyeKrDaseSAlSwiKLNyItFtO45IPFUXWFPKQ35gVsGQsDCRiV/c8u
	Pn+H+C1e9lF44NPs3MQN5iiR+Yah049PE+g0VpwQ7vuFtuW/67j87DkmNk0RKLp3cuAdWzVRmGfL0
	LK2K660Uld4hg1M/Ewow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFody-00Dcmn-Bi; Thu, 12 Jan 2023 03:52:46 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFodu-00Dclb-Ct
	for ath10k@lists.infradead.org; Thu, 12 Jan 2023 03:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673495562; x=1705031562;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wVmPW6Vfhjqh0ZdR0rXwGNz8fug2wQJWs/pHTviUKaE=;
  b=Pk03SsgnnzuVs1/KZoKf+h+MLFeQoLsVH0e/b7cjc+47VW5MCp73ce9f
   qVo6N48y0cZSoFFF5pp/VgdQvvjksdPL5R1XZNzKCGP81liZIit4KyFvF
   Rem4JVR76JAQqh38VEjfrx+90Ao5L22TsDBtyWxB7e4NXcH6eJUK+DHCK
   GlC8FNiakt66YCi5Y6W7XRzUPeiarmhnnIBR6o9zkS1fEP+nkjU2OY7Jy
   OuammQ84kAkY+mJZfPwZJC8JpwFk5hf3zd4wkRs+hjOxk0kcii1g2AOpW
   lqaTt96gREZ2FEHGhBF1c9eWNat0fig5sI/JP6uBiHofD1RJGB8jbnDSn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350830389"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="350830389"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 19:52:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="659622940"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; 
   d="scan'208";a="659622940"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jan 2023 19:52:37 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFodo-0009lc-2c;
	Thu, 12 Jan 2023 03:52:36 +0000
Date: Thu, 12 Jan 2023 11:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 d5d09e98de95d58fe1bafd8f34aee7f630e21c6d
Message-ID: <63bf83ec.tGMFNrxRIcvA7YWW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_195242_537890_73997741 
X-CRM114-Status: UNSURE (   6.72  )
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
branch HEAD: d5d09e98de95d58fe1bafd8f34aee7f630e21c6d  wifi: ath10k: Implement duplicate detection for non-offloaded PCIe

elapsed time: 724m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20230111
x86_64                              defconfig
x86_64                               rhel-8.3
arm                  randconfig-r046-20230111
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                                defconfig
sh                               allmodconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-bpf
m68k                             allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
um                           x86_64_defconfig
x86_64                        randconfig-a002
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a003
um                             i386_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           allyesconfig
i386                          randconfig-a005
m68k                             allmodconfig
x86_64                        randconfig-a006
arm64                            allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20230110
s390                 randconfig-r044-20230110
riscv                randconfig-r042-20230110

clang tested configs:
hexagon              randconfig-r041-20230111
hexagon              randconfig-r045-20230111
riscv                randconfig-r042-20230111
s390                 randconfig-r044-20230111
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                          rhel-8.3-rust
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
arm                  randconfig-r046-20230110
hexagon              randconfig-r045-20230110
hexagon              randconfig-r041-20230110

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
