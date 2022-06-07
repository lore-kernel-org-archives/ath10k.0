Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A813C433EF
	for <ath10k@archiver.kernel.org>; Tue,  7 Jun 2022 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/+SBT3NETnRox2qiZZSr0p65JmDetUK9RysKVFsFRYM=; b=u8oS7YJConu31k
	+hqBoEcay31A9BDmenVVCTELT0Qt4m3Az/1CclmNwCcNY+IeEkkuhWdl/4tGrgtIqF0ntqoxxjjgM
	xA57eQUA62mXGuh8bBDsnrm9iKiKHYZwGj259FxKUpTlonClAaKXbt0bVMTCZif56E7LzLBIPzw3m
	sglBH8gOwTM46iklxq67zjYX1Bta7doWAf0iqdr0xSzWUmkie6RIeJs0XZv8IiF6CyEyCvjVeMwBE
	TYUkthoNdu4HApSJMZQFuV9fsDaXPAMGymmWM83y7+vk4rcfBhcWK5wg9U9/Wn+DynM1g//SMfmAj
	rl0559/KS7e0cg82EnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVan-006GGW-0E; Tue, 07 Jun 2022 09:33:41 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVKd-0068Vp-72
	for ath10k@lists.infradead.org; Tue, 07 Jun 2022 09:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654593419; x=1686129419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fLZx4Ht1WKWTWKynW++l4otkvnRv8i/LjSbwX5m3Wp4=;
  b=EE0H2Pz+EYhd3H7ucx7kI3jgOt9EzpgLrsLcY05+4RMUNZWbgiR7+AEp
   tb1NAhvn9I62Ru1qQ9YP//69ZuZDjwjnTX2nyDD+7KUf/sbwpVh4Gnpto
   m2GUDD8ovGIxtpi9BEi2ZxVLThHbZNR8Qp85cTSxFWPqWZQ4LkTc6viHW
   xeStTg12EDfcnOp5GJuPUgDQmomgw73wGUtPXerzB+LlZQ7IC757HsUIW
   CNPN1WXk4uduLAlZRWre45oIuB+zRquEU6wF7bjglOPXYcfw9Twam5V6T
   DGlperxql+aP1zozFGWApS+9I4RkO0q930E8I1rWUSFRwwpkJB75j8aXo
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275489738"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="275489738"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 02:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="647948655"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2022 02:16:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyVKS-000DXZ-Lw;
	Tue, 07 Jun 2022 09:16:48 +0000
Date: Tue, 07 Jun 2022 17:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 32d2f08395c42287428e515327198f59683bb8e8
Message-ID: <629f1757.NKEG6by4YnTakCjh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_021659_308159_25C414E9 
X-CRM114-Status: UNSURE (   6.29  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 32d2f08395c42287428e515327198f59683bb8e8  Merge branch 'ath-next' into ath-qca

elapsed time: 1125m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
csky                                defconfig
s390                                defconfig
arm                           corgi_defconfig
arm                          badge4_defconfig
sh                        apsh4ad0a_defconfig
mips                           jazz_defconfig
m68k                        m5307c3_defconfig
arc                     haps_hs_smp_defconfig
powerpc                      bamboo_defconfig
ia64                        generic_defconfig
sh                           se7724_defconfig
sh                               j2_defconfig
parisc                              defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
parisc64                            defconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
mips                             allyesconfig
alpha                               defconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                                 defconfig
nios2                            allyesconfig
m68k                             allmodconfig
h8300                            allyesconfig
m68k                                defconfig
mips                             allmodconfig
nios2                               defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sparc                            allyesconfig
um                             i386_defconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
powerpc                          allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
um                           x86_64_defconfig
ia64                             allmodconfig
arm64                               defconfig
ia64                             allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
xtensa                           allyesconfig
sh                               allmodconfig
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
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
mips                           ip22_defconfig
mips                        bcm63xx_defconfig
powerpc                     pseries_defconfig
powerpc                      katmai_defconfig
mips                  cavium_octeon_defconfig
arm                   milbeaut_m10v_defconfig
arm                     davinci_all_defconfig
powerpc                        fsp2_defconfig
powerpc                     tqm8560_defconfig
mips                         tb0219_defconfig
powerpc                     powernv_defconfig
mips                        qi_lb60_defconfig
arm                         socfpga_defconfig
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
