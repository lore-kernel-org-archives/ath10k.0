Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6435CC4332F
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/sLgkUrw0hfsbK/LKgVgnbIeB7ecxvKb2asJOvK9TMo=; b=n6tyYC99fB3S3l
	eXcoSidQnpadNJh/H89vLluR5oUcd7rRujZiySQ7oWiexR2mjr9GYvLHEmL8UQ555mCHGNBwX27yx
	dgNYUNUhsD5BQurnzHmVOwKhj2eAu0JBY7HVFGhVt8Sk9k8JOcdrpAQGDEnH5SCZf5eTA7NtvjN3S
	I4HtmE7ovERLbX2NP9soeI0zFxfqod/ndgjopSYTrCNrvI2Nu14/BfUoOKHNHS0fZPd50Qbca8eV3
	bE/iSbyioghs99MrIYiNlghcPP1vLni2Om5YFs6NMomfMqJnrNaBHLIfFzFr6N6oDxFtDGxN9VgVm
	WCPYPPM1FcaEthiXr3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3Lr-00Cljr-90; Thu, 13 Oct 2022 18:54:39 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3Lo-00CljM-OZ
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 18:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665687276; x=1697223276;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qw/OYlpr45HblHQiOx9kuJMYhtnhxS9AwsM2lUHPcMM=;
  b=UhA76lW1zH8UsveMSy9aRPk1j9OLYBU73FqaBEqLT1WsH9tA8CSMrsUr
   xF1HhyXDOYoDgI4WoRs1TfheQI0TQSt1m9zLH1fQ/cPbQNIStpmDAlfdj
   Dde8/HQF2nbB68LypBDi/BgsbWtzaj3alzku32yW620NqE5cTtlaw/0oj
   3z/wUiE3IpRdSnXMZFDkTE1UYAEesbQmZN4+JnmzoKwn+giZEHp88rX0K
   6pVL/I8Jv38s+rXtMIwuv1pdvCulocaIfjeyEeOYldjLR5k2bzZgxDLPg
   H9Szh4x632sdG25p9U8gWVWldnRU3s4XEVukFkonSMpf4M9NPFS38908c
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="369361148"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="369361148"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 11:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="622278791"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="622278791"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Oct 2022 11:54:21 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oj3LU-0005TO-0G;
	Thu, 13 Oct 2022 18:54:16 +0000
Date: Fri, 14 Oct 2022 02:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 473118917cc33b98510880458c724bd833653db6
Message-ID: <63485ed5.W9aukcHGGpG3ptkJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_115436_893710_9163745D 
X-CRM114-Status: UNSURE (   4.26  )
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
branch HEAD: 473118917cc33b98510880458c724bd833653db6  wifi: ath10k: Check return value of ath10k_get_arvif() in ath10k_wmi_event_tdls_peer()

elapsed time: 724m

configs tested: 111
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
s390                                defconfig
s390                             allmodconfig
i386                                defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221013
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                           rhel-8.3-syz
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
i386                          randconfig-a001
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a003
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
i386                          randconfig-a014
x86_64                        randconfig-a004
mips                             allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a002
i386                          randconfig-a012
powerpc                          allmodconfig
i386                          randconfig-a016
i386                             allyesconfig
x86_64                        randconfig-a006
riscv                randconfig-r042-20221012
arm                              allyesconfig
arc                  randconfig-r043-20221012
arm64                            allyesconfig
s390                 randconfig-r044-20221012
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
loongarch                 loongson3_defconfig
i386                          randconfig-c001
sh                ecovec24-romimage_defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
arc                     nsimosci_hs_defconfig
arm                         nhk8815_defconfig
nios2                               defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig
powerpc                      ppc40x_defconfig
sh                            shmin_defconfig
sh                        apsh4ad0a_defconfig
powerpc                       maple_defconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
mips                 decstation_r4k_defconfig
xtensa                    xip_kc705_defconfig
powerpc                  iss476-smp_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221013
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221013
riscv                randconfig-r042-20221013
s390                 randconfig-r044-20221013
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a004
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a015
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
x86_64                        randconfig-a005
powerpc                     tqm5200_defconfig
arm                           omap1_defconfig
x86_64                        randconfig-k001
arm                        mvebu_v5_defconfig
powerpc                     tqm8540_defconfig
powerpc                     akebono_defconfig
mips                          malta_defconfig
powerpc                    ge_imp3a_defconfig
arm                       aspeed_g4_defconfig
powerpc                      ppc44x_defconfig
mips                        qi_lb60_defconfig
mips                     cu1000-neo_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
