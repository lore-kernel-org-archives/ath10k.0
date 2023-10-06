Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A75E92FE8
	for <ath10k@archiver.kernel.org>; Fri,  6 Oct 2023 06:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bfEDSTsgg/Uan/Ipxi8F/f737NvVzz5hNHPadtuHj5M=; b=GRndphEsdOFZfY
	rO3yJiGtkhSa5RInRwEKsdBSzR5IW4F8wz5sM94eIwjN+DqV5hIWLjNxeM73l3oCGyhH5a6zriUfk
	G/R+/XQ5dyJBP/M0CnjAI8WCjFLW5YUKClx7nJrK75CyFh6b6H3HX5jbItEaVQactFif23n+qYOJW
	F3jiydZapSCPCFrg4fHwZBv123aZPnyuM8BzVSv47WpbjQiNMaJnAdN1otBE2IxVyPUMBdf3raqxU
	uvbhkY4Ld6F5glQd0fhVNIXd5VsJMdRdb+hUqVEOsrB6UNrX9VCXIMqj/zqUXZbm3vrCmEjag18/W
	pJRuYlwyyFitQg5EreGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoe1S-0053DC-2q;
	Fri, 06 Oct 2023 06:09:14 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoe1O-0053CI-2y
	for ath10k@lists.infradead.org;
	Fri, 06 Oct 2023 06:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696572550; x=1728108550;
  h=date:from:to:cc:subject:message-id;
  bh=C/uiI/N5eioRNitwnaqGOXw9xsLkIGqYUC7rYsyZhcA=;
  b=AvgvX/AKy7sZZaEfiD1/ly+Xa+sDe0eOwtxeUQPvIzaUMm2B1twbQovR
   J4g1FZqDC49N/Bo+N1V/xntE7x3m40F8dgpF0FlB54PRLzBISfPbaM68i
   wKU3SqGtuA59RooJhe9AQoCoUsaHp+g8H2CYkiiJdZAEjgrTPl39BESmH
   6jn9nDJW9Kou3FEQLRkxT7M470WPY0tdNEu7XdoQHLliQcLUKO+FH4Gv0
   HbfMVRQfM5MVqQo7WXWMG+dLygZmMl/xrpB/2hzYuFm5dg1xgMpTFxKg/
   cX+2/i1YbaoaWwPJ4zU1V5WYrIcGanDxmLrvsSXBPxHyestfa7qeYfeUj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363963240"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363963240"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 23:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868220213"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="868220213"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Oct 2023 23:09:00 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoe1C-000MJm-09;
	Fri, 06 Oct 2023 06:08:58 +0000
Date: Fri, 06 Oct 2023 14:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 453a62a3ee65aeba6e69bfd09227fc2f19290bea
Message-ID: <202310061441.3CVnbCUU-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_230911_118908_D390B427 
X-CRM114-Status: UNSURE (   5.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 453a62a3ee65aeba6e69bfd09227fc2f19290bea  wifi: ath12k: fix debug messages

elapsed time: 1419m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231005   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                   randconfig-001-20231005   gcc  
arm                         s5pv210_defconfig   clang
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231005   gcc  
i386         buildonly-randconfig-002-20231005   gcc  
i386         buildonly-randconfig-003-20231005   gcc  
i386         buildonly-randconfig-004-20231005   gcc  
i386         buildonly-randconfig-005-20231005   gcc  
i386         buildonly-randconfig-006-20231005   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231005   gcc  
i386                  randconfig-002-20231005   gcc  
i386                  randconfig-003-20231005   gcc  
i386                  randconfig-004-20231005   gcc  
i386                  randconfig-005-20231005   gcc  
i386                  randconfig-006-20231005   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231005   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231005   gcc  
x86_64                randconfig-001-20231006   gcc  
x86_64                randconfig-002-20231005   gcc  
x86_64                randconfig-002-20231006   gcc  
x86_64                randconfig-003-20231005   gcc  
x86_64                randconfig-003-20231006   gcc  
x86_64                randconfig-004-20231005   gcc  
x86_64                randconfig-004-20231006   gcc  
x86_64                randconfig-005-20231005   gcc  
x86_64                randconfig-005-20231006   gcc  
x86_64                randconfig-006-20231005   gcc  
x86_64                randconfig-006-20231006   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
