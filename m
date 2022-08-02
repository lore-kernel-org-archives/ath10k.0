Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3CFC00140
	for <ath10k@archiver.kernel.org>; Tue,  2 Aug 2022 19:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jc692a0++ZwLHi4W5C0u0OLodUqB1nId93ERsRgj6rg=; b=uLcDlNaryI8Oiw
	NaqGRYYJwWQQNtXbS6aPOWiLiFido87+BkYPnVyQb1Dp8BifE0wceAGvx92Y/ty9mEVic+Rf14IuR
	sLOJPmCdMCCgUpY7l2kenfi4PphpKqiA1k9UdEnOJK4nye/8DbgJquqY9oLSwYj5za5MoCvG3QkMb
	a/XiKmIdt3dHynJcwSms+KiANRn5NoL/kX8iHuqmyplTy69Y7XaHkkbF2Zx5K45mT6kQ2xCPbI0ac
	KM1vpPH3tLioRNspAmAqk/6Tz3bgZ5RybUCA/E22eUFiUTwyvIPrW2qQBZ1pZxdDoEq2kwynVMF0H
	2RpMEcvp+sf1w/TWlZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIxN2-00GocO-A4; Tue, 02 Aug 2022 19:16:00 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIxMz-00GoZF-Fz
	for ath10k@lists.infradead.org; Tue, 02 Aug 2022 19:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659467757; x=1691003757;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nWt6bXsPVTFpgVWIatn8vlkNYt+wy6r9oiUVBXSx0Hw=;
  b=JV+kB3oJRqq95In5UdnVhbdFZ/8/+gWcCnpxyJLCRp9AaZSrzrWg8/rj
   5tIPZT5475GrwAgwTuJKI8QfFlct+lkUv3IneXrhEDT3sVgAhmCr+Bzd+
   G3F7X0iahIJyrTg4le+/qUHP+JazntESG3cwIe4tovyCrQrY2LbepalEe
   JOVoS/SbO2UDfe3fFgX1yfdgE9umtLlgaRDUZY03rgqKvopfmWDRKeQJL
   M2X08HVmGj8sTeqtDxka6pYCEecOvQgKuJzcltlQS7DrSL3s1DT9SycSB
   gjrKRal4tjXjEO71qFfTMH+axdngP8Gh9cl0rwAuGYOap/PSkw4BVmSFX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="269269954"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="269269954"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 12:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="630840532"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 12:15:30 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIxMX-000GKh-1Y;
	Tue, 02 Aug 2022 19:15:29 +0000
Date: Wed, 03 Aug 2022 03:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 51e7d64763c1c3d2429cbe8bfafbc8f8e3090e64
Message-ID: <62e977ab.YvZitbJKjSjtPBPJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_121557_726108_18A98C2E 
X-CRM114-Status: UNSURE (   4.06  )
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
branch HEAD: 51e7d64763c1c3d2429cbe8bfafbc8f8e3090e64  Merge branch 'pending' into master-pending

elapsed time: 705m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
x86_64               randconfig-a013-20220801
arc                  randconfig-r043-20220801
x86_64               randconfig-a014-20220801
i386                             allyesconfig
s390                 randconfig-r044-20220801
x86_64               randconfig-a015-20220801
riscv                randconfig-r042-20220801
x86_64               randconfig-a016-20220801
x86_64                              defconfig
arm                                 defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
m68k                             allmodconfig
i386                 randconfig-a012-20220801
powerpc                           allnoconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a013-20220801
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
arm                              allyesconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
mips                             allyesconfig
i386                 randconfig-a011-20220801
i386                 randconfig-a015-20220801
sh                               allmodconfig
i386                 randconfig-a014-20220801
arm64                            allyesconfig
i386                 randconfig-a016-20220801
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                           alldefconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
sh                      rts7751r2d1_defconfig
powerpc                   motionpro_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
mips                           xway_defconfig
x86_64               randconfig-k001-20220801
i386                 randconfig-c001-20220801
powerpc                        warp_defconfig
powerpc                       ppc64_defconfig
ia64                             alldefconfig
arm                           tegra_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                        mini2440_defconfig
powerpc                    adder875_defconfig
powerpc                     mpc83xx_defconfig
arm                           imxrt_defconfig
arc                          axs101_defconfig
sparc                            alldefconfig
ia64                                defconfig
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                     taishan_defconfig
sh                        dreamcast_defconfig
arm                         cm_x300_defconfig
mips                    maltaup_xpa_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r045-20220801
hexagon              randconfig-r041-20220801
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a004-20220801
x86_64               randconfig-a001-20220801
i386                 randconfig-a006-20220801
x86_64               randconfig-a002-20220801
x86_64               randconfig-a006-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a005-20220801
hexagon              randconfig-r045-20220802
s390                 randconfig-r044-20220802
hexagon              randconfig-r041-20220802
riscv                randconfig-r042-20220802
arm                              alldefconfig
powerpc                      katmai_defconfig
powerpc                     akebono_defconfig
arm                   milbeaut_m10v_defconfig
arm                      tct_hammer_defconfig
arm                         shannon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
