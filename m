Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D15C636D6
	for <ath10k@archiver.kernel.org>; Mon, 20 Feb 2023 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ebrrJBPjv8eOsHfy2ohnr82/iXPniF78VKxFlj5s58M=; b=kE4t0qBE+tnyzU
	CuJ+7R0s5nA1Nwf6q3tS+uqCErt5bBFEMWY4xwXq41ChbgehabSvQMlbcLRk0z3yoPrwwWz5KecEB
	Lh9gAn5+yGxPrjMW8fkvR9bDg1T5HIAFT4HnlJbyV5yDgqOdcVNsyo/wEUeraT8W+OQm+Lpd4n+I9
	dJfezVqvdx7LRHMYWOUngq9TSUt5dC1XH2cayX+PYYztoBCKzDB8tCZzOsPgGwNsuB/qQbucLWq++
	rPNFSmX0YWsP9nGSqYxtAdYLNaP1yqH39nMwQRJ+s562PYgKOLI7zAv3PsV6GqspQxw6T21qvULRQ
	xKWSg0+sqWaMlbe/M59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUDk2-005edX-KE; Mon, 20 Feb 2023 21:30:34 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUDjz-005ed7-MF
	for ath10k@lists.infradead.org; Mon, 20 Feb 2023 21:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676928631; x=1708464631;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rwTugVsiGrCI2IgyGRFsYuY8ORNLwnxqXklDDt/pjok=;
  b=MhPkXC3++62faT+wgvhFZd9Y0L0ac7mqEGcPmhV481n1Va+ZbkJ00P/l
   CYdPpUdBRV9XDwui+xiWRPtSpko80LYJ1FIYe/5tFdqACbzT+YwUQIaza
   E86qH4qbtbfm9nMa8208Np87afhgCboxalVu4PlGD7ZA3xDowqrQglb6+
   lI/vj4npFjsfl+yMK7ag3LPli4cmBwULGK5MRuwQ9ErSgfqPLq1ytIxtM
   nB0O/U9iy9kQxQAYf9QpWBfDcwzf4QclYH7KS5UskQ11mODJKFW5UFbJn
   6UgfUYS0XbLPqoa5UaA/J2sM2CxZZpJSxKvgj1MWdtc99Opa2poP2WJPK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="331157310"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="331157310"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 13:30:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="673469163"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="673469163"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2023 13:30:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUDjx-000EBQ-1m;
	Mon, 20 Feb 2023 21:30:29 +0000
Date: Tue, 21 Feb 2023 05:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 e02095635d5ae4536803998a63c074df14a15161
Message-ID: <63f3e66c.McGuSxeIoC0Nw1jz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_133031_770349_4A7C8B0C 
X-CRM114-Status: UNSURE (   4.75  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: e02095635d5ae4536803998a63c074df14a15161  wifi: ath10k: Remove redundant assignment to changed_flags

elapsed time: 728m

configs tested: 90
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230219
arc                  randconfig-r043-20230220
arm                              allmodconfig
arm                              allyesconfig
arm                         assabet_defconfig
arm                                 defconfig
arm                  randconfig-c002-20230219
arm                  randconfig-r046-20230220
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                 randconfig-a001-20230220
i386                 randconfig-a002-20230220
i386                 randconfig-a003-20230220
i386                 randconfig-a004-20230220
i386                 randconfig-a005-20230220
i386                 randconfig-a006-20230220
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                      bamboo_defconfig
powerpc                        cell_defconfig
powerpc                         wii_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230219
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230219
sh                               allmodconfig
sh                         ap325rxa_defconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64               randconfig-a001-20230220
x86_64               randconfig-a002-20230220
x86_64               randconfig-a003-20230220
x86_64               randconfig-a004-20230220
x86_64               randconfig-a005-20230220
x86_64               randconfig-a006-20230220
x86_64                        randconfig-c001
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-r046-20230219
arm                        vexpress_defconfig
hexagon              randconfig-r041-20230219
hexagon              randconfig-r041-20230220
hexagon              randconfig-r045-20230219
hexagon              randconfig-r045-20230220
i386                 randconfig-a011-20230220
i386                 randconfig-a012-20230220
i386                 randconfig-a013-20230220
i386                 randconfig-a014-20230220
i386                 randconfig-a015-20230220
i386                 randconfig-a016-20230220
powerpc                      ppc64e_defconfig
powerpc                     pseries_defconfig
riscv                randconfig-r042-20230220
s390                 randconfig-r044-20230220
x86_64               randconfig-a011-20230220
x86_64               randconfig-a012-20230220
x86_64               randconfig-a013-20230220
x86_64               randconfig-a014-20230220
x86_64               randconfig-a015-20230220
x86_64               randconfig-a016-20230220

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
