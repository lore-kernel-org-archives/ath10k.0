Return-Path: <SRS0=7cM+=LP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E7DC48BE5
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 07:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F18E61026
	for <ath10k@archiver.kernel.org>; Mon, 21 Jun 2021 07:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F18E61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bRgFbegAPPhH+wk2wY8YYAbH630A9G8WzsjdEqOaElw=; b=VUQvMhlredvp1N
	y/t1xrXVLnNkx3yGRvPTfgDHX5DWjjQ0TvkiwkyzwkLH/eC+MSHbWed7OK8p3GSB9+e2xvI7j+Gl9
	HIkQQY7fQYHM1yKc2JLrqKUiBsUl4tAK9XmPsMUTWcbrH64NFu4gLXU3ruMvFngcV6fJEFqLldT4h
	GD2cmR8tI+BVWX38lpbjerDnivyP4yzQGdcHyBpuEopemHoyk6NHfRqX/HtlMO8KEcceP+EE9cEDL
	e8/U1mgolg1yywGGy+ZZrIFJKnMnn22sSkXSgcjr0gsk6UdJGPif5g6RsxC+8ZcY9zSQ3N6/W6s7V
	cdHMTDZp5H0of3TaXM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvEHb-002TTU-Vw; Mon, 21 Jun 2021 07:23:48 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvEHY-002TS6-Ba
 for ath10k@lists.infradead.org; Mon, 21 Jun 2021 07:23:46 +0000
IronPort-SDR: bxiKo5ebtF+B2o5z+4D9IAtMhPOgz8hdw2wTtzCDMA+yrsPed0wLRRnMQs5mygbQHZBH+sRnYh
 Yv+1H+4379PQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="228336130"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="228336130"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 00:23:43 -0700
IronPort-SDR: G4EcHdO5wHlNT7TUER/ZtpkbXI6EhEVBmN/8U+nlMiN2g8Po6g8/IFBiBKDYIh+4fwLscHA/Gr
 KteIfbulplwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="453791834"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2021 00:23:42 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lvEHV-0004Un-O3; Mon, 21 Jun 2021 07:23:41 +0000
Date: Mon, 21 Jun 2021 15:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master-pending] BUILD SUCCESS
 d98d733bee7273b03631aed26f9630124db05008
Message-ID: <60d03e7c.K72s0KBrI8dOjXch%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_002344_484522_1DF5E039 
X-CRM114-Status: UNSURE (   5.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: d98d733bee7273b03631aed26f9630124db05008  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      pic32mzda_defconfig
mips                           mtx1_defconfig
mips                           jazz_defconfig
arm                        cerfcube_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc836x_mds_defconfig
arm                             mxs_defconfig
arm                         lubbock_defconfig
powerpc                   currituck_defconfig
mips                      pistachio_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     mpc5200_defconfig
h8300                            allyesconfig
sh                           se7724_defconfig
m68k                         amcore_defconfig
m68k                        mvme147_defconfig
xtensa                         virt_defconfig
mips                      fuloong2e_defconfig
powerpc                     asp8347_defconfig
mips                    maltaup_xpa_defconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
sh                             sh03_defconfig
powerpc                      ppc64e_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                         bigsur_defconfig
sh                     sh7710voipgw_defconfig
sh                             espt_defconfig
powerpc                        fsp2_defconfig
arc                            hsdk_defconfig
powerpc                     kilauea_defconfig
csky                                defconfig
arm                     eseries_pxa_defconfig
arm                      tct_hammer_defconfig
sparc64                             defconfig
arm                        multi_v5_defconfig
riscv                               defconfig
sh                          rsk7203_defconfig
arm                       aspeed_g5_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        mvebu_v7_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                       m5475evb_defconfig
sh                          r7780mp_defconfig
powerpc                      arches_defconfig
arm                            dove_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210620
i386                 randconfig-a002-20210620
i386                 randconfig-a003-20210620
i386                 randconfig-a006-20210620
i386                 randconfig-a005-20210620
i386                 randconfig-a004-20210620
x86_64               randconfig-a012-20210620
x86_64               randconfig-a016-20210620
x86_64               randconfig-a015-20210620
x86_64               randconfig-a014-20210620
x86_64               randconfig-a013-20210620
x86_64               randconfig-a011-20210620
i386                 randconfig-a011-20210621
i386                 randconfig-a014-20210621
i386                 randconfig-a013-20210621
i386                 randconfig-a015-20210621
i386                 randconfig-a012-20210621
i386                 randconfig-a016-20210621
x86_64               randconfig-a002-20210621
x86_64               randconfig-a001-20210621
x86_64               randconfig-a005-20210621
x86_64               randconfig-a003-20210621
x86_64               randconfig-a004-20210621
x86_64               randconfig-a006-20210621
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-b001-20210621
x86_64               randconfig-a002-20210620
x86_64               randconfig-a001-20210620
x86_64               randconfig-a005-20210620
x86_64               randconfig-a003-20210620
x86_64               randconfig-a004-20210620
x86_64               randconfig-a006-20210620

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
