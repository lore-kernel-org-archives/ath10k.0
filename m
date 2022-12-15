Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7D5C4332F
	for <ath10k@archiver.kernel.org>; Thu, 15 Dec 2022 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r9liEPlB8ARdMwJHAuem13VVLFtoouwales6n2t+qI4=; b=VSlYlNmwXX7hyo
	IjRUlblvowKZS1a4LugfzSv0FqSWZIjdJhD6XZxGkgsAe7hSbdy1XWLIiGm+88Nw4O/AcEdMXGjxa
	BXUDBGQPgQqCGaQupsJSDi6nyGnAIBnrm8pZ33hTMHhoTyKcVsgRZyiE1Gqf3x8K6lah6UyC9SIWG
	oWqEvAMT4CHmYh7jJmPIoTznKpPBsvj34r+IbzeGhLR+l9pMuD3OlxoU1JjzobSpGB9uLfj+37Zxo
	6aLOr18Y0zIuqM7Yr8mSPOvnrFxfp19wp/M+QVfTizfyzWrUyFBRQ6fOz50rHIIjRDnf6JKAfKLYF
	+M0FoHJqGYgahFins8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5x3l-00BfJt-FE; Thu, 15 Dec 2022 22:50:37 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5x3i-00BfJ6-Rv
	for ath10k@lists.infradead.org; Thu, 15 Dec 2022 22:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671144634; x=1702680634;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vONQ47DF8XwN+w0sscHBNXpKLDT6KayiB9a/SOHCrz8=;
  b=PdeMUNnQTfK0/6ONXXeRNAGgRbPEldvsr1erzd1aQrKXRQCyUWzxDV2u
   t/OObi34Au2hwD5T2A46YL2yJ+WJPjDI1y7bT9gL3HZcvMZr3e9r1Mpt5
   JI7jzBSLDerY+/sERgbhWdYaAMwfzmGy3HmltNiMH0Dv/JN1LHTCBN7HG
   EKMKW2vnUDc2EYKusPlyYfz30pON4kXWev48kyr4bfhdtIdmjDQ57Jjk/
   kD5Z2+jTzqMyVynXVzT/OfPmbU0REoh+3meqwPoC2dj4VXTwhkFZAn0vh
   C7huVsLRLMMPlJ9Z59vFB4Opb2nDf1vRzsKKBWFeqPkccppKjhPo/azdq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="306492393"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; 
   d="scan'208";a="306492393"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 14:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="680264487"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; 
   d="scan'208";a="680264487"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2022 14:50:08 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5x3H-0006gM-38;
	Thu, 15 Dec 2022 22:50:07 +0000
Date: Fri, 16 Dec 2022 06:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 58e4b9df840cad439a4c878f81bc105cac2197a7
Message-ID: <639ba49c.otzVGCLfC6ZPC7MW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_145035_024531_F6C078FF 
X-CRM114-Status: UNSURE (   5.42  )
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
branch HEAD: 58e4b9df840cad439a4c878f81bc105cac2197a7  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
um                             i386_defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                               rhel-8.3
s390                             allyesconfig
x86_64                           allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20221215
arm                  randconfig-r046-20221215
x86_64                        randconfig-a006
i386                                defconfig
arm                         lubbock_defconfig
powerpc                 canyonlands_defconfig
arc                            hsdk_defconfig
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                            allnoconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                        clps711x_defconfig
arm                         lpc18xx_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                  decstation_64_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20221215
hexagon              randconfig-r045-20221215
riscv                randconfig-r042-20221215
x86_64                        randconfig-a005
s390                 randconfig-r044-20221215
arm                       mainstone_defconfig
powerpc                     tqm8560_defconfig
riscv                             allnoconfig
arm                         palmz72_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
