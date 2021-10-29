Return-Path: <SRS0=agdb=PR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41B6C433EF
	for <ath10k@archiver.kernel.org>; Fri, 29 Oct 2021 09:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A551B60F23
	for <ath10k@archiver.kernel.org>; Fri, 29 Oct 2021 09:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A551B60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XNp60Jde0kteUoxIyXlZYD0VCWnGFB+gRHlM/kc5yiE=; b=jhZPgAHVVbIiHV
	a0n64Xqzrmdr4Ivm9ldwJu1NQVR3GMl649IlzMbc1SZ9VhhWE76CR3PKSrqWvXpJF/MXbPTcQhsIX
	yRVSNqdYhiQy4AjSDlrR5JzAgBjyc+7QYM0nAYivRVE9BkUvnChWoV7asYpya6b/5IwAQcdMD0FNa
	8A6xjfRraRqvg8iLAiheSskgFu567Dug7vqcQleSyylrIWtogx5/zq3rXkIOHmsKOHVbhNrzP+Oep
	xXVm96AC8QYBQQ8OC7m1tnhe30dJ5cIVwRifvyoh2IHhaaF/LLaV0WS8jiO5EDdgOrnb+44Ey5/yt
	ma8Q+3hhfQdBt+fzNEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgO1O-00ATR7-UH; Fri, 29 Oct 2021 09:17:58 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgO1M-00ATQM-24
 for ath10k@lists.infradead.org; Fri, 29 Oct 2021 09:17:57 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="316826626"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="316826626"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 02:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="598150323"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 29 Oct 2021 02:17:53 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mgO1J-0000BN-7b; Fri, 29 Oct 2021 09:17:53 +0000
Date: Fri, 29 Oct 2021 17:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f8bc49ccdc7ecf045f167f7164f8b34521ca9f6a
Message-ID: <617bbc24.Ya7xsnXazWi7zVVD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_021756_227930_29FE27F9 
X-CRM114-Status: UNSURE (   4.72  )
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
branch HEAD: f8bc49ccdc7ecf045f167f7164f8b34521ca9f6a  Merge branch 'ath-next' into ath-qca

elapsed time: 1459m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20211028
i386                 randconfig-a003-20211028
i386                 randconfig-a002-20211028
i386                 randconfig-a006-20211028
i386                 randconfig-a001-20211028
i386                 randconfig-a005-20211028
arc                  randconfig-r043-20211028
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20211029
x86_64               randconfig-a004-20211029
x86_64               randconfig-a005-20211029
x86_64               randconfig-a001-20211029
x86_64               randconfig-a006-20211029
x86_64               randconfig-a003-20211029
x86_64               randconfig-a015-20211028
x86_64               randconfig-a013-20211028
x86_64               randconfig-a011-20211028
x86_64               randconfig-a014-20211028
x86_64               randconfig-a012-20211028
x86_64               randconfig-a016-20211028
i386                 randconfig-a012-20211028
i386                 randconfig-a013-20211028
i386                 randconfig-a011-20211028
i386                 randconfig-a015-20211028
i386                 randconfig-a016-20211028
i386                 randconfig-a014-20211028
hexagon              randconfig-r045-20211028
riscv                randconfig-r042-20211028
s390                 randconfig-r044-20211028
hexagon              randconfig-r041-20211028

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
