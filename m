Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EA0C433EF
	for <ath10k@archiver.kernel.org>; Mon, 30 May 2022 23:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+7p1geJTulHZeMjbAtRMZ21FFUTCMVcBuoqxV5/XSQM=; b=WNLsXDIeQ8HZGc
	RXbFJldwAsuMj9NaPXJjlTFYTPfNqxKFuXZGsOWKJeUjJ8wgssHw4gHFdXygkHdG+YMH5q1g4+62n
	HZWnOPjJjTZQj67mF0ALnE7H9Sh1yVme+HAgImszyxjogsulKtn35EpG1iVYH1XcHUMv95gPcyc8u
	XTye2TVqGahNqyOsHS6VNq/OppRn0prvOyaSbpWPEfySlIHKTX0JPl3FjGVIwqMde/UMoMMHJ03EX
	+1gKwVHZiWGn64WadbxzwXtlJYbdvBQvbeBJc9B381rk0yd/G8JsZobp5tNZO+fz1EUmilMfdhHMV
	805l4M8swaWHl0Tl6+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpFl-008dmY-7E; Mon, 30 May 2022 23:56:53 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpFi-008dl4-Pk
	for ath10k@lists.infradead.org; Mon, 30 May 2022 23:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653955010; x=1685491010;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LqWV2KT9s4jiGBHkFlUu4LSr84OHIKq91tdinKwZWOU=;
  b=Io6tFFQxVN/EMl7DxBZq5h7bl0qVbKu6BV+e4qwbjEoEoMUp1zkXXhSM
   C6/NhsOx3O6zVCyUtimyBzWfpSRLrk6cQFeUvVMleSFA6R3LWIqn+udnr
   zsN+UfcmYuwmSGgf4BK4pKteTR7lqew6o5R5SwS6GuRIAtoALCJARrqFT
   514fIIe3evyV09hFQ9zV1lHPLMdUJj/pii4zCA9F7zCG+1uY/HnXDIwgF
   akEydWmOP5Jo7Pz2V9sHpAQ5fJiPxbRb+WBfrXfQMBk3w33iPNZJIYTjl
   AWQqI9Z0yJCg/r91bF9C7c1SSKXNH1+KSor+HzQPnpnUBKZD+SaflVU0W
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="300447196"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="300447196"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 16:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="823024535"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 May 2022 16:56:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvpFd-00026Y-EC;
	Mon, 30 May 2022 23:56:45 +0000
Date: Tue, 31 May 2022 07:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 88c1effa65924772c73c977ec34d012feec35116
Message-ID: <629559a7.eJqit4P5Vc9zwJIF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_165650_905571_2D202CAB 
X-CRM114-Status: UNSURE (   6.70  )
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
branch HEAD: 88c1effa65924772c73c977ec34d012feec35116  Add localversion-wireless-testing-ath

elapsed time: 724m

configs tested: 93
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                           u8500_defconfig
arc                            hsdk_defconfig
m68k                       m5475evb_defconfig
sh                     magicpanelr2_defconfig
sh                           se7721_defconfig
powerpc64                           defconfig
mips                     loongson1b_defconfig
arm                            lart_defconfig
s390                       zfcpdump_defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20220530
x86_64               randconfig-a004-20220530
x86_64               randconfig-a001-20220530
x86_64               randconfig-a002-20220530
x86_64               randconfig-a005-20220530
x86_64               randconfig-a006-20220530
i386                 randconfig-a002-20220530
i386                 randconfig-a006-20220530
i386                 randconfig-a003-20220530
i386                 randconfig-a004-20220530
i386                 randconfig-a005-20220530
i386                 randconfig-a001-20220530
arc                  randconfig-r043-20220530
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a011-20220530
x86_64               randconfig-a013-20220530
x86_64               randconfig-a012-20220530
x86_64               randconfig-a014-20220530
x86_64               randconfig-a015-20220530
x86_64               randconfig-a016-20220530
i386                 randconfig-a012-20220530
i386                 randconfig-a011-20220530
i386                 randconfig-a014-20220530
i386                 randconfig-a016-20220530
i386                 randconfig-a013-20220530
i386                 randconfig-a015-20220530
hexagon              randconfig-r041-20220530
hexagon              randconfig-r045-20220530
riscv                randconfig-r042-20220530
s390                 randconfig-r044-20220530

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
