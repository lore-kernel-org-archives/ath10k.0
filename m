Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C11DC07E9D
	for <ath10k@archiver.kernel.org>; Sun, 25 Sep 2022 02:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iAvLnBMdk73miv8VfWWiyBRnHtxBVVVjYH9mazP2pjk=; b=Zo9/8qflw1G6ap
	PMBnL2I83u0nRLErCqhvoPBKaPoU/vwauww9uWLzg7E+azhsxuPBd/w5wMq9MrOXDunt/ILVeYR2u
	RHkphnpV82ycqwlFmCP31ucYBzP248jkUrFNCI/Libomf4rELAyOHg+b0kx8//TzBqsNKof3Ia/2o
	PwPlVSHmIsSejNUYI4+cxcmeRXTRQ/D9cMpaBjFMX8bLAOkJyUQkxixCZFDHbljYrOP2RYu0jgMee
	mbUGsHxd4uiN5BJ7RSRUDoRbyECFCkE1/LLdg4fc09pncSrPnrcLCZddK+HUFaGcWiaXcnwzHK67H
	Vdr90vZAf02FDTn0x9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHDz-00AMlN-W3; Sun, 25 Sep 2022 02:18:32 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHDx-00AMjf-7M
	for ath10k@lists.infradead.org; Sun, 25 Sep 2022 02:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664072309; x=1695608309;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zq+UhhOcZHYZB8rOTOvVqakKiQY2U/35Ii6BfYLRRco=;
  b=H8ZNbRqe/yg37/mnb+uNscUx+KcA3wZOW3iTUQM6FcMeq3BfvyYiT6rg
   wjs/rOvhUAlYzT8xgEswsXB3TiNCdmUcV5bZktLFOktoq6ChHyG9dinWk
   1iUuK3hsWMFW0ZyYoebIaWQ7uinPyxVoJwZj9dnWEoDMKBQ8bbgt29rRe
   2GO6Ny19OIJ7r9WnGtwnXuKXqh6Sb4sEvt3Ln6skhlg0TvJexWrx5XhHE
   Z7laJC4pPRe/CVcuS2kLFx1P4PYS0wPl617xMJQkZhC8G9PoEFSfqI4ol
   TaRr/y/9Qvs1AvlwOpPZHxFlfv/EUKkE4bs5Olzr6vvsdGqGQxmiJAg5C
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="281190959"
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="281190959"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 19:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="709722206"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2022 19:18:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocHDq-0007Ha-1A;
	Sun, 25 Sep 2022 02:18:22 +0000
Date: Sun, 25 Sep 2022 10:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 d673cb6fe6c03b2be157cc6c5db40481828d282d
Message-ID: <632fba40.KWrHJnDGT+GqKSu+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_191829_342947_00141ABF 
X-CRM114-Status: UNSURE (   5.38  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: d673cb6fe6c03b2be157cc6c5db40481828d282d  wifi: ath11k: fix peer addition/deletion error on sta band migration

elapsed time: 720m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220923
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                 randconfig-r044-20220923
powerpc                           allnoconfig
riscv                randconfig-r042-20220923
x86_64                              defconfig
s390                             allmodconfig
s390                                defconfig
i386                                defconfig
x86_64                               rhel-8.3
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                          rhel-8.3-func
x86_64                        randconfig-a013
x86_64                           allyesconfig
m68k                             allmodconfig
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64                        randconfig-a011
arc                              allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a015
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
i386                          randconfig-a012
ia64                             allmodconfig
i386                          randconfig-a016
i386                          randconfig-a005
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20220925
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20220925
riscv                randconfig-r042-20220925

clang tested configs:
hexagon              randconfig-r045-20220923
hexagon              randconfig-r041-20220923
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a006
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
