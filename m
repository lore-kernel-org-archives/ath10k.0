Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04000C43217
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 05:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ygmStHPsz7h2vOW6N5fHUA7As32AXgjgsGAczrDr+G4=; b=4FE8qt7U1CA3X6
	Joha/7NupK7hZDr8xi/nGT7DV/sNceGYbV1XWkYT8z6G5LHzDRJAatkVK8IV+SNB6PMOsiWWfETgv
	hw9U0vG19zRTpXzQDHy2TU9bLb157KQW/ra8cQPcJtZ75o5bJvDgQOyFCp70rt0UwBwaWCBzLn230
	IaPzZVDbVakgVb4dvCM4T1viTd6OKWHSYQaFlqIBymtM6eA55EyMPvwAhlkie1PlqTsswLldvyQSq
	OJaCd048QKfqFbuwU0l7rnGis2YrbJ+Z0VXKfB5sc4koc1QezTSZcKMAw67wnQg3lZc7EsJBAunsW
	C81ySjECKUWSS1vRupEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5W-00GCnc-5s; Thu, 03 Nov 2022 05:48:26 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5T-00GCmS-J0
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 05:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667454503; x=1698990503;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JLXfyiob9mbNc/ExLENZD5wC67aOjsW0iDDKnNdwFT4=;
  b=APbJ0NLpQHbS9YJftdwMWd1wiRBt0Y1wLInhVCVOu+XY2feo4k5CF+xr
   x68BRxaU0cFl4siK0Jjy+8umEJIKhUPMVn7TrQQCXs4Uli135Ds7MfnBE
   HEBZ0ai1jx2U7BpkmGIIG+mZTuf94pbSofbqouoACy6ZWILRqbBdlspDX
   p3NlOj6dBKq743y/9ApJM0ei/q7BWfXB+LwV4pfH0KwHofmuz6HXXD81g
   5CMBgwslRHtDCYVM0Y17AyUb3VEm9Tgu/d8anZ+6gJ3+j4Ntri9Ttq9M2
   C1KJjfHExYnFZoVzC6NddWzcPfZoYzg0TNIih0MIyldgbrnEsupLE+SQ5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289305547"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="289305547"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 22:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="585664095"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="585664095"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2022 22:48:19 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqT5O-000FY7-37;
	Thu, 03 Nov 2022 05:48:18 +0000
Date: Thu, 03 Nov 2022 13:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 804d85c714094537bfb3b1dbe0607559b8a169f9
Message-ID: <63635612.aa3IBNKN1g+Mj1BP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_224823_701124_B3265338 
X-CRM114-Status: UNSURE (   4.84  )
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
branch HEAD: 804d85c714094537bfb3b1dbe0607559b8a169f9  wifi: ath11k: Make QMI message rules const

elapsed time: 725m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
s390                             allyesconfig
ia64                             allmodconfig
mips                             allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a002
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221102
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                        randconfig-a004
s390                 randconfig-r044-20221102
x86_64                              defconfig
riscv                randconfig-r042-20221102
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                               rhel-8.3
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                             allyesconfig
m68k                         apollo_defconfig
mips                     decstation_defconfig
sparc                       sparc32_defconfig
m68k                          multi_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                        multi_v7_defconfig
arm                         s3c6400_defconfig
sh                        apsh4ad0a_defconfig
arm                           tegra_defconfig
sh                          rsk7203_defconfig
i386                          randconfig-c001
sh                                  defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
parisc                           allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r041-20221102
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
riscv                randconfig-r042-20221103
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
s390                 randconfig-r044-20221103
mips                     loongson1c_defconfig
mips                           mtx1_defconfig
powerpc               mpc834x_itxgp_defconfig
riscv                    nommu_virt_defconfig
mips                       rbtx49xx_defconfig
arm                         socfpga_defconfig
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
