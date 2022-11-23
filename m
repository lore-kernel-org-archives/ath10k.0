Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C13C4332F
	for <ath10k@archiver.kernel.org>; Wed, 23 Nov 2022 11:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sng8b+M/dP0ouKp5YZ6XfRwovpsZY4Q3rAxrL7y2w1Y=; b=1kIH3ZpY0dGyYb
	VOsc8zkGecdXJGFhn6PAy1pF0XI0sEDmMc17NsjxaiUE/EK5JB5kYcH+S9feHsM5oWytnEYpEDRO+
	GnTZKqlTRRsZw42dJYKwapRO+bOthfPGt8jhDPOCg0jtQ3MFgSp+Bg/K313m3HKtnivzWqAheV8np
	ZaqrcME3a9v9G2LGPbyvl+Vugui9wh2te3lZfi4gtDUXX0Ftk619FKQ3Z8Va3wTXiZ3NYtKjLwrc5
	M/qKpccn6wSQ4C+1Nc5HIDuPUd00MmxRYKFuCc4fupW9FdoqWLhp1sGdcw6/9njKCvhdR8AFlf1sX
	P2m1K8sytBa47XQ3a8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnWG-00GVGF-8V; Wed, 23 Nov 2022 11:02:20 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnWB-00GVBh-B6
	for ath10k@lists.infradead.org; Wed, 23 Nov 2022 11:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669201335; x=1700737335;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T+GBkAZIYrAP5bbobTjqfKj/DAbOyV/bF+yK40ek850=;
  b=YqjDmkZQPC+AzjflQ3s03HJS6+1Cb/Uw1ES3ZHI2oKpLv6nO8YMFm7vZ
   wjRCnjAf68dTcFmzuK+ReLhHynlFC7I7AO3LMTYlaMvy6Z0v9hJYKYjYE
   ePcyf2s3cbyMwKkKBBJHJMFI/GUaY42AcwVbxR/uazPSVGmezdpqF+rVd
   8fb3PgikvrRp1Z/y9GGNskwROK38k3HoKR97uV3HfwIMI890zrpIAEI1f
   OgGQZrt++dFeJ+WRMaUMVMW93bO+1d6OZPvlLxNHrdG2J9VnRk+xdcC1N
   soRk0h/SAvz5jj1PZkgmxAWCuNYMUrAfhcf8gtw9BlTBNj4Resj0c7OH4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="314076004"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="314076004"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 03:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="644078973"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="644078973"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2022 03:02:11 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oxnW6-0002f3-2f;
	Wed, 23 Nov 2022 11:02:10 +0000
Date: Wed, 23 Nov 2022 19:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 801afd2196bbe43be33dfa6f561894b205912f02
Message-ID: <637dfd8f.uY2ha7DC9S2PVP+d%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_030215_431535_C2B92E4D 
X-CRM114-Status: UNSURE (   4.24  )
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
branch HEAD: 801afd2196bbe43be33dfa6f561894b205912f02  wifi: carl9170: Replace zero-length array of trailing structs with flex-array

elapsed time: 1551m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                 randconfig-a011-20221121
i386                 randconfig-a015-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a016-20221121
ia64                             allmodconfig
i386                 randconfig-a012-20221121
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
x86_64               randconfig-a012-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a015-20221121
arc                              allyesconfig
arc                  randconfig-r043-20221120
i386                                defconfig
s390                 randconfig-r044-20221121
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                          randconfig-c001
arm                                 defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64               randconfig-a004-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a006-20221121
s390                 randconfig-r044-20221120
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a001-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a006-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a002-20221121
s390                 randconfig-r044-20221122
hexagon              randconfig-r041-20221122
riscv                randconfig-r042-20221122
hexagon              randconfig-r045-20221122
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
