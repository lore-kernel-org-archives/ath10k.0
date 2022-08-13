Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D16FC28B2C
	for <ath10k@archiver.kernel.org>; Sat, 13 Aug 2022 04:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dAbZpc7WkAaIrsRpGmF0Y4eECHUMaqYZ3zVk3k7i29g=; b=c0JavL+NstJtnr
	CymsrSbbh1hxOBwhLwc7ZcrBT8tm+20rIa4hoqELG6FI+PaRnxwxC9IvZYM/TXtjO0WKvhZjKWBg9
	3q+m+066nvo0ISurqzgQi4FCHT6c32FHydeOW22oBW8qzNLtKkUTOnAjPuMwwG2TfqHYNy921PREw
	KDhibM9VTOTK90TWobyS9wBVXhWsR6sd/fRYjqbaJl99LdL6rHTpUFTQPkWDET6z1WRj7dW8hL9qH
	nzmeGXUNOlrTzduR0MVX8smljqbq/t1Ccj1yFQ9p0UtzqVvNlUST/OzQvGdyVbRUJ/ywh5PfGwz0p
	XcRPJLQWMCFaKHEw+skA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMieD-004XnE-Ai; Sat, 13 Aug 2022 04:21:17 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMie9-004Xcv-DW
	for ath10k@lists.infradead.org; Sat, 13 Aug 2022 04:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660364473; x=1691900473;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6vQNZ6sCLNO32KMHQaBQRvUSg7Vh37ha00caxobaNFA=;
  b=NzgLbZNwDlutlzsbZ8YGOO2yiDQ8zWcIfOhWAnwkCK/XAZtPiP4PzFMo
   ehu0Dqx7Gee+XsL06PY9AngjN33qVbFX9HVkqYz5DpoIWa5/8qAC5MNS/
   BetQHQmp/TO3om/I3h4HfVx7/vq/SLW5tyJCIFRA22FcPNmjkPIgGVg64
   fXq6FogpSticyjnKy/wcklSEVwyKr72+N9pbM5veYa8OiIV8cdqimqul0
   wr2mynsbAs4N2Z465p4eCtF4wtFSWKAjgtxXD4OcMZiOw15pCwj+DW7aX
   uiSTlbkW1Jl3cjlEK7zwlOwmpBlU74VVY/HER1Rel9+l+BNihOsb/eUaP
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="292995826"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="292995826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 21:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="582310972"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Aug 2022 21:21:08 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMie3-0001IU-1k;
	Sat, 13 Aug 2022 04:21:07 +0000
Date: Sat, 13 Aug 2022 12:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 313fb8aacbba1eae831065d7cb5c68cb97fcace6
Message-ID: <62f7268b.GNeFJwtDGkV8sVQ5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_212113_527828_6D3DEE50 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: 313fb8aacbba1eae831065d7cb5c68cb97fcace6  wifi: ath12k: rx_desc: cleanup documentation

elapsed time: 718m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arc                  randconfig-r043-20220812
s390                 randconfig-r044-20220812
riscv                randconfig-r042-20220812
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                          randconfig-a014
i386                             allyesconfig
i386                          randconfig-a012
x86_64                        randconfig-a004
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
x86_64                          rhel-8.3-func
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
i386                          randconfig-a003
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                          randconfig-a005
arm                                 defconfig
x86_64                              defconfig
ia64                             allmodconfig
arm                              allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm64                            allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                          atari_defconfig
sh                           se7780_defconfig
openrisc                       virt_defconfig
m68k                           virt_defconfig
mips                  maltasmvp_eva_defconfig
i386                          randconfig-c001
sh                          rsk7264_defconfig
arm                        spear6xx_defconfig
sh                            migor_defconfig
arc                           tb10x_defconfig
sparc                       sparc32_defconfig
xtensa                  cadence_csp_defconfig
sh                        edosk7705_defconfig
arm                             pxa_defconfig
powerpc                       ppc64_defconfig
arc                        nsimosci_defconfig
powerpc                         ps3_defconfig
mips                         bigsur_defconfig
sh                   secureedge5410_defconfig
m68k                       m5475evb_defconfig
csky                             alldefconfig
arc                         haps_hs_defconfig
mips                           xway_defconfig
openrisc                  or1klitex_defconfig
m68k                       m5275evb_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
arm                             ezx_defconfig
arm                           sama5_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220812
hexagon              randconfig-r041-20220812
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
