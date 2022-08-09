Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE42C19F2D
	for <ath10k@archiver.kernel.org>; Tue,  9 Aug 2022 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DHrRvfJ6E54hZFPzuGjJspjMI6aYmc5C8uKeHO/lUTQ=; b=GQsOUnRKha5c6r
	89pjxGKlulfy0vXSI2qAXcHlxYe1hPF3OpVqPcp9eGgtwsfhUcgI26OQbwZOvs+7nN+qqbBAYIm/N
	WWFWy6Wn5bC62alOqddeNQTrtJ/PBtO00Wz9wO1jFwC2tS28sGpV7zN4XsGKpS440aSm7OGHPhJkR
	Xqi8CVznHOYmPYH3Aj+7TDgsbDmBOjpCarZ1G8ja0EzqyXdJ9WN8GLRJpLjsFDjUHbYQ3oheC/w6K
	X8neYlBzJgERS3sv2xOEk7tYXfDHlngJEp/ng7P9pR2SHgO2BtGMVlV1TQvYlPHApbVyhPkrRl2i5
	AQixNRvaxaxrTjvMmgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLUEv-005cd7-Jn; Tue, 09 Aug 2022 18:46:05 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLUEr-005caQ-A4
	for ath10k@lists.infradead.org; Tue, 09 Aug 2022 18:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660070761; x=1691606761;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TDXhEO4iGKSjslJ3LmrZlgqDQRQhvEfEecYiACQzM2w=;
  b=kJS0uC/vfvEG+kUivl7MM5Vl2sBss+SELBUroH5OeNvR5a9bVdbqxB93
   vJ+9fZgRgWSjAga0JswxKpcx6a0O18ZhnXvY6AU4PMVuBem+qZtQ1xhA5
   50NWwsDVmr8S+yWTRzC/TKP5EfUXA/WGuulUarmYh5MY8a0+USsRRkhk0
   YG1R0iZpO7pAkMd+RO4c9NdEPxv2AGL5YRAtdyr84+8cno3BWG/6g6t6Y
   Oi8g/Lc4GJJUMsYfz25S0l+D1Mxy3VktG/0rbasg9cHtho2zus4SGn1uD
   8TXaEYp7GfbJrEzk/39Ij4dEQdYeLC69OMUsFhlNPJfECoitqIYU1rrrD
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="270684208"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="270684208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 11:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="637822824"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Aug 2022 11:45:56 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLUEm-000NAf-0t;
	Tue, 09 Aug 2022 18:45:56 +0000
Date: Wed, 10 Aug 2022 02:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 3ef319dd2cad30899bd52c736334e5ff12473e1a
Message-ID: <62f2ab41.gB50rAenK9nlt4dJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_114601_433799_E065BFB1 
X-CRM114-Status: UNSURE (   5.56  )
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
branch HEAD: 3ef319dd2cad30899bd52c736334e5ff12473e1a  Merge branch 'ath-next' into ath-qca

elapsed time: 706m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a001-20220808
i386                 randconfig-a002-20220808
i386                 randconfig-a003-20220808
i386                 randconfig-a004-20220808
i386                 randconfig-a005-20220808
i386                 randconfig-a006-20220808
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                                defconfig
mips                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64               randconfig-a003-20220808
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20220808
x86_64               randconfig-a006-20220808
m68k                             allyesconfig
x86_64                          rhel-8.3-func
i386                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arm                                 defconfig
x86_64               randconfig-a004-20220808
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a001-20220808
x86_64               randconfig-a005-20220808
x86_64               randconfig-a002-20220808
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a013-20220808
x86_64               randconfig-a015-20220808
hexagon              randconfig-r045-20220808
hexagon              randconfig-r041-20220808
x86_64               randconfig-a016-20220808
x86_64               randconfig-a012-20220808
i386                 randconfig-a011-20220808
riscv                randconfig-r042-20220808
i386                 randconfig-a013-20220808
x86_64               randconfig-a011-20220808
s390                 randconfig-r044-20220808
x86_64               randconfig-a014-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
i386                 randconfig-a015-20220808
i386                 randconfig-a016-20220808

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
