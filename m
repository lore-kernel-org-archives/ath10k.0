Return-Path: <SRS0=/di5=KU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAB0C47084
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 00:54:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6591B6142D
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 00:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6591B6142D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p4lUD/uxIqnJKUzOcZdJiQf/jzXH6ZnRFE8m9MRcPuI=; b=kMBHEZjpXeAxNc
	3bo+pUjiXK24a0pw/i8oU5/VIAuDb57t9CjbcmkCGlZxtsg9EMfSAz/hqmJ1DounyewrqLEF4G6Ad
	F0idjCOqjr8G6nkAS9qwOJKrCRok5fQkRW6dQY/47w5xBTikz6faTfeU/whfKGy4dHD4z9RRLMATa
	GqFVT5pq/P5Qw7p82C6gNADETWGe60RK+rCKy10tN6GzXRDjUqP9kcmKnKY74tT5fBsdG4sXsBzy4
	iGmRhd3hj0mY0oUH1mtaCuexn4u9GI7H0J9uDGZMyqX0kqG+i9SBzYMPX/QHcx+vMHqn42XFM3phP
	hL9Z2zB64MhbmmR7Sxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llLKc-002eXR-7k; Tue, 25 May 2021 00:54:02 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llFke-001Z7K-6u
 for ath10k@lists.infradead.org; Mon, 24 May 2021 18:56:37 +0000
IronPort-SDR: XchATN1Cg16GPqVQSZErU0rDPNjEdmY0SJ+sOzt4WvIuoV/L4lIYsorgBMgx3v948ecJB61Pge
 hjSeK2Nlv2vw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="189387747"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="189387747"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:56:30 -0700
IronPort-SDR: 7n08QeHBuSkUgENgKhtKRNKBsCwChual75HMVWJdC1wMWob5tN/D93VCUJ6RXhF4Ey7Nc7qiAJ
 swqFVcJ+8XAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="476023099"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 24 May 2021 11:56:28 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1llFka-0001KA-1Z; Mon, 24 May 2021 18:56:28 +0000
Date: Tue, 25 May 2021 02:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master] BUILD SUCCESS 55d15742caa8b632f2273c5165e2faed635cfe93
Message-ID: <60abf6a3.AoEK3e8TKQdZ82OM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_115632_392563_980E0ED6 
X-CRM114-Status: UNSURE (   6.56  )
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
branch HEAD: 55d15742caa8b632f2273c5165e2faed635cfe93  Add localversion-wireless-testing-ath

elapsed time: 729m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      mgcoge_defconfig
arm                          imote2_defconfig
arm                          pxa3xx_defconfig
x86_64                              defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
powerpc                      pcm030_defconfig
mips                           ip27_defconfig
mips                           mtx1_defconfig
arm                             mxs_defconfig
mips                        bcm47xx_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
arm                          ep93xx_defconfig
powerpc                     stx_gp3_defconfig
sh                        sh7757lcr_defconfig
arm                         axm55xx_defconfig
arm                          pcm027_defconfig
powerpc                   currituck_defconfig
xtensa                              defconfig
sh                           se7724_defconfig
sparc                            allyesconfig
mips                     cu1000-neo_defconfig
sh                         microdev_defconfig
arm                       spear13xx_defconfig
riscv                          rv32_defconfig
powerpc                       maple_defconfig
arm                            qcom_defconfig
sh                   sh7724_generic_defconfig
arm                      integrator_defconfig
arm                        oxnas_v6_defconfig
riscv                    nommu_k210_defconfig
sh                           se7722_defconfig
mips                      pic32mzda_defconfig
arm                          badge4_defconfig
s390                                defconfig
nds32                               defconfig
arm                           h3600_defconfig
mips                        omega2p_defconfig
sh                        sh7785lcr_defconfig
parisc                generic-32bit_defconfig
powerpc                       eiger_defconfig
parisc                           allyesconfig
sh                          rsk7201_defconfig
powerpc                     powernv_defconfig
powerpc                 linkstation_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
m68k                         amcore_defconfig
mips                        workpad_defconfig
mips                     loongson2k_defconfig
mips                           jazz_defconfig
riscv                            alldefconfig
powerpc                     akebono_defconfig
parisc                           alldefconfig
arm                            lart_defconfig
openrisc                  or1klitex_defconfig
m68k                       m5249evb_defconfig
arm                         lpc18xx_defconfig
powerpc                     tqm5200_defconfig
arm                       cns3420vb_defconfig
sparc                            alldefconfig
powerpc                     pseries_defconfig
arm                         palmz72_defconfig
mips                           gcw0_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
sh                          r7780mp_defconfig
m68k                            mac_defconfig
m68k                            q40_defconfig
sh                          r7785rp_defconfig
powerpc                      ppc64e_defconfig
um                            kunit_defconfig
i386                             allyesconfig
nds32                            alldefconfig
powerpc                        fsp2_defconfig
arm                       netwinder_defconfig
mips                         tb0226_defconfig
powerpc                        cell_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210524
x86_64               randconfig-a001-20210524
x86_64               randconfig-a006-20210524
x86_64               randconfig-a003-20210524
x86_64               randconfig-a004-20210524
x86_64               randconfig-a002-20210524
i386                 randconfig-a001-20210524
i386                 randconfig-a002-20210524
i386                 randconfig-a005-20210524
i386                 randconfig-a006-20210524
i386                 randconfig-a004-20210524
i386                 randconfig-a003-20210524
i386                 randconfig-a011-20210524
i386                 randconfig-a016-20210524
i386                 randconfig-a015-20210524
i386                 randconfig-a012-20210524
i386                 randconfig-a014-20210524
i386                 randconfig-a013-20210524
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210524
x86_64               randconfig-a013-20210524
x86_64               randconfig-a012-20210524
x86_64               randconfig-a014-20210524
x86_64               randconfig-a016-20210524
x86_64               randconfig-a015-20210524
x86_64               randconfig-a011-20210524

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
