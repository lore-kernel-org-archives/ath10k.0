Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DDCC433FE
	for <ath10k@archiver.kernel.org>; Fri, 25 Nov 2022 01:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mXhXOGtxIt6hXZAAxb/ti3mLx7AehjO6kGnD1uFH3g=; b=imUfIshXUQlW0A
	9jb2bwbJrvflEBj6P5roFkR46lEccTthCWMFWaKxjTUaUgexzd2haB/Erq6r8UTEgpIHjUwzRvAUD
	ZIGTNMmg2h6JR1SK+wIoFJiivGDtnatJndD3qsy9x5sbpK87THsBVgK6e/HRlytH5E9zXo7l6t+c2
	1CV0qr66Ce/I4j3cUPEYqAJH+XMttO/I4SzqtUiajgfmMaWQ+qMoKORRlC+xL7KTv0yaYLjqV/WDU
	EHK4m9fWrpOK7B2vuzcg4mSZBJJCAp+f6vF62awI4aZSp38WUyUmqv6D4DI7MKaKZJE5EpBdB4mXp
	qqOn3PN8omyPYTy1U0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNF6-00C2Lk-41; Fri, 25 Nov 2022 01:11:00 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyNF3-00C2Km-NX
	for ath10k@lists.infradead.org; Fri, 25 Nov 2022 01:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669338657; x=1700874657;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nhypPhxxu/H2gxrj2q6wz79rZ0AGyHv/HoYTm8cXViE=;
  b=OnhcCCqVL8eSAP9fxt75W/5TOJ6RwnuqhR+OstTvzUT4ZY30lKXPnmbB
   DO1T00B3DVqCM+JnoY83cbLW2jkIGmCAJX8rlNbyjUj8ppuX+cyKKHZ6/
   3jjeS2KB2nTL6OE5ehrKvFr/2WjLJdDL8D0yAwN1IJzBsLAlLHhkVcapM
   cbKyAE31t9gxTbCjr/i5NVobxEuqLcuVgfGQVe15kgi4gUxcutWeaR70o
   +MO5ti+Ek+JB0HkQVHEkfVVVlrl2yHSmTKWApcNvYFp4HFeU/nNn/qKXG
   P2kjOVFti0CEU5aGzM2OsIST1IaPkLe8vhs/+6Rm8WIQTtu7wK+nbrB/+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="314422832"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="314422832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 17:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="636419744"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="636419744"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2022 17:07:47 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyNBy-0004Us-0i;
	Fri, 25 Nov 2022 01:07:46 +0000
Date: Fri, 25 Nov 2022 09:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 e9d30f354584f7094e56e6f91bf428f7c0981602
Message-ID: <6380155e.U/eTym5BMw/VOZGy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_171057_811192_3F2AA902 
X-CRM114-Status: UNSURE (   4.93  )
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
branch HEAD: e9d30f354584f7094e56e6f91bf428f7c0981602  wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices

elapsed time: 934m

configs tested: 35
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
arc                  randconfig-r043-20221124
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                            allnoconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig

clang tested configs:
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
riscv                randconfig-r042-20221124

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
