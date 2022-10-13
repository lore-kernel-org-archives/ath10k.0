Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48CEC433FE
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 18:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oxmjUBiTjpdVCi5wcYq91JmXtdnz8qZtrvxAFV8gdNs=; b=pPAf+NfpnE/pDg
	67Hg603J69MK98Gd1KWnI2NglhZAlqzo2+zhgMzZKI357BskTzQT8hEMvjP1pR3InKCU2NmIHDVjK
	4HAWRQdrqOBxn2QFcbkQCCHE41FKwIvDewnPCCMG7KhiRCRQ3eL1rU3uSat6NErEnPiaHkCYZadZj
	QLTOHUMguy+tIVC1MI7zlgfQqnxw7eZawmm7vqA0kyNcmoxwu5M4DpjPwLMwrnxdqTz57TDYbkI96
	Tx8cgCmn9E3sC/ru00bzqdOiueKuAI3GdE+AxlZTQddNaS9dKorm8EJkknFJtSapSzyLdUrcADbY3
	HUz5s4ZIWBM/t492mWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3MZ-00ClsM-1r; Thu, 13 Oct 2022 18:55:23 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3MV-00Clqv-Bv
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 18:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665687319; x=1697223319;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pLB1bF+iGCnIMQhb+RaCU43IYUdsD2SaTjb6PgOjtq8=;
  b=VD/6bVPxanPJgOOAfBOQzw1O0bRHxzVsIGkRLT9p/OHcArHXQE5yUjpS
   dvYoWLoPVSpaBexGjVmTvqI90x9PAUHdzsb8Bmr9lslkIYOxsyOUEzhqL
   +ufLS4u0WPDy7/etPCpM2t0HygVIv5J7KeE8/Kut8hJSmb+k7meW7/SGp
   yHypcRws+YAgilZa/ct5x6OjW5RH7bXPVcDZByozuqeuyFfvEan+BPmuV
   qISJEJz7+BklZo/keaVRmDQOS4khqj73cK7+f3y9blIEp1q9foRpyBJRp
   +HZr06Iuhl4Il8aoADv0Svi4fLSCUjOwXRs50mhY7KfWpotMxvAEEFYH2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="302790287"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="302790287"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 11:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="658303369"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="658303369"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2022 11:55:16 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oj3MS-0005TX-0Z;
	Thu, 13 Oct 2022 18:55:16 +0000
Date: Fri, 14 Oct 2022 02:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 4fc14af45b8ea0a17a491b50c85d355b8c1a48d2
Message-ID: <63485eda.P+V3V9R3LwOXdauj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_115519_449074_956BAC55 
X-CRM114-Status: UNSURE (   5.51  )
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
branch HEAD: 4fc14af45b8ea0a17a491b50c85d355b8c1a48d2  wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second

elapsed time: 722m

configs tested: 96
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
x86_64                              defconfig
alpha                               defconfig
x86_64                               rhel-8.3
s390                                defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20221012
arc                  randconfig-r043-20221012
x86_64                        randconfig-a015
x86_64                        randconfig-a006
s390                 randconfig-r044-20221012
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
m68k                             allmodconfig
arc                              allyesconfig
arm                              allyesconfig
i386                          randconfig-a014
arm64                            allyesconfig
alpha                            allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
nios2                               defconfig
loongarch                 loongson3_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
powerpc                      ppc40x_defconfig
sh                            shmin_defconfig
sh                        apsh4ad0a_defconfig
powerpc                       maple_defconfig
powerpc                  iss476-smp_defconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
mips                 decstation_r4k_defconfig
xtensa                    xip_kc705_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
s390                       zfcpdump_defconfig
alpha                            alldefconfig
powerpc                 mpc834x_mds_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a005
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a015
arm                        mvebu_v5_defconfig
arm                           omap1_defconfig
powerpc                     tqm8540_defconfig
x86_64                        randconfig-k001
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
