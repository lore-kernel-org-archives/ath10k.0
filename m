Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF106C4332F
	for <ath10k@archiver.kernel.org>; Thu,  8 Dec 2022 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9sLD+WQzt//EYWG/maMkNBW5igtrGHm4I5uFvssT7II=; b=1SC8tVxCO3Fp/4
	w9BHSAYypbL4slr8mByrmtMiGMUbnd0O3/4SiNHsu7NPPcBMTPgRe3n8VE99QZzxIe76Fsb0Mn7rn
	V51Yey5lHLohuf9z4LFfQSZm3eWvrOABs0m+tyzGII+Z4AfnahN6wPKp154VO9YI/y39P5uhU4pq3
	CF8Of4LHLWeBMM/wtynJZh3/KaGEj6TCqnvFyT+g1jgzPMw2HWF5r9bIEiHXIuAIJy9jUb4JrvPaW
	wW9bWQg/QS+QRS1jIVk4Xr/5E4pD6RPgS3Bn/LnPBGIpqrGCvyEQpxQAhuQD5E22jjh80mkTeL0Gp
	QNiHCSvG2M7JL3MgKKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AA8-003Cjz-P0; Thu, 08 Dec 2022 06:13:40 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AA5-003CYZ-5z
	for ath10k@lists.infradead.org; Thu, 08 Dec 2022 06:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670480017; x=1702016017;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qFPFvXJVjt09h41hszY1sgJTRhsJUsJcDVLFuF16N1k=;
  b=Y/yJx8A8v3eLvckoh7cZDwGWxYZRtyc+FEIBng9uUyzThv/t+/FpSGod
   Q99EaA/8B/lTWekNMkBYdhRdh9ap1LpCJ6DY9Oi7uEeXRmKVXgBYM+amu
   CoDrxfnNooI6DCdHD3QtvXhtSwD09/XbY4PMSH3QCKOD2TxwmqMOTBQxV
   lBlXUgGzBh9CnqyiaYUSeDUam8g8RhEqHnjyYhuwUIZtoZQ6elqeHnGRF
   M6kpcKEi+7tWlZMi682wMAUahADU6wxewc4UQTzmOf5t3v0WDfCoaOY0t
   sh0thlDKqQ6sMNga4fRQsTsrgzH5hDr0KDPlCKPny3nX0KPW8NxJImJTz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="315805757"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="315805757"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 22:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="649015879"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="649015879"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Dec 2022 22:13:34 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3AA2-0000uN-0D;
	Thu, 08 Dec 2022 06:13:34 +0000
Date: Thu, 08 Dec 2022 14:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 5a70fb055aad4887b205248d3f9746ed8b2e755f
Message-ID: <63918063.j7ulgJxG92c7wMxT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_221337_795921_1788D08A 
X-CRM114-Status: UNSURE (   4.05  )
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
branch HEAD: 5a70fb055aad4887b205248d3f9746ed8b2e755f  Merge branch 'pending' into master-pending

elapsed time: 746m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
powerpc                           allnoconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
um                             i386_defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a004
arc                  randconfig-r043-20221207
alpha                            allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-rust
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a011
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20221207
sh                               allmodconfig
i386                          randconfig-a014
x86_64                              defconfig
s390                 randconfig-r044-20221207
x86_64                        randconfig-a015
i386                          randconfig-a012
x86_64                               rhel-8.3
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a016
x86_64                           allyesconfig
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                            allnoconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221207
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a014
x86_64                        randconfig-a003
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
