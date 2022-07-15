Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC2C43334
	for <ath10k@archiver.kernel.org>; Fri, 15 Jul 2022 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7gUeCxTdHg8qW3/4qSl5B53JPx+AYLyPavw9DSY+pVs=; b=TC//G4YbvLthAZ
	rDHOnOYqr/VAN5Vfalf4e9i+guRt7AE9n/8Ba5d3be0etzgAPUyukKD8APjTDkDTYscaLvjq3VVWb
	P/aJAtlY3n/gPHfIDhBiUcLu1sUeVKLH4G+jUWlZpUp2vKMZQh2GUpzMiZaNbWh5Q1LtoBZ5Ariug
	lIB9Trf/YxGk3SHx1I8Id3kACfl8iB+lDAtBifcjskJiI9/Ev1xR82TpBxMV/ahoGE1efDHIQDUK1
	O5GqNZxRiGipIYEC2HDK9BV7HAXQ2oPuAVtEJLCmJLEul5HC8OuUQiv0YxkvyCkRFsW1ZQy9AnFq3
	U6DuLGpYznAUR0jcfVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUhu-00B8th-9t; Fri, 15 Jul 2022 23:26:50 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUNd-00Az8a-OU
	for ath10k@lists.infradead.org; Fri, 15 Jul 2022 23:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657926353; x=1689462353;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8n6AQ/y5VJsZRvHh1g4NpbnzWIihOBj8myDcgYDGy2c=;
  b=Ff13E5/zJTI/Exwj339O6+lato2aKQz72altUz41LoHU5/uU6ULhYsUC
   A68wvtYeRq01r5pHDVTSZPzV3l6cUWj/QrvrzsNBQ8EJiD+ZYUV1IFVyS
   4qR0ItQlMTtP2ouTuIcJkROvh+eYZZK0JtDF7f8INiOcc+Y+5tb4snG0C
   +2I2oxrP1sGODNuJfeDptBBvR+k2m2VlM4EGIKwdQUQ5thMa6RR34ANOO
   ANj1Gg6g71MjyY2iXA4hkO/CWQUaULO65k04xpCBZ82/7ETPP/BvPQM9Z
   EYH0R6UhcAOlRDsXpVMDhyxqUWNiqdN7il6PizeIR0yipTTVf1l6+hMb1
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="347605086"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="347605086"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 16:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="923691263"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2022 16:05:48 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCUNX-0000qc-K8;
	Fri, 15 Jul 2022 23:05:47 +0000
Date: Sat, 16 Jul 2022 07:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 a6a89e2f66eae7e08c0b7bb196b3053762c2f946
Message-ID: <62d1f2ca.utLh8H84209cm3bp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_160553_952029_0034B4B4 
X-CRM114-Status: UNSURE (   3.97  )
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
branch HEAD: a6a89e2f66eae7e08c0b7bb196b3053762c2f946  Merge branch 'pending' into master-pending

elapsed time: 726m

configs tested: 13
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
