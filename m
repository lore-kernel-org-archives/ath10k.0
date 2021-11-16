Return-Path: <SRS0=J+4X=QD=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F696C433F5
	for <ath10k@archiver.kernel.org>; Tue, 16 Nov 2021 09:39:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1194F600EF
	for <ath10k@archiver.kernel.org>; Tue, 16 Nov 2021 09:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1194F600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rfTm8CFAije3+QY/hdM8TanGkreiPz2HQa82sGr93xs=; b=jR0E6xpFqFkw5p
	C44MfdiGEg014zl3/r7r2Q1w2Uuzgc7Zq2fgPQtUn0TSqovEsl0tm162YM/Wp3uhqK+tgieYmnpgM
	33yvXITeWWM6q3Fda4n26emmv/sB5scphEE/HKNgSOlj9vzHqUP1qNV2tuoIrWZcHRS3H8sJT3DzW
	jI1aUDLDjaWdnaL7WOwU68IkjvqJLvKT2RGL3ANIhqG8iGarZwBO10zZJzKTBLE7Zu/RRyu5KhtwF
	sKwnhRODmQrZtc01jhW94PdDr+8XFMQD7HulAzmFINCiHckmJz/EJpiz8OXhSjfjCNfLNYN9IuQS2
	bEthyD4t4CBeiMgcav4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmuv3-000yto-53; Tue, 16 Nov 2021 09:38:25 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmuut-000yrD-Ks
 for ath10k@lists.infradead.org; Tue, 16 Nov 2021 09:38:17 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233493120"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="233493120"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 01:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="604234198"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2021 01:38:08 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mmuul-0000Hn-Px; Tue, 16 Nov 2021 09:38:07 +0000
Date: Tue, 16 Nov 2021 17:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 f9cf725b0b431e65ddec81bb46bd737a55c55e0d
Message-ID: <61937bd0.ttKEgiU+6PTr2PV/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_013815_804326_5D185391 
X-CRM114-Status: UNSURE (   5.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: f9cf725b0b431e65ddec81bb46bd737a55c55e0d  ath11k: reset RSN/WPA present state for open BSS

elapsed time: 1167m

configs tested: 144
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                             alldefconfig
powerpc                 linkstation_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                        cell_defconfig
m68k                        m5307c3_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
xtensa                generic_kc705_defconfig
arc                        vdk_hs38_defconfig
powerpc64                           defconfig
arm                        mvebu_v5_defconfig
arm                         mv78xx0_defconfig
sh                           se7619_defconfig
sh                             shx3_defconfig
powerpc                     ppa8548_defconfig
arm                         cm_x300_defconfig
arm                       cns3420vb_defconfig
sparc                       sparc64_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                    klondike_defconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
powerpc                      cm5200_defconfig
powerpc                   microwatt_defconfig
mips                       bmips_be_defconfig
um                               alldefconfig
powerpc                 mpc834x_itx_defconfig
arm                     am200epdkit_defconfig
h8300                               defconfig
mips                            e55_defconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
powerpc                     pseries_defconfig
mips                      maltaaprp_defconfig
sh                         apsh4a3a_defconfig
arm                  randconfig-c002-20211115
arm                  randconfig-c002-20211116
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
arc                                 defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20211115
i386                 randconfig-a003-20211115
i386                 randconfig-a005-20211115
i386                 randconfig-a001-20211115
i386                 randconfig-a004-20211115
i386                 randconfig-a002-20211115
x86_64               randconfig-a015-20211116
x86_64               randconfig-a013-20211116
x86_64               randconfig-a012-20211116
x86_64               randconfig-a011-20211116
x86_64               randconfig-a016-20211116
x86_64               randconfig-a014-20211116
x86_64               randconfig-a005-20211115
x86_64               randconfig-a003-20211115
x86_64               randconfig-a002-20211115
x86_64               randconfig-a001-20211115
x86_64               randconfig-a006-20211115
x86_64               randconfig-a004-20211115
i386                 randconfig-a014-20211116
i386                 randconfig-a016-20211116
i386                 randconfig-a012-20211116
i386                 randconfig-a013-20211116
i386                 randconfig-a011-20211116
i386                 randconfig-a015-20211116
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                 randconfig-a006-20211116
i386                 randconfig-a003-20211116
i386                 randconfig-a005-20211116
i386                 randconfig-a001-20211116
i386                 randconfig-a004-20211116
i386                 randconfig-a002-20211116
x86_64               randconfig-a015-20211115
x86_64               randconfig-a013-20211115
x86_64               randconfig-a012-20211115
x86_64               randconfig-a014-20211115
x86_64               randconfig-a011-20211115
x86_64               randconfig-a016-20211115
x86_64               randconfig-a005-20211116
x86_64               randconfig-a003-20211116
x86_64               randconfig-a001-20211116
x86_64               randconfig-a002-20211116
x86_64               randconfig-a006-20211116
x86_64               randconfig-a004-20211116
i386                 randconfig-a014-20211115
i386                 randconfig-a016-20211115
i386                 randconfig-a012-20211115
i386                 randconfig-a013-20211115
i386                 randconfig-a011-20211115
i386                 randconfig-a015-20211115
hexagon              randconfig-r045-20211115
s390                 randconfig-r044-20211115
hexagon              randconfig-r041-20211115
riscv                randconfig-r042-20211115
hexagon              randconfig-r045-20211116
hexagon              randconfig-r041-20211116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
