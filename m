Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75BEC636D6
	for <ath10k@archiver.kernel.org>; Mon, 20 Feb 2023 21:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OLkJ4KM6zKHOWjoF4v/51PfelAJRp72lh2Nxgec8KjQ=; b=aIIWElWrUzks1Y
	PYRRtKOZZ14shoYGVG4QDHc4Z52PxaeN6V0ab/my4/0EmpnRFSMRn6SoF5A4ZZAfxpA/3cwwbbLyZ
	HaUcppf8g+ocm90DHTkFEyE5+/rK2Qh44d6/afsOV2Y+OIcvaw9C0YhvT7J4bxRREjqMuOFoZzx4Y
	W0m2jelRlzLST9a1CDohZyxQKabxR1xwLVAx+IDMYKSWmDR9YdRwiB0IBKXpfqk1lH6ij5r2tJcb1
	xfOFzPsBNiu3xs0vowcwxk9R3KjIxP/D4LYxGCqpQB4nYcUW47tDGARTS6gdcL2pUVTWj0m7X25I7
	eKoYCPV6JTpuMyWJqLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUDJz-005aOg-5T; Mon, 20 Feb 2023 21:03:39 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUDJu-005aMQ-Nw
	for ath10k@lists.infradead.org; Mon, 20 Feb 2023 21:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676927014; x=1708463014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QasE0TTFWIiLZ/JPg3GJazd9dvl/IYO/SW/Jptsbx8I=;
  b=IhWHZiscHSdiPGi/0rzClmyM4PARsvwMdAmIW+DdBOE6g4KTN+9eB0Su
   2Ilb4q2UblG7ArWyOEYrIo1Dw8wbii+dJkm4vUh8hxTfgBujGsTVwusMo
   uw+Ms8RpArHPahEQxH2TP8Tluv7zBE5LFUkTVXRpX5PXlUg66ol0ZnapR
   34N8RrgCi/2lcGALTJ3bDfSsB1uSP8A+vAb9R/4UiNnVQkyQZYF0HtVBC
   FLqH3Paf1afSBF1cC8VsVdKgdWfT2oiMXmFkggq7+fNt6HPhPfw0AQ9oy
   T+bgq2MEzHofBy11ok2HGht/2Lj2J4RsyUZ/29RuI7tv1WQOBCINo7amR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320615627"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="320615627"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 13:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000377008"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="1000377008"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2023 13:03:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUDJo-000EAb-2V;
	Mon, 20 Feb 2023 21:03:28 +0000
Date: Tue, 21 Feb 2023 05:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 0db33aa874a9a46b5105da38d3c4f55e57dff4e6
Message-ID: <63f3e018.TPdd0lZvsGTX/jIm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_130334_851248_F5CDB826 
X-CRM114-Status: UNSURE (   5.94  )
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
branch HEAD: 0db33aa874a9a46b5105da38d3c4f55e57dff4e6  Add localversion-wireless-testing-ath

elapsed time: 729m

configs tested: 79
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
arm                                 defconfig
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
x86_64                               rhel-8.3

clang tested configs:
arm                  randconfig-r046-20230219
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
