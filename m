Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B792C433EF
	for <ath10k@archiver.kernel.org>; Tue,  7 Jun 2022 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W500yrMwQhvCT3wmlmoQc90n9QCEjFxudJ19AZ8Bz5s=; b=3fH9soe4bCMCmh
	Go+nmNVwIKu9ZWmoU6z7Z4YkVysH2pvDmN1y3+X6q2kUh24A8jwCgAtU+qYPxDNXRjvUsPI7tTCxT
	I69KPZrk/sJ1zwSc22kWI6CIXW9NsDDFHcbb2St1Rn02JZfsFG7vsstcodzsjdDLMyDG+CHwTdYVM
	w37RAL1QnofB8+RSnm2lO4jAbr0X7wNuqkDvpQlEeHOP5BpYEsrRHRfbY8f7nMYSr515A/3XzT8Kt
	E2iO0BeRC5V5cq/rHin4aba7xQMEaj+hVTM9mm+/wUJfLAU4L7FeMdjufDFEjPQFhysWs3phdic6m
	EbJoo34iuA7/pFrCI02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyP8D-004AiH-U6; Tue, 07 Jun 2022 02:39:45 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyP8A-004Ahm-SV
	for ath10k@lists.infradead.org; Tue, 07 Jun 2022 02:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654569582; x=1686105582;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6nbYuFQCrlfMo4YGjeotNVw0mzi3vLQGZFH0dCW3ZC8=;
  b=LXrXiMzPvU2wD02LGsMwqBv73+rOZ0xSbNgwInK/YsR9bZrWXXavmcDX
   /yPAn8OUwc9bK+vwaUJgNCyLdJcQ1WbOupgjjMiTFrl83PozgephMm2Y2
   tOIapJNxLX/FR+B0tNaHKiwJ0YJBToJowz61gfXG2vCT+FAQNR9tZiJFA
   UU+yzik/FhaFnf5zQ6I4IooAfbM+8avIfJa5j5bHDLfgeGTQuMObL7TmF
   owDgVcd/QMD+xR2/QFYxEs508QHeObK+MSg9FPRD5a6XuGVxWNFSMgk60
   EGN2ussRGBHWC7m0M7ItdhY78koMXGywBHbW6z4AC3k3xgNnWcZu/t937
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="337895844"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="337895844"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 19:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="826144906"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2022 19:39:38 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyP85-000DGT-T5;
	Tue, 07 Jun 2022 02:39:37 +0000
Date: Tue, 07 Jun 2022 10:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 3926e0c12238a8053ed5a598b5b84c6cf2adacab
Message-ID: <629eba5e.kDviuG1q6GdVTQ56%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_193943_011118_CE5316E9 
X-CRM114-Status: UNSURE (   4.77  )
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
branch HEAD: 3926e0c12238a8053ed5a598b5b84c6cf2adacab  ath11k: Fix warnings reported by checkpatch

elapsed time: 729m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
m68k                         amcore_defconfig
arm                          pxa3xx_defconfig
arc                                 defconfig
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
m68k                                defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220605
h8300                            allyesconfig
m68k                             allyesconfig
xtensa                           allyesconfig
m68k                             allmodconfig
csky                                defconfig
mips                             allyesconfig
nios2                            allyesconfig
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
riscv                             allnoconfig
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
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a008
i386                          randconfig-a009
i386                          randconfig-a010
i386                          randconfig-a007
x86_64                        randconfig-a006
i386                          randconfig-a012
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220606
riscv                randconfig-c006-20220606
s390                 randconfig-c005-20220606
i386                 randconfig-c001-20220606
mips                 randconfig-c004-20220606
x86_64               randconfig-c007-20220606
arm                  randconfig-c002-20220606
i386                          randconfig-a002
x86_64                        randconfig-a009
x86_64                        randconfig-a007
i386                          randconfig-a006
x86_64                        randconfig-a010
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a008
i386                          randconfig-a004
x86_64                        randconfig-a012

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
