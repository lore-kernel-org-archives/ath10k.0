Return-Path: <SRS0=I20e=HP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB36CC433DB
	for <ath10k@archiver.kernel.org>; Sat, 13 Feb 2021 23:11:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885ED64E3B
	for <ath10k@archiver.kernel.org>; Sat, 13 Feb 2021 23:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 885ED64E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I1paxvx2Hx+Sxdw/UQhP81izcRhJTjHtwi7XI6aNFU0=; b=N7J390MrLBkQFXJ6w7ytzN1DbZ
	owN+kfJdRzSRe5burDkeVqggwVDePulgkCgDYRXid22yLfnrb5037fq6svMeAdag7m+XDVsYYGgdp
	Aa3JYBEPiRnCt2s4accqfHNRWuyd07oj5hTDgt6XFd7R+tT1iNwWfiOOaYiAPz4zh2HdTzi0sYlDv
	RPVqwnlnXeYbzkOeph6WeEckDPncZIam/MxJcRiHqrR94N3CE+jq1OHEuNE2UxtdtLbvRMwrtxIOv
	U2lBm4yTFpPMndKIMbRqtc7qe1WTTC0sRunWGTFsI26N8mt1u5Di0j498IS584GLPDsXt7J4k2yhm
	av7VEbAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lB43n-00067S-Gq; Sat, 13 Feb 2021 23:10:43 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lB43j-000674-FL
 for ath10k@lists.infradead.org; Sat, 13 Feb 2021 23:10:41 +0000
IronPort-SDR: pfm0J9gtuJBCQqXmtfcEjiXa2UzROTxJiC9ebm3lChOURUCiGLMRHjPeOLKXap3FMIZsFRO4BE
 cufesSPvRdqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9894"; a="170215530"
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; d="scan'208";a="170215530"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2021 15:10:32 -0800
IronPort-SDR: FF7D6IYqzq3EOB8T/OYl6jkHVnJntpTsXsY6OqZz6qq3zb5fUxjuk6ptlAinxDHC/iDSlTtNoV
 HhedZkVwPgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; d="scan'208";a="491966415"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2021 15:10:30 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lB43Z-00066P-TZ; Sat, 13 Feb 2021 23:10:29 +0000
Date: Sun, 14 Feb 2021 07:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 dd2452b1ba9c5a25f718d835ca2dfb2610fce183
Message-ID: <60285c42.ASpfeZIg8vltYoKX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_181039_718161_48A3D3DC 
X-CRM114-Status: UNSURE (   6.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: dd2452b1ba9c5a25f718d835ca2dfb2610fce183  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     mpc5200_defconfig
mips                         tb0287_defconfig
arm                       mainstone_defconfig
m68k                       m5208evb_defconfig
mips                      malta_kvm_defconfig
powerpc                        warp_defconfig
arm                             mxs_defconfig
sh                               allmodconfig
mips                           xway_defconfig
parisc                generic-32bit_defconfig
arm                            dove_defconfig
sh                        sh7757lcr_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
mips                           ci20_defconfig
xtensa                           allyesconfig
arm                       cns3420vb_defconfig
arm                      pxa255-idp_defconfig
arm                          exynos_defconfig
powerpc                 canyonlands_defconfig
arm                         cm_x300_defconfig
xtensa                         virt_defconfig
mips                         tb0219_defconfig
c6x                        evmc6678_defconfig
powerpc                      walnut_defconfig
arc                        nsim_700_defconfig
powerpc                   bluestone_defconfig
openrisc                  or1klitex_defconfig
arm                           h5000_defconfig
powerpc                         ps3_defconfig
arm                       imx_v4_v5_defconfig
m68k                          atari_defconfig
riscv                          rv32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210213
i386                 randconfig-a005-20210213
i386                 randconfig-a002-20210213
i386                 randconfig-a001-20210213
i386                 randconfig-a004-20210213
i386                 randconfig-a006-20210213
x86_64               randconfig-a013-20210213
x86_64               randconfig-a016-20210213
x86_64               randconfig-a012-20210213
x86_64               randconfig-a015-20210213
x86_64               randconfig-a014-20210213
x86_64               randconfig-a011-20210213
x86_64               randconfig-a003-20210210
x86_64               randconfig-a002-20210210
x86_64               randconfig-a001-20210210
x86_64               randconfig-a004-20210210
x86_64               randconfig-a005-20210210
x86_64               randconfig-a006-20210210
i386                 randconfig-a016-20210213
i386                 randconfig-a014-20210213
i386                 randconfig-a012-20210213
i386                 randconfig-a013-20210213
i386                 randconfig-a011-20210213
i386                 randconfig-a015-20210213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
