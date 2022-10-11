Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB14CC433F5
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TnfZWyY4wP5PRoVE0tdPrv8fdhqJU+Tr4M97uKEfL1o=; b=JGB6qB3W9VNhlt
	K/0bpkkFb8xOffeJucdoGcZVzlrzOgO7s7J3/rMaUWDjjsk/yF1Xh3Fl683UDu9Yl5mL/mLss5d6g
	MSTMpjVGPK0z3x6GNEQxW9UpQHjuA88N3bxZpF/3oUyZJEnwSBqYZjxv4eV4p7lMVL2LcXrHDSZ5b
	NQ0IrWCfw9ckrq7X3J71MAxXmB/PJdkJSXCJmnIqmLgs9NsunoORSCrmx18WhYvUTVHMTfhtcgdfz
	e8wwyAy8DgpASsJW15ogOyFjGi/hPcd5NKBg4ayIv2pKZ1wnThIuOXiVcKk1YCiM7B3mzBza3pP19
	iyMxK44bnhiP3PCxAc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi4GF-002vyU-CH; Tue, 11 Oct 2022 01:40:47 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi4GC-002vxV-9S
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 01:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665452444; x=1696988444;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jXJ9Fpu8Pp0m1ponrRrNUIZmAYQ8J/HrxGhoY3u7D/4=;
  b=gqcgCeK8g28HeAlAE9RFUtOTgs/57BR5j0y2zz2MCKJP1JfteShqnpyc
   oXXKWPJZyW/RE3ITPShk+oBBIHW70GDJaS7gwWsiWn5qGOQaqQk/iBnHQ
   Eaq0zlLEY+EKCpufASopFkb4CRNyNglBx21RgWEt8XJ+IhZiGVOKIq0Wh
   irea/47m3syGfw5zxeGPOVDSrCwUJ7Dbh26rDaC60Vnqc5ciBNsrCDu/w
   rBdbypg/tXMQXqGIDu17JM9IsZZXTzXUOIaofZMBRSvvUS2sFR2R0JETT
   Wy7niZVmzFtCLuXOzrKKjGOAClMVIqTl+dCCTaj1ntus9PYVvKawThmDT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291694071"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="291694071"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 18:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="659359046"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="659359046"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2022 18:40:37 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oi4G5-0002MN-19;
	Tue, 11 Oct 2022 01:40:37 +0000
Date: Tue, 11 Oct 2022 09:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 044a8276819470bd89f3cfcd1287ce41662d43fb
Message-ID: <6344c95c.BYYnZx4EOquc3W+n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_184044_470391_E41674F8 
X-CRM114-Status: UNSURE (   6.90  )
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
branch HEAD: 044a8276819470bd89f3cfcd1287ce41662d43fb  wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second

elapsed time: 722m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221010
i386                 randconfig-a014-20221010
arc                                 defconfig
i386                                defconfig
riscv                randconfig-r042-20221010
s390                             allmodconfig
i386                 randconfig-a012-20221010
powerpc                           allnoconfig
i386                 randconfig-a011-20221010
alpha                               defconfig
i386                 randconfig-a013-20221010
arm                                 defconfig
x86_64                           rhel-8.3-syz
s390                                defconfig
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
i386                 randconfig-a015-20221010
sh                               allmodconfig
arc                              allyesconfig
s390                 randconfig-r044-20221010
i386                 randconfig-a016-20221010
alpha                            allyesconfig
s390                             allyesconfig
i386                             allyesconfig
m68k                             allyesconfig
x86_64                           allyesconfig
arm64                            allyesconfig
x86_64               randconfig-a011-20221010
arm                              allyesconfig
x86_64               randconfig-a014-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a013-20221010
x86_64               randconfig-a016-20221010
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
ia64                             allmodconfig
arm                      integrator_defconfig
sh                           se7750_defconfig
sh                             shx3_defconfig
mips                      maltasmvp_defconfig
sh                           se7206_defconfig
sh                        edosk7760_defconfig
i386                 randconfig-c001-20221010
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64               randconfig-k001-20221010
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                      mgcoge_defconfig
parisc64                            defconfig
m68k                        m5407c3_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     pq2fads_defconfig
powerpc                   currituck_defconfig
arm                           h5000_defconfig
powerpc                    sam440ep_defconfig
mips                          rb532_defconfig
ia64                          tiger_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
m68k                        stmark2_defconfig
arm                        trizeps4_defconfig
arm                           stm32_defconfig
arm                            pleb_defconfig
arm                         s3c6400_defconfig
arm                         lubbock_defconfig
m68k                        m5272c3_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20221010
hexagon              randconfig-r045-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a004-20221010
x86_64               randconfig-a001-20221010
i386                 randconfig-a002-20221010
hexagon              randconfig-r041-20221010
x86_64               randconfig-a003-20221010
i386                 randconfig-a005-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a004-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
x86_64               randconfig-a005-20221010
arm                       imx_v4_v5_defconfig
mips                     cu1000-neo_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
