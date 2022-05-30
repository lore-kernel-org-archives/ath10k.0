Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AB7C433F5
	for <ath10k@archiver.kernel.org>; Mon, 30 May 2022 23:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lII4oBcjde/sYMOnQSD3uXBWJjdgbvpBlj/QbuCgZiA=; b=b5XvD3WsDM+y04
	/BfbWB2U+y8lF93B3lWD4kDFsO0dIsEmaKSZJg9vr7Jmd+ukb5dG7HF5WcBU87LaEq0f8VtXnqWcj
	kwIZmG/3OG7Q2le6xL4m5rdwu+Qt1dMVA+7abz4niuy49iTXi0fPwUc7qQHyA0+dIzzM0agTdtf4i
	BN9WtZ5Bmx6j8FEOvObJViHXnc2rwmYo41JY5irXLB3o/lq4DGPZNjnscSXHQyaz05tFW9xzOxLGf
	rJAZ0Qx1oSiXG/iMq35C+m/SlRk1YkXBLJlcMt5KpGsTMw9Dc1QhTSjafFfboxtO94UoWQhaLzdnw
	C4gf9mgAhndONwOpAnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpFm-008dmx-RB; Mon, 30 May 2022 23:56:54 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpFj-008dkz-KS
	for ath10k@lists.infradead.org; Mon, 30 May 2022 23:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653955011; x=1685491011;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d5Zyc7NkET6GlZa7dBzlQBPkY3avSI7Dr1GmPKD7/sc=;
  b=RtRS7RozvQEp960ZERxJYnTrkkT/l4VlP5lzVdSGqB1J4GNT7r6EWB8i
   +hfHZ3BErLjlCZ6gK9sem8TXvzvNGYFt2q/RlSQYeNngc4WlCA3ijtBNs
   hnpMqtILUM+zXDYKBAn0u7rf3Fy0rWYGImqjRsP9Ax7kC27UELDmPw8ZK
   E88xrL9mlR+/IdFImASNnaVaQ2iYmBMgavDySyhKdXioGh0ocCshci4sP
   fXn5IsP4hnHdc9nFKwbbgldSmxsDE8/bqr0FmpnhMMpFjjMJE2BTwMGx8
   pEw63G/JiR/WOY0/9LqvSG6sXM/Rr/KDCosnAPzvg0wo0D9/uBU4nDDb9
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="275099134"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="275099134"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 16:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="551519984"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2022 16:56:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvpFd-00026M-A4;
	Mon, 30 May 2022 23:56:45 +0000
Date: Tue, 31 May 2022 07:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 8723750e2753868591ba86a57b0041c5e38047ad
Message-ID: <62955998.VvtJBe2Q1ExjO+39%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_165651_781114_E9BA2115 
X-CRM114-Status: UNSURE (   5.24  )
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
branch HEAD: 8723750e2753868591ba86a57b0041c5e38047ad  ath10k: fix regdomain info of iw reg set/get

elapsed time: 724m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                            xcep_defconfig
m68k                             alldefconfig
powerpc                      mgcoge_defconfig
arm                         nhk8815_defconfig
sh                        sh7763rdp_defconfig
arm                           viper_defconfig
arm                     eseries_pxa_defconfig
ia64                                defconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220530
x86_64               randconfig-a004-20220530
x86_64               randconfig-a001-20220530
x86_64               randconfig-a002-20220530
x86_64               randconfig-a005-20220530
x86_64               randconfig-a006-20220530
i386                 randconfig-a002-20220530
i386                 randconfig-a003-20220530
i386                 randconfig-a001-20220530
i386                 randconfig-a006-20220530
i386                 randconfig-a004-20220530
i386                 randconfig-a005-20220530
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
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3

clang tested configs:
arm                         lpc32xx_defconfig
arm                           sama7_defconfig
powerpc                        fsp2_defconfig
mips                       lemote2f_defconfig
arm                       imx_v4_v5_defconfig
arm                    vt8500_v6_v7_defconfig
mips                      pic32mzda_defconfig
x86_64               randconfig-a011-20220530
x86_64               randconfig-a013-20220530
x86_64               randconfig-a012-20220530
x86_64               randconfig-a014-20220530
x86_64               randconfig-a015-20220530
x86_64               randconfig-a016-20220530
i386                 randconfig-a012-20220530
i386                 randconfig-a011-20220530
i386                 randconfig-a014-20220530
i386                 randconfig-a013-20220530
i386                 randconfig-a015-20220530
i386                 randconfig-a016-20220530
hexagon              randconfig-r045-20220530
riscv                randconfig-r042-20220530
hexagon              randconfig-r041-20220530
s390                 randconfig-r044-20220530

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
