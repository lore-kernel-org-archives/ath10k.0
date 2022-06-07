Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B79CC43334
	for <ath10k@archiver.kernel.org>; Tue,  7 Jun 2022 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iEmlIfUAobQbBdZq5Wbh0jrRA6CGWgf3qOTip3m2QdM=; b=sPICG4LhWksd8Y
	CRBPaCR0OCmu7zZijs7Vr+N2N2mZpFWMEwYMSWBr/f/b2ByhuFyyfTD0/tGSjWJgX/s3Il/GLK/aG
	LiAc1B/OQQ40+uhZWAzOGWKhjcwbBcTH8efDwVkgy6KUE1HQwdLMVfBD7JuBFJ21Jo0MevmTupZrD
	ejvtvDW+e2mBHXOnsJORGMIbjCikJZj97fdE9R4RDJ4BT3b8ZppJ3AqM4Z3AP6XeTpmEC9QTQVynb
	K2U7YE4eQTBhTsV85TYq/F2XL8LxFiiXTTOzXTHiRmpD+AbTcfgBsqR3fmjwFIwb+tzjQskE31EWM
	td/1pCdQtY7C1fcmFlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySon-0053ww-E9; Tue, 07 Jun 2022 06:35:57 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySoj-0053uw-Sc
	for ath10k@lists.infradead.org; Tue, 07 Jun 2022 06:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654583753; x=1686119753;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WBA1aiPCTmtwSaTjEodKqQlaGGrpvJd9D73NxoymOts=;
  b=YILqqQm+vVNjPtqt8hMEqEozMzn9G4O3Iw4fEaQEcuJy3lx9jjDJoIAc
   gS+lg8LNJJH5WD1wngaR0ZcWGI87dUHpZ1VOzIIHS1KpGg5Bf7MbBTFuy
   Db6WsGfpWY0+PFKhWkmOk2R8+JwTP9xmmT9jlKuNzDyl5fYtdHO1g8EgZ
   LUIsd5Ftqf2PmR3gat6NdiR+yMUgsq3Oi1/UmDL3k1MQgHGQyoATSSdJN
   QBKncxOSEsclTHG5Rjwu8F3EkWff6eaNvCEh9TkDL3CEoG0qmeV9YVw7b
   CcHYLImDLd+8WgeB0hvKEWTRCg83K0wvtSTLXANa+9OZt/e63MGafOIlx
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277036884"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="277036884"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 23:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="647893710"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2022 23:35:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nySoa-000DQf-CZ;
	Tue, 07 Jun 2022 06:35:44 +0000
Date: Tue, 07 Jun 2022 14:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 fafdb2ee309e2f5514404863f9d74aef737e4d6e
Message-ID: <629ef19e.uz5iwBAn0ipvTGZg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_233554_021225_684428A4 
X-CRM114-Status: UNSURE (   6.42  )
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
branch HEAD: fafdb2ee309e2f5514404863f9d74aef737e4d6e  Add localversion-wireless-testing-ath

elapsed time: 964m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
m68k                         amcore_defconfig
arm                          pxa3xx_defconfig
sh                   rts7751r2dplus_defconfig
sh                         ap325rxa_defconfig
arc                     haps_hs_smp_defconfig
xtensa                generic_kc705_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     taishan_defconfig
sh                            shmin_defconfig
sh                           se7750_defconfig
sh                          sdk7786_defconfig
arm                        mvebu_v7_defconfig
ia64                        generic_defconfig
powerpc                    sam440ep_defconfig
powerpc                      chrp32_defconfig
nios2                         10m50_defconfig
arc                          axs103_defconfig
powerpc                     rainier_defconfig
arc                            hsdk_defconfig
arm                            qcom_defconfig
openrisc                    or1ksim_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220605
riscv                             allnoconfig
h8300                            allyesconfig
m68k                             allyesconfig
xtensa                           allyesconfig
m68k                             allmodconfig
csky                                defconfig
arc                                 defconfig
mips                             allyesconfig
nios2                            allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
mips                             allmodconfig
sh                               allmodconfig
s390                                defconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                             allmodconfig
riscv                          rv32_defconfig
parisc                              defconfig
parisc64                            defconfig
riscv                    nommu_k210_defconfig
parisc                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
s390                             allyesconfig
sparc                               defconfig
powerpc                          allyesconfig
i386                             allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sparc                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
um                             i386_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
arm64                               defconfig
ia64                             allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
i386                 randconfig-a010-20220606
x86_64               randconfig-a011-20220606
x86_64               randconfig-a010-20220606
x86_64               randconfig-a012-20220606
i386                 randconfig-a011-20220606
i386                 randconfig-a012-20220606
x86_64                        randconfig-a011
i386                          randconfig-a010
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a008
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a007
i386                          randconfig-a005
i386                          randconfig-a009
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220606
riscv                randconfig-c006-20220606
s390                 randconfig-c005-20220606
i386                 randconfig-c001-20220606
mips                 randconfig-c004-20220606
x86_64               randconfig-c007-20220606
arm                  randconfig-c002-20220606
i386                 randconfig-a006-20220606
i386                 randconfig-a003-20220606
i386                 randconfig-a004-20220606
i386                 randconfig-a008-20220606
x86_64               randconfig-a007-20220606
x86_64               randconfig-a004-20220606
x86_64               randconfig-a008-20220606
x86_64               randconfig-a005-20220606
x86_64               randconfig-a006-20220606
x86_64               randconfig-a003-20220606
i386                 randconfig-a002-20220606
i386                 randconfig-a007-20220606
x86_64               randconfig-a002-20220606
x86_64               randconfig-a009-20220606
i386                 randconfig-a009-20220606
i386                 randconfig-a001-20220606
x86_64               randconfig-a001-20220606
i386                 randconfig-a005-20220606

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
