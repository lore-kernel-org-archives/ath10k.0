Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9224C43334
	for <ath10k@archiver.kernel.org>; Fri,  8 Jul 2022 02:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a5RmJL7mTh+Z+BFOmvNgdzOkpIOLAbXBQgXsLEjyVrM=; b=KLU19f52Kc5fzh
	aZT8g7MS4dMCaUbDL7NgZpA73/9sSaCH+oYhdOaPYXEM1nNANuuoZR2NXhxNMAanmHJipv7SLO3Pm
	9922G1LX+NpDtNX7FE1Llea3j+fuIj5PvpWL9AvMwH/bsN4aqDqwbN/qVPPopiME41pd2BsUx2rLx
	sA5ly9ngbe/PLo/Q3Sju44/jPeqYZ83+NWkMiJ26N3b1jzDCAv9w9iuGHgVOtcriJ9CM+cr0x7+G6
	L9EM7XEJhVOYDQWz0DIaIvizGIXH+ZyGTtuym8iuCfkaf3avkOTns9S0BGPixCO/3ceGoGCTgMtFW
	3bjRtltpHlj31bByE99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ddR-001BgI-8j; Fri, 08 Jul 2022 02:22:25 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ddN-001Bb3-Qa
	for ath10k@lists.infradead.org; Fri, 08 Jul 2022 02:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657246941; x=1688782941;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2eP84jAn5lhoXrSpm2e2RdVXKxwqVi6bijFF2Y+UKms=;
  b=KSv5VxqJapIKfrP17e/3aYPbzgbDXn/ki/B02y1o13l+wAhImd2KYbEw
   tZbEsQpG2W0t/52hKFjarGEHeWpC7lj3rqy3TiF94qSYt+zs3ARSiU4Kp
   RoINpbKc8aMfKhQ+G/Zi3+0VTV4VbmswgINPCBMRo0mYgGsLIjAOi3kPz
   UZQFtiHLfqXZQKDeos2JfsRpP0j9O2MNWrN8v3EB9Y5iKgjECDnwucLV2
   cW3uGno0rZP0o+EcWWubenm45HmzLQPimwlG5i4yC1V8PDwQ39aAlu964
   sezEhWR6eKihKyNwhXVptGEM7vAmBhXIgJMuLnfm0vUYbaZZAf9nQMRjN
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284911107"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="284911107"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 19:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="920828459"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jul 2022 19:22:19 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9ddK-000Mlo-G0;
	Fri, 08 Jul 2022 02:22:18 +0000
Date: Fri, 08 Jul 2022 10:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 6813eb18dee376635d6183b43d3d5177841ba914
Message-ID: <62c794ca.5KHZXg1gczBDY4H/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_192221_958767_ED243860 
X-CRM114-Status: UNSURE (   5.63  )
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
branch HEAD: 6813eb18dee376635d6183b43d3d5177841ba914  ath12k: Fix 'cast to pointer from integer' compiler warnings

elapsed time: 722m

configs tested: 51
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
riscv                randconfig-r042-20220707
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
