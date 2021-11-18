Return-Path: <SRS0=kJ3c=QF=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6DDC433EF
	for <ath10k@archiver.kernel.org>; Thu, 18 Nov 2021 09:53:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E286115B
	for <ath10k@archiver.kernel.org>; Thu, 18 Nov 2021 09:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6E286115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JMjuLxYuM2xHFM487kTawTZgjmzw/fD6GF1sBeGrMvg=; b=ABjJI4WvgtXDnq
	AZcodGEIXYxcz90Wwbr8NVuwjK5nfjZMdheWyvDeDVhcvXgNbxJWKvY7Da8540u/Wu4ZtUiib5Qfu
	722XhOAeUo4JHtwoAwPiFcqe4EL+pq+761GNyxvV3x1Sav/zp/uHeQ+UQuXUpAEqrdlwSBeaOPBXx
	TEKQHKAzNImG6w1HTeajOPjytjP38F63Yj+P3b9h3aVLcSR+UfH9Rg5TQMJw9grs5TQZq55EfgOMJ
	SGJUze+NONPD1P95UXrDtyoTuJPW0e6Txc3EqadrGrO1v/lFB01gqOLHWGEMGr2hnY0A/CjX0sjh8
	0ymOvW1UV5gUsCSWzt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mne6S-007NQP-Ih; Thu, 18 Nov 2021 09:53:12 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mne6Q-007NQ4-3N
 for ath10k@lists.infradead.org; Thu, 18 Nov 2021 09:53:11 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234099795"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="234099795"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 01:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="455255614"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2021 01:52:44 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mne5z-0002tu-Lu; Thu, 18 Nov 2021 09:52:43 +0000
Date: Thu, 18 Nov 2021 17:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 b6eea9fdd3b2afaa17a45c016c7f0067c426a856
Message-ID: <61962245.MYB3pRE1PjPowPn+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_015310_242318_9AC6E86F 
X-CRM114-Status: UNSURE (   4.54  )
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
branch HEAD: b6eea9fdd3b2afaa17a45c016c7f0067c426a856  Merge branch 'pending' into master-pending

elapsed time: 919m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                  colibri_pxa300_defconfig
arm                       omap2plus_defconfig
sh                         ap325rxa_defconfig
m68k                         amcore_defconfig
mips                            e55_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
xtensa                    xip_kc705_defconfig
xtensa                              defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     rainier_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
sh                     sh7710voipgw_defconfig
mips                          malta_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  audio_kc705_defconfig
csky                             alldefconfig
sh                   sh7724_generic_defconfig
mips                      fuloong2e_defconfig
ia64                          tiger_defconfig
arm                     eseries_pxa_defconfig
sh                             espt_defconfig
arc                           tb10x_defconfig
powerpc                     kilauea_defconfig
mips                  cavium_octeon_defconfig
mips                     cu1000-neo_defconfig
arm                       netwinder_defconfig
arm                  colibri_pxa270_defconfig
arm                  randconfig-c002-20211117
arm                  randconfig-c002-20211118
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                                defconfig
i386                              debian-10.3
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20211117
x86_64               randconfig-a002-20211117
x86_64               randconfig-a001-20211117
x86_64               randconfig-a004-20211117
x86_64               randconfig-a005-20211117
x86_64               randconfig-a006-20211117
i386                 randconfig-a003-20211117
i386                 randconfig-a001-20211117
i386                 randconfig-a002-20211117
i386                 randconfig-a004-20211117
i386                 randconfig-a006-20211117
i386                 randconfig-a005-20211117
x86_64               randconfig-a015-20211118
x86_64               randconfig-a012-20211118
x86_64               randconfig-a011-20211118
x86_64               randconfig-a013-20211118
x86_64               randconfig-a016-20211118
x86_64               randconfig-a014-20211118
i386                 randconfig-a016-20211118
i386                 randconfig-a014-20211118
i386                 randconfig-a012-20211118
i386                 randconfig-a011-20211118
i386                 randconfig-a013-20211118
i386                 randconfig-a015-20211118
arc                  randconfig-r043-20211118
riscv                randconfig-r042-20211118
s390                 randconfig-r044-20211118
arc                  randconfig-r043-20211117
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a015-20211117
x86_64               randconfig-a013-20211117
x86_64               randconfig-a011-20211117
x86_64               randconfig-a012-20211117
x86_64               randconfig-a016-20211117
x86_64               randconfig-a014-20211117
i386                 randconfig-a014-20211117
i386                 randconfig-a016-20211117
i386                 randconfig-a012-20211117
i386                 randconfig-a013-20211117
i386                 randconfig-a011-20211117
i386                 randconfig-a015-20211117
hexagon              randconfig-r045-20211117
hexagon              randconfig-r041-20211117
s390                 randconfig-r044-20211117
riscv                randconfig-r042-20211117
hexagon              randconfig-r045-20211118
hexagon              randconfig-r041-20211118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
