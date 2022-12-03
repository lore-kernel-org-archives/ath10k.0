Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DEDC4332F
	for <ath10k@archiver.kernel.org>; Sat,  3 Dec 2022 12:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sqJNyg8qzaR5br7Mafdj+OA5onVnOgZoHwi6IigaxYY=; b=3S+ry/qodumaX1
	eINwlSYzON0vjC9+++IHDsEbUo/EhSSXPw3n+mCBVhtJlimeDNK4Dw6DakqkzoZTDrXVuL5V+zYjA
	L3/aqUA6SLQuBaH5TaXROaVBHvNZ5mmkyEabWEf8V64X0HhSU2UbgIMmbBO5zviwqGO2T9v/6qdJP
	cNqZFu73XsDUx9MzUHD30hoWQyfCINItXL7JBNvA9nPo6W4FEutcz8S6+ylSVYSYorOwYO9frbvVN
	juQuIlGPhswH3PDVGmbDybn0+flCDf5KWBTx1YykbAAet66awSS2SWBDmuG0NO8LKEHKJ1FcQJ9cg
	q57I0CKxQknxG1X1gX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1RR0-003Plw-Sl; Sat, 03 Dec 2022 12:15:58 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1RQx-003PlW-Qe
	for ath10k@lists.infradead.org; Sat, 03 Dec 2022 12:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670069755; x=1701605755;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QvxN8tjv3rKKuap16lBJeZmHBmc2rzygeWLSydOMv/Q=;
  b=hZTTWRJJr4y1wNCQZTNLW+2DMHYkKQGqRG/RpqaMBTyiunQK1TsqpwZb
   EiEFzyYxjvwuqmstDV7FmnWLtxhKbUm/A49CcKdoVIf6WiS+2k7DtAmtk
   lLWDCdYy1plVDwnfZXFJwwxoLGhXSWHxY4DxWglQFVijOXw5+Pp1tWxhf
   D3K/93s2LlgBjYuTEOzTgarPeOq8sx9EVQzCUEpZ+oxVnJNZir9viHjXV
   4/s6pA8WLzBB8pESzBYdLzBkIkWi4AyZG3Da9eM76dwjcJfTipmOUPUkE
   r0/tLRjv0rce0KDMPqqFFU9PWSQEScITB4zxpl0uSf4ZQjqBr2GZzmfpM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="299540103"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="299540103"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 04:15:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="622991155"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="622991155"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2022 04:15:52 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p1RQu-000EWR-06;
	Sat, 03 Dec 2022 12:15:52 +0000
Date: Sat, 03 Dec 2022 20:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e44de90453bb2b46a523df78c39eb896bab35dcd
Message-ID: <638b3dc0.gTPksbyjccv1vwaL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_041555_940261_C3E97AC0 
X-CRM114-Status: UNSURE (   5.21  )
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
branch HEAD: e44de90453bb2b46a523df78c39eb896bab35dcd  wifi: ath11k: Fix race condition with struct htt_ppdu_stats_info

elapsed time: 869m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                             allmodconfig
s390                                defconfig
ia64                             allmodconfig
x86_64                              defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20221201
x86_64                        randconfig-a002
riscv                randconfig-r042-20221201
x86_64                               rhel-8.3
x86_64                        randconfig-a004
s390                 randconfig-r044-20221201
x86_64                        randconfig-a006
x86_64                        randconfig-a013
m68k                             allyesconfig
x86_64                        randconfig-a011
alpha                            allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a015
x86_64                           allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
i386                             allyesconfig
i386                          randconfig-a005
arm                                 defconfig
x86_64                            allnoconfig
arm64                            allyesconfig
m68k                             allmodconfig
arm                              allyesconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r045-20221201
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001
arm                       spear13xx_defconfig
arm                          ep93xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
