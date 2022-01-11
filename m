Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA11C433FE
	for <ath10k@archiver.kernel.org>; Tue, 11 Jan 2022 05:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2hCL+XhbwRSMzijERR8wugjg6qjF0HT7E/1D4lfMiv0=; b=Twj2p1Gw/l33Qd
	ai65VR9MV8jjZY0sTsWrxaMd5BaXttDLT10WBTrFxMf7Z5wmZSKKl873qajUw4Q+48i8QxNxlfhyW
	9rVj1/DEhTY5uVsssfykOavmcGBPv/tPjA/cqOz4r1Gln2zCKBK1hDiGec0fQvr+/RlZS3v2tDv17
	g2nm2wT/C5evO91av3hnp9mTv7hz7WBtFGBHShU0e3z3t/0Cjz6jX7g3bVJAOnfjxOFEPP1+BOiEv
	NwOiLQxW3vkUB5R0SjRxVEO1ZzvmsAJrILk0lmrK+bj8+foq2GumzdJ+c71uMKvpABeZOh4bvCWPj
	Lnhuw+EM14rOPJKPHTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n79nk-00Emn8-Fr; Tue, 11 Jan 2022 05:34:32 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n79nh-00Emm6-So
 for ath10k@lists.infradead.org; Tue, 11 Jan 2022 05:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641879269; x=1673415269;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=T9MrLMmU9CLHGjxjNQWJW9uqnIUpyQju4NikV1bMCSQ=;
 b=fviOdBy95726+GCCSqavph2FvLsLN7BaC+ajj1p6jP/h5egeTuM4wQjL
 Fa4Tk75ZnqdcOXe4RixZF/xV8akUrYCV3OPFVfvb5Pp2ItGkrLoo/6JK3
 XuDBggl5VdZ5pNIEBY66qbsZQCEJM/e8c5tG6JYa3ntK8/pLoDPz7Owzt
 XK773onpeHZQ2Mon0bItmLP8uf8TggKvEyiLBqKk91+Q7jPKY1dcdiW8R
 9CZCsxxfgdgjzwTw7NY8HNPvMy2ErbbvV7EuzhZlV5eaqVCixdsOh+paY
 Ekt+CUxqi4Lfbt9Kyr3kr7uS08HrEoZorDhz59Otg41bJny9T7u47Ehlv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="306759567"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="306759567"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 21:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="619704405"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2022 21:34:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n79ne-0004Q6-DF; Tue, 11 Jan 2022 05:34:26 +0000
Date: Tue, 11 Jan 2022 13:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 d331e47d0676e5e371a2a4714acc4faa3b876c29
Message-ID: <61dd16b0.4hBg4ufxxi1jjSdf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_213430_015323_F2FEDC97 
X-CRM114-Status: UNSURE (   6.03  )
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
branch HEAD: d331e47d0676e5e371a2a4714acc4faa3b876c29  Merge branch 'pending' into master-pending

elapsed time: 735m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
