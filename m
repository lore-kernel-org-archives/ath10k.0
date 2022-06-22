Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBDDC43334
	for <ath10k@archiver.kernel.org>; Wed, 22 Jun 2022 01:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cm/v9rslz+04YWwdDWaqusmpunfYpsddl4Qzrbdbzyo=; b=V5IoIrkqJL8zIb
	Un9fvA58ndEUjDnaCNvJX+Opcl725faIkp1oaoGYexKElUId6HkNdpnYbJzKR6d9WULcDOGf7btVh
	Az4udzRUuyH05DxSWiUBNbvJ7ZDg+fk+j92zvx/6ZFjDINQSoo1gGuiJDOeN3lH5otdl99zuUB4AM
	dSGIOibKK+/L5MJEjPSpLizU6Za6no5/Oc+fw9nn6Y/rEeaoXPbXGTManZjnk6kIUcvD07a1CRtl0
	+4Hyzy0KK67wDKU3afr/tbWvAmyB22NDqkmz2VcIPiYG8X8F7C+SyEJeyWhX8DrtUIcW0oICHkGwS
	yfuM07pFkfCFoTkVdoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pWp-00843e-GV; Wed, 22 Jun 2022 01:51:35 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3pWm-008426-0c
	for ath10k@lists.infradead.org; Wed, 22 Jun 2022 01:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655862691; x=1687398691;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aO9heJpajBjHIuHkgzuu+YtRXVhfrwN0V2hC3JWlt7o=;
  b=NPF3MSTtqoAHZXeJ+v9Xn6BVBGxEdq61RJygbNligFis15C2H5DRvzu0
   PfvqXeY8zj/zM14dy/21DQ7ZRRMRnVh40hOR06tg/jDKiRrkn57I7JTBC
   fIRJjcklqd7pdF/I7ROxAdx3rSv3nkN2pJn/LUb2/T1e3PUzcg4VQhhRf
   ezIFcKjtYXDCsKzXn3Zr+DvZu/WAYibfwkk2K793nVlay7xngrYPFzpgE
   JuAwLfm2FAhDcdMwBGXOtyLVQDYQPaaY3WYjlP7gPqRcQNbk3YFQHCzaF
   mThiU2VngVMmMiCsZej4WImxLcql39ymnTSEW4mHyNgacdjVDOW3E8kWp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="366609243"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="366609243"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 18:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="643920565"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2022 18:51:24 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3pWd-0000gt-Ib;
	Wed, 22 Jun 2022 01:51:23 +0000
Date: Wed, 22 Jun 2022 09:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4c8687b2fc6925d0483c1c9441c5c1806145cc0f
Message-ID: <62b27586.lNWSgTkRT6iU8353%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_185132_128772_638F34AB 
X-CRM114-Status: UNSURE (   4.29  )
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
branch HEAD: 4c8687b2fc6925d0483c1c9441c5c1806145cc0f  Merge branch 'pending' into master-pending

elapsed time: 1152m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     mpc83xx_defconfig
sh                          urquell_defconfig
sparc                       sparc64_defconfig
m68k                          multi_defconfig
alpha                            alldefconfig
mips                       bmips_be_defconfig
mips                           ci20_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7724_defconfig
arm                        realview_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                         wii_defconfig
sh                          sdk7786_defconfig
arm                         axm55xx_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   sh7770_generic_defconfig
m68k                            q40_defconfig
arm                           stm32_defconfig
sh                          kfr2r09_defconfig
arm                      integrator_defconfig
riscv                               defconfig
ia64                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                                 defconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
sparc                            allyesconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                 randconfig-a003-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a002-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a005-20220620
i386                 randconfig-a006-20220620
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220622
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
s390                             alldefconfig
mips                        qi_lb60_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
