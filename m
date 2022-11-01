Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E62FC433FE
	for <ath10k@archiver.kernel.org>; Tue,  1 Nov 2022 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1/T5ZFYa8TcKakt1X2QMDSzQUP7mMH3TqYRyn5Asw7g=; b=LEawCVqj+UbK7o
	1ZnH+wgUBBY5DGmk/HgD+H6j+m8e9qRmQTCLuOw1FmE/7L8zPvQyA/R9kH+Bqb+Cxk9InIQyCX/2X
	8kbxavPHUEN9gwsco7KhPZ3uuWtmKew6vWAnHwKCCAc9rjDnnH2NKfLn5T3aYlb2PIH5prkD8pWgA
	IIC33mQGGurHp0B1ybCjIxGvMqaBn1J94Te+cAh7hVwgEWHF5daPeXttS9oamxp/OAVMh0kc/gSnD
	oBrgqrsd9gDSHXUD0HD4XebD3E04bUOptNN7lWeB3LzkTy0KOYZtbDXQrLzJIwwFqWN/RPOJLxMxG
	75AK7lSdNUesyrrE0Vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opz0p-007EZx-W2; Tue, 01 Nov 2022 21:41:36 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opz0m-007EXv-C5
	for ath10k@lists.infradead.org; Tue, 01 Nov 2022 21:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667338892; x=1698874892;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tkRHCugwl4wUn0vbXGqiPQulkrQhhbdc0SjR9cQrvAE=;
  b=n4xakrrK24RULBg6/6wQKHNrtApmTl4VibVORJFbyfdxvNw8GFEBE9Pg
   ZjK+l9oEpq/3U9wLWBxI9Z/Jsy2fmRqsDPVL3RqxrZLFcrazbn2j5ZBpD
   bqw4+WH5enOybVn5M9iLiLEv3juE1KovIVLZjMSArlPmTVtes5078t4s9
   u6De6z9snbyM4woQWBC6aTrj6roKXz6c4wdeMai5iAAfSLSf4gASzSxTi
   3jgPQjlIgYiA/LQ+S9bSLt6xKreeYvuXjnP7gOzwdUWjKg72PZx3QNNcx
   XTcKgFtXAhmMKziTaodqon9Sj+XTQj45yorUZtVcCcqvaU2XxZMnYET9b
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="296685136"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="296685136"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 14:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="879233127"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="879233127"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 01 Nov 2022 14:41:25 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opz0f-000E46-1E;
	Tue, 01 Nov 2022 21:41:25 +0000
Date: Wed, 02 Nov 2022 05:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 85209c1fa23030269358b870b812abf54c727bc3
Message-ID: <63619269.L/LH4mGg4CMLUdWl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_144132_485140_A9B707EA 
X-CRM114-Status: UNSURE (   6.41  )
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
branch HEAD: 85209c1fa23030269358b870b812abf54c727bc3  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                        randconfig-a002
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a011-20221031
s390                             allmodconfig
i386                 randconfig-a012-20221031
x86_64                        randconfig-a006
i386                          randconfig-a001
x86_64               randconfig-a012-20221031
x86_64                           rhel-8.3-kvm
i386                 randconfig-a013-20221031
x86_64                               rhel-8.3
i386                 randconfig-a015-20221031
x86_64               randconfig-a015-20221031
x86_64               randconfig-a011-20221031
x86_64                           rhel-8.3-syz
i386                 randconfig-a014-20221031
i386                 randconfig-a016-20221031
arc                  randconfig-r043-20221101
ia64                             allmodconfig
s390                             allyesconfig
x86_64               randconfig-a013-20221031
x86_64                              defconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20221031
x86_64                        randconfig-a004
i386                          randconfig-a003
x86_64               randconfig-a014-20221031
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
arc                              allyesconfig
i386                             allyesconfig
i386                          randconfig-a005
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                           allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20221031
riscv                randconfig-r042-20221031
s390                 randconfig-r044-20221031

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r045-20221101
s390                 randconfig-r044-20221101
i386                          randconfig-a002
riscv                randconfig-r042-20221101
hexagon              randconfig-r041-20221101
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r045-20221031
hexagon              randconfig-r041-20221031

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
