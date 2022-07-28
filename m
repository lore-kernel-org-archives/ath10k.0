Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D0FC04A68
	for <ath10k@archiver.kernel.org>; Thu, 28 Jul 2022 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=19t4NaILeH5kny9mZ9kyNAYZEzL/IcD4K97uu8zSAwo=; b=lLBqdjVBOeWMBo
	3udTmXlyTwEpZ4pRFB/b7d/BhrhbuVHj63jUHvrengSrhe++Os7zhVyE66FxGO+Yka46ZR8n/Q0v2
	ME6seoIQY37Jk+PcQ2uYvu2dx+/LZvvEeeRNHKNcNiRpFKiTD7UG1xF3/xlGHVTqPVGBJY21nJDr/
	JZmZXYQiKBcMCAbVrnqrLeZLH8urmSTacZw7N41RN0g20E8unCcgYOhE7V4YrFMecNKw/I9GYfuX+
	IIIbMDmMugMzoHkdmW3fPdYdb/Yte6xWL3YVwBLgb4q5nOLw2d6v3L41dIZKYOMS3spN5kbXjOBkj
	6aOzVpSYSc+jbJgb45dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5IR-00ASjI-LT; Thu, 28 Jul 2022 15:19:31 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5IO-00ASgk-Pd
	for ath10k@lists.infradead.org; Thu, 28 Jul 2022 15:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659021568; x=1690557568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xgyAeXKb5TepEzkpcrHjGOrtUg/wpdTU87Lr6okPy3I=;
  b=evIV6VDWySN3FJm7dDZuPS4lKPg6+mbKUPTftqqi534IXoSedanh7Li6
   /odQp/4MK8xHoS160gRSKcInctq4rIuLG2y+ACmJu049xBeD4FEdypz9q
   E7+WD5rS6Bu5RJdviwS4yWMPix9s+Fu/K8XSR3hU+DYg/gPISnR7iZRMW
   UmgKAoQM1GiK8CjVs9jfvg5h84lvIqC65rYzlVzGjc357+lLlzJbJgkBY
   Y73BrXXhkW0ExWA3din7P+Mw7eMchXuGrvZdgjv7Oaay+Stuf5sLmmySZ
   oqZnIwvcqhMbdneTSTvn6Nt9VzLM6G/g6WcQ6eni01/OqLwXtj5iwfB6l
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="288549372"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="288549372"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 08:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="628934729"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Jul 2022 08:19:24 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH5IJ-000AG3-2G;
	Thu, 28 Jul 2022 15:19:23 +0000
Date: Thu, 28 Jul 2022 23:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 97ed4b58ce506d69e5bae47d4f9e7886237d53ba
Message-ID: <62e2a8bf.kKtKA6VhzVFJ/Aa3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_081928_876236_DB4145AC 
X-CRM114-Status: UNSURE (   4.44  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 97ed4b58ce506d69e5bae47d4f9e7886237d53ba  Merge branch 'ath-next' into ath-qca

elapsed time: 1708m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
x86_64                        randconfig-a002
arc                  randconfig-r043-20220727
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a012
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                              defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
m68k                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220727
x86_64                        randconfig-a003
hexagon              randconfig-r041-20220727
s390                 randconfig-r044-20220727
riscv                randconfig-r042-20220727
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
