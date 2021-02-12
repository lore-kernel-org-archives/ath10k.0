Return-Path: <SRS0=7R0v=HO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DD3C433E6
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 20:48:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27CB064DE7
	for <ath10k@archiver.kernel.org>; Fri, 12 Feb 2021 20:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27CB064DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OonJh4R1Skz/kRGK+bEsUQvL2MQ62kp+S0AonPyJs8U=; b=NUFNdeIgL+MYRTRVwXIN5qhxkj
	IAte1UpA4scaWtHxh5HU4Px+zpfL+QB9ej+ZZderw3JMQpw5W7PGa90yygRMtzECwc6ogqY9h2Kwg
	aEQjN4PrZqX1HqhTLD4+Rie71jKGR7q516/pZFXrR9wFf4EzNUrisjNuz91M/8xfLAMQN8WEM1AT9
	YS0SklKNgFDdfgU88L0a/7xOsEeph+svs9g8Sypl3uDFRJdnN1o3gTPlu38rMfFxu5Gz3BO8WILXY
	DdPu+tdxYVrNGj3daXNLpSPyRG8t+28fXhQL7qbOhDzfK4zYKFvlZOvyhEVjXg7+x3AJ3GsxDJwmU
	wqZZCrXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAfLD-0000HK-5d; Fri, 12 Feb 2021 20:47:03 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAfL6-0000Dm-L9
 for ath10k@lists.infradead.org; Fri, 12 Feb 2021 20:46:58 +0000
IronPort-SDR: LAyVvhdL32vKhN66NKds7S4NStqNxPFU5JWQCBELEqy8WgWvfuLu5usWQ4BErtEqIlRG9lJGCT
 /NqEZTEom+ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="243961602"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="243961602"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 12:46:51 -0800
IronPort-SDR: BGecL4/nTPLdoRncV8Nnqwk2ZefgPfNIvn31CnGLVzj/e4tWeqWDTuMjutu/mC7+Cx2332e7Za
 SkKw63Auiaqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="376484341"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 12 Feb 2021 12:46:49 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lAfKz-0004rp-2l; Fri, 12 Feb 2021 20:46:49 +0000
Date: Sat, 13 Feb 2021 04:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 3e4bc71dd0aac9ce23af6f902f945d58321fdf8e
Message-ID: <6026e920.7SB/ujiqBtbQE3/8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_154656_890294_CCD71EDE 
X-CRM114-Status: UNSURE (   7.40  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 3e4bc71dd0aac9ce23af6f902f945d58321fdf8e  Merge branch 'ath-next' into ath-qca

elapsed time: 724m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
alpha                            alldefconfig
arc                     haps_hs_smp_defconfig
sh                               j2_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                            q40_defconfig
sparc64                             defconfig
powerpc                      ppc6xx_defconfig
mips                 decstation_r4k_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
m68k                          atari_defconfig
mips                      bmips_stb_defconfig
powerpc                     stx_gp3_defconfig
arm                           sunxi_defconfig
arm                        clps711x_defconfig
arm                         lpc18xx_defconfig
arm                          ep93xx_defconfig
arm                           h5000_defconfig
xtensa                  cadence_csp_defconfig
openrisc                            defconfig
arm                       netwinder_defconfig
arm                      tct_hammer_defconfig
arm                       aspeed_g5_defconfig
arm                         vf610m4_defconfig
arm                          lpd270_defconfig
powerpc                      chrp32_defconfig
um                           x86_64_defconfig
powerpc                      obs600_defconfig
arm64                            alldefconfig
arm                           corgi_defconfig
um                             i386_defconfig
arm                             rpc_defconfig
powerpc                    amigaone_defconfig
mips                        omega2p_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         shannon_defconfig
arc                        vdk_hs38_defconfig
sparc                       sparc32_defconfig
mips                            e55_defconfig
powerpc                      pcm030_defconfig
powerpc                 linkstation_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
powerpc                     tqm8548_defconfig
microblaze                          defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a003-20210212
i386                 randconfig-a005-20210212
i386                 randconfig-a002-20210212
i386                 randconfig-a001-20210212
i386                 randconfig-a004-20210212
i386                 randconfig-a006-20210212
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
