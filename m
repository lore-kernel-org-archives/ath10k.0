Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED739C4332F
	for <ath10k@archiver.kernel.org>; Tue, 29 Nov 2022 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IJXzBhLWb5wT5vb8mwfqaCKx+G8rTGRbx+5V450yC+s=; b=ODmVJWeQBUdeE0
	pViG0j/X3hvUzGbau8+Y5A4cARm7GesMCtfB4Dg7vZYWRcJkL3IlD1SG0YdfmQXAqvo93pLIFJyZs
	DDEgZqkkRqRsImV3DILvRqaPpo6GaBv1v9gGnoKONytaPzvlQ5MKpE0sC94gW/aVhLCf/HZoRCpxZ
	2w80qm9C3xBHdxxCrcL3OL5J9vhMoZq6vRtWjkcY0/IjH/8qjCPS6e4XEIxaRiU4TAIZykd/pVa6m
	2rDLbqAvNsEDM1jX2Z5Yca6gXvdpP5ejrPS5Sr85bRlvCgH59wsznI2E2oegpDKlkFCBmcdo2OPJC
	VWi7gGDlQdomqOn4zLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvAu-006zGZ-1F; Tue, 29 Nov 2022 07:37:04 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvAr-006zFI-EO
	for ath10k@lists.infradead.org; Tue, 29 Nov 2022 07:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669707421; x=1701243421;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=y1hPff/GpoA22mIYTBQ+iy+4s6R1P7xn5WPniA5IMzk=;
  b=a1kna5KCjBTzPIG8+pQUjJjJap7+6566cU5f4Y/gKCzyxSAELInKNb2S
   /+12Qo9Vk7miVuxXckMBt6omBprtWOON3Sokx8ZxkBcCnF/nksAisMKpJ
   zWl1B5KY+AqaBueasdmdresNsZStB1ABn4e4xuNphroTHWb2/DNnTUWKX
   jAueT2tJsI/6v3m1NsHurT/h6ctpqZ4aXpmaRtBgqGCTaOhjtju/vUAVo
   Rzh88Lu7RIAeC/boK8h+1MhqtFnFIuSsv+7ePRkwKTaaxYcWeQ35bLq7O
   jolDzt3w2oZDFMHdeprRppXuggGsv6WJN+jSDnV5BRhd1pjYjI7qNTQ8+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="377189640"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="377189640"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 23:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="818125129"
X-IronPort-AV: E=Sophos;i="5.96,202,1665471600"; 
   d="scan'208";a="818125129"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Nov 2022 23:36:56 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ozvAl-0008lt-1a;
	Tue, 29 Nov 2022 07:36:55 +0000
Date: Tue, 29 Nov 2022 15:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 be3c35742097cd84b7262dccdac6e47b71c8560e
Message-ID: <6385b67b.gdl6+sHooBQ/oHL5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_233701_554027_4A7526EA 
X-CRM114-Status: UNSURE (   4.56  )
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
branch HEAD: be3c35742097cd84b7262dccdac6e47b71c8560e  wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices

elapsed time: 968m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20221128
powerpc                           allnoconfig
x86_64                              defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a002-20221128
s390                             allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a003-20221128
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a001-20221128
x86_64                           rhel-8.3-kvm
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
x86_64                           allyesconfig
i386                 randconfig-a004-20221128
i386                                defconfig
mips                             allyesconfig
x86_64               randconfig-a002-20221128
powerpc                          allmodconfig
x86_64               randconfig-a001-20221128
x86_64               randconfig-a003-20221128
x86_64               randconfig-a004-20221128
ia64                             allmodconfig
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221128
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a016-20221128

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
