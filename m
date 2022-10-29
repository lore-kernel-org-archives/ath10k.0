Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAA1C433FE
	for <ath10k@archiver.kernel.org>; Sat, 29 Oct 2022 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F51MQ2mgylqI/kzd0kkwAtiKJB7lc2pSDcy+jtrYQoc=; b=1T5Q7LjULlwECt
	d1Y4g97JSzxHi5iuyPetrKGA1BVK+T4nRAVq1n0F6YKIqMuYVxUNE8RsKlnA0VXFnKWZf9PkX2r4u
	Pcv4AcFjeHPlT6kivgbwQn/UTe3w0n5b3TwB08tyDTK0ToPooZvcwG0kpPJPRqShSe9rgGZbspFyt
	Xt+jm8/H9bJYcDOX9XqISB6reH2GT7YFXIutDhLugr3LFRBT8dLcOhsQaSiN3ELLA3FVA4Cs3hOQF
	/LRY4YiLdo8XzdHiDKZA5oBlKN5MwJCF4SF/rF2BCeN8ctLq/ahrH0sIx+f6SymWaqeaq0rDcWEwg
	09v5bYHLFREyi9KRfLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq26-007i7J-RM; Sat, 29 Oct 2022 17:54:10 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq23-007i2U-Fa
	for ath10k@lists.infradead.org; Sat, 29 Oct 2022 17:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667066047; x=1698602047;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dY2dpHrGwi4/PKlIiy65HXnzKGSZw/jRYNkmePax5QE=;
  b=gwGoHjFF3S3ibSEFB5df26MVbhGnBP3G34Zr4h91HYzzBTT2eHEL+cgX
   HrGjQOxLbs/rtEe5+Qylx5Vd82IhlonByAwI1lKfTOktprrevTmFwqAWt
   923mSmZqj/SRDTZaMNpYF5qNqmCvS92iPrQd3Xvzw48jtRG1xhEvALOUG
   uojRSVeotlSBJ+dagpI07N2txqg6ibmiJs7V9Oupybaih2EC2sM2xmZ95
   C5YECi2VQ7ygV6vtULnJYw+rx9KMpgxg+vwA8RNZuOTTYWmN88OkVGxtU
   fK6J6BJroWs6KqHoUeVSAlhmXL7zh3lbIisnO9gmiairsFIkjZ3c+xrkT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="289078905"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="289078905"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 10:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="696573273"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="696573273"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Oct 2022 10:53:54 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooq1p-000BGR-2Q;
	Sat, 29 Oct 2022 17:53:53 +0000
Date: Sun, 30 Oct 2022 01:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 f84647d7bb698adf172844b800ec40c6169a6173
Message-ID: <635d6891.DKVOZJGfuLNx90WQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_105407_613964_1A7DA26F 
X-CRM114-Status: UNSURE (   4.16  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: f84647d7bb698adf172844b800ec40c6169a6173  Revert "rtc: cmos: Fix event handler registration ordering issue"

elapsed time: 720m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
arc                  randconfig-r043-20221028
riscv                randconfig-r042-20221028
s390                 randconfig-r044-20221028
i386                          randconfig-a001
i386                          randconfig-a003
s390                                defconfig
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
alpha                            allyesconfig
arc                              allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
i386                                defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a002
powerpc                          allmodconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                        randconfig-a004
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a015
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
