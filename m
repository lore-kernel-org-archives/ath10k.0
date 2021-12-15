Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE59CC433F5
	for <ath10k@archiver.kernel.org>; Wed, 15 Dec 2021 12:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V/I56QrxvrneTd+2QO5FMXczb1TtrMhTa1RPnlTG/C0=; b=FzoUGwU9f/MCqC
	RnFM5OsYQavlAUkcP2rGl2/5XuG8/hk8XgLcFKZ4BDRlZRB+fYR2SZJdckvVahiYf7gjzBgbWz9Bt
	mDiONLT313Ql7We74WZ8UWSNS/ijtzutTRrFVqGTfBUBLfhq9DpVznZ9xgnJxPZSdEK19I6rINWl8
	P/Dhx/n4l3IAzVOps3pQcmIWTf4S7as+r7vMxVNbMob5Sqj7v2LklxKaSZ0mY8aXleNuaxmonHvpT
	MVmluo4sthOs1DDF1xm+KFpI54uvlbFcQcbJMvcpzbRq+DgxJlMI2/80E0Swxyj5l+dB8fiol7zkk
	wz2+ZhQMg2aRR3ujDP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxT3o-000jRf-3Q; Wed, 15 Dec 2021 12:07:04 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxT3l-000jQX-03
 for ath10k@lists.infradead.org; Wed, 15 Dec 2021 12:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639570020; x=1671106020;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=83T+4l+eSB5S8XbXp47WKU8gtQC70lWFLKJo6Qz3oGU=;
 b=hFqfFYG8dONprWIfW21/T1BcstALCvWsfLnaZ0Wi0h8Hkkh5NH8zaDRk
 +Xln9N38uDUlzKu0PRfu4ATsxpZSkL2Cql0URGzEO/ZKBoeTURhgH0w5v
 6Cjly0hkknBOev3Ak78phOfm0gmVEARGzaEQt1nmdz5os2Zt/ePDd9nt+
 lMDNhzazcsGm/KA/K7RhcQVhiVTmb+yy2SMHbiaJyuSWqHz+vRV6Stgm5
 Pk/cYkqphN072HGmVLK7zfU9GESioeSpQNyJrImqKhn/m+Xj3zcBDWmqk
 WF3uPMxZrMBhSDDR3wxqf61OISPDnZcCGyLV3n+kEm7mYD4fKl8PTdQX0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219228092"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="219228092"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 04:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="505774066"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 15 Dec 2021 04:06:59 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxT3i-0001jL-Ij; Wed, 15 Dec 2021 12:06:58 +0000
Date: Wed, 15 Dec 2021 20:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 f21e9b6adc354bfa274d4510df602f081a08194e
Message-ID: <61b9da45.fy19UiLyYp2WrdnV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_040701_120615_441E1BC9 
X-CRM114-Status: UNSURE (   4.24  )
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
branch HEAD: f21e9b6adc354bfa274d4510df602f081a08194e  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 1147m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211214
sh                 kfr2r09-romimage_defconfig
xtensa                    xip_kc705_defconfig
powerpc                    klondike_defconfig
sh                          urquell_defconfig
mips                      bmips_stb_defconfig
arm                            hisi_defconfig
powerpc                      acadia_defconfig
arm                            mps2_defconfig
mips                           ip22_defconfig
powerpc                   motionpro_defconfig
sh                               alldefconfig
arm                             mxs_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           sama5_defconfig
mips                            ar7_defconfig
arm                       aspeed_g5_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  randconfig-c002-20211214
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211214
x86_64               randconfig-a005-20211214
x86_64               randconfig-a001-20211214
x86_64               randconfig-a002-20211214
x86_64               randconfig-a003-20211214
x86_64               randconfig-a004-20211214
i386                 randconfig-a001-20211214
i386                 randconfig-a002-20211214
i386                 randconfig-a005-20211214
i386                 randconfig-a003-20211214
i386                 randconfig-a006-20211214
i386                 randconfig-a004-20211214
i386                 randconfig-a013-20211215
i386                 randconfig-a011-20211215
i386                 randconfig-a016-20211215
i386                 randconfig-a014-20211215
i386                 randconfig-a015-20211215
i386                 randconfig-a012-20211215
arc                  randconfig-r043-20211214
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a016-20211214
x86_64               randconfig-a015-20211214
i386                 randconfig-a013-20211214
i386                 randconfig-a011-20211214
i386                 randconfig-a014-20211214
i386                 randconfig-a015-20211214
i386                 randconfig-a012-20211214
i386                 randconfig-a016-20211214
hexagon              randconfig-r045-20211214
s390                 randconfig-r044-20211214
riscv                randconfig-r042-20211214
hexagon              randconfig-r041-20211214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
