Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA76AC433FE
	for <ath10k@archiver.kernel.org>; Fri,  4 Nov 2022 23:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pLlN3sGSwtg9M6mtnfhBqwaLBN4itpW3yRuDJE7ez3w=; b=dGD3I26jqM72el
	qmUcjFscAbT55uGNsetJcsMDR0mWF5UTEJ5k+A1xDnWqCgw1e+hHd3HaKD125z5LnnDB97y3OvuFJ
	dAGrH8r1hS+b0aGTs1PDvGzNE7rKwXMjR8ExrFHJep6r/Pl8PuOthPO1SN4zGw//qZCpZUzh+xaqL
	z/zGVE0c+71UX9puJWUnJWpzn5E+WnfyqFLCyC7FJcdMii9rtABJKisqxohB2CLdG5SbhcPCYrHB4
	0xOcXEdJAZQL4UGLh8xyaQIJa3wUjPiVg2CSz0fBArD5Z3fjh9/WyCxsHulVXTXn6R7t0DBlot8Ob
	UOLY0JJhzznPSwApBs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or66J-005U99-DG; Fri, 04 Nov 2022 23:27:51 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or66F-005U8l-LU
	for ath10k@lists.infradead.org; Fri, 04 Nov 2022 23:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667604467; x=1699140467;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MUMRqj+RoIhTh9/IWWKXuelsWFr97Au+Eke7TOTP5f0=;
  b=DPVOx+aqv700q2q0mmun1FXxaS0lF7RDHpuuIFQlTUMR55Zj1zB7LkMc
   oHRA4uO2S8EcGtMZi7LVwKm4bpiQcLWPMEyy7bHquvLhVJPO1De426fDQ
   cioH9H/KbqM9dnVH3/6g9AXO3veP3TSesxfIxzaCxXbIbdfAG8EVh2fuW
   DB7hyWc0XKCvkfThauJHL1wLTTjX0M4qWuvFyIRE3We7jhhb8AoecSiMa
   r5nTJXpSs6nmmZGhc1n/pSvu0jXkzfyOhXJvcTEXM/k0Lek9WoXgNmUov
   nymaIBAxqIZ8d8ypxlESpHfbM2O1cmlyu7AOPeWrV/WuxRB0qTAcEVSDE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="297567080"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="297567080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 16:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="698825193"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="698825193"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Nov 2022 16:27:45 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1or66C-000HQr-1i;
	Fri, 04 Nov 2022 23:27:44 +0000
Date: Sat, 05 Nov 2022 07:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 adf26aed2c11c7c43d70acce7947a0a7f1e94c52
Message-ID: <63659fcc.Gn2IjawBrOEEUQSA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_162747_773228_BDA53C1A 
X-CRM114-Status: UNSURE (   5.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: adf26aed2c11c7c43d70acce7947a0a7f1e94c52  wifi: ath12k: wmi: whitespace fixes

elapsed time: 727m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                        randconfig-a004
x86_64                               rhel-8.3
x86_64                           allyesconfig
ia64                             allmodconfig
arm                                 defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
riscv                randconfig-r042-20221104
arc                  randconfig-r043-20221104
s390                 randconfig-r044-20221104
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
um                             i386_defconfig
x86_64                              defconfig
um                           x86_64_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221104
hexagon              randconfig-r045-20221104
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
