Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5045ECAAA1
	for <ath10k@archiver.kernel.org>; Sat, 17 Sep 2022 00:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NH5U3WmOVyFZngPfGHK5Zm0hJCCko56TpUvndkXiQds=; b=V2UjyeSH/x4YZM
	UCT6zbm64LwMw/N7e0HN5rV3AcdFAeHiQuFoFcqBr/GzShEy5XCK4vKPxWeyhpflNkLfVPTa1nblN
	PJzN7WiBAeE+Veu323EzVW17DaWHhkQSTmvBEAyKky9YY9RVT5vPYYNcLBoJWa3NtkLIVXzgvvVmf
	GMYexOPHGNrzto3Znu7S193G7HFOUx4ql3vY1dIB5/bLqjyEMstCHKOpOZIdd+g1Z33PM4NAonUPj
	oBZK+U8vkGMiT3PnDWCZwctpsnxAV6F9jsAJ4sSUrxBlxsB9qZMD0tqZ/cMtYgEgFvIE6I1XBOI+O
	BrurSQmLdyu+rdR/PSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZM1r-00146I-PM; Sat, 17 Sep 2022 00:49:55 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZM1o-001443-Fg
	for ath10k@lists.infradead.org; Sat, 17 Sep 2022 00:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663375792; x=1694911792;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TeEqa7oO6Fcyidjq8eqvc4ruhYwwFJaIxps8F68EUK0=;
  b=EWA7XLkT3m7ZoNkSPBqUuTTygoPgh3x3NUGMedzw0Ph16c/fHbjHOB8M
   clZdnux7iKwCKQOX0zAuZkCq2btcZTgtpoT1xAt/LtaRVaigqgOKEt1v/
   n0AP3jvWB/RVyaEJls+woMUgVIYA5D9g4x/9JA7o5K+qrb47p82kWxjan
   BkoOOs6Aozncm9fSJ7+yOdvkx8blo2St+zaexsAtQ8/sFtqCU7FIOE1dX
   79bBpVGqNPvd/lDPUo5igNKsu22+t1MllrxRwIJKVnB9kGSESzd1NGISP
   Spkqenc8lD8sEMbpWys5YAWAyo9nQpI5soE/oclLch6E7aO3DODJkQFTY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="299098260"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="299098260"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 17:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="595441068"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Sep 2022 17:49:49 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZM1k-0002JC-1H;
	Sat, 17 Sep 2022 00:49:48 +0000
Date: Sat, 17 Sep 2022 08:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 e094a9ab1340fe7772bf512c855015fefa70ca0a
Message-ID: <6325198e.3wRsiu6/1jW77QsY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_174952_594543_6AA543F7 
X-CRM114-Status: UNSURE (   4.89  )
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
branch HEAD: e094a9ab1340fe7772bf512c855015fefa70ca0a  wifi: ath12k: dp: convert ath12k_dp_htt_tlv_iter() to a static function

elapsed time: 863m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220916
powerpc                           allnoconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
i386                          randconfig-a001
i386                             allyesconfig
s390                             allyesconfig
arc                              allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a003
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a014
alpha                            allyesconfig
i386                          randconfig-a005
i386                          randconfig-a012
x86_64                           allyesconfig
i386                          randconfig-a016
m68k                             allyesconfig
x86_64                        randconfig-a013
m68k                             allmodconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220916
riscv                randconfig-r042-20220916
s390                 randconfig-r044-20220916
hexagon              randconfig-r045-20220916
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
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
