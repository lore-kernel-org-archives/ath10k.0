Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BCCCE7AF3
	for <ath10k@archiver.kernel.org>; Fri, 29 Sep 2023 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UzrS646fxDLmMibZN//8UMwoEb3pE6Ad+lxKYFBxm2M=; b=F2AtpoXdb8bVZH
	x5ARu19DDckzeywKzSTihkYra2z1Byxo02VBzlV+L1QXfxqohC2m1YRqLIGK2D95wQ587cv3+zXEQ
	oxsJolgSXB/6afwZ2QZulu8EpudcEFMX+/XqtD/IPyY5MLFPhzWO8P0QXCzVMlxK0QkN03pyqObIu
	ctWMrl9buGewZDfgvbyeixtbtljfqMH4rLh+iu0Evkk1fw8He5nj7IBwAwBmSXQ8fVCn1KNVpNQ4E
	oST+uUTEn63idswrlnIjg15Vc+lEPSEKM3RfBB3z5Gykr2c1Y+AvlWnEEq9w+SuGm2lkohZERcMI/
	Q4DPKQlvb9JIZf0sHC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKd4-008Zk5-11;
	Fri, 29 Sep 2023 21:02:30 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKd0-008Zjf-1n
	for ath10k@lists.infradead.org;
	Fri, 29 Sep 2023 21:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696021346; x=1727557346;
  h=date:from:to:cc:subject:message-id;
  bh=xOqf2OYWN/+SJlMnI14DQzoxFLRl47EUHuKD4KcJQIk=;
  b=JNy4YhGi+lb06LrVkKqchiFNh+teH16Z/xr2sIcxEp1X+KE07tNjLaES
   JPUVLzM9OFR7WweD7MtvlG0WXXMGY59KUph9os79MOEqqeyHGNtyqR2+5
   W+JgythqFCTKGlfPo9XBkdjFC5C5lQjLrea/g3CJUwDuK/rU4U00DmFe4
   Dcr+txIMEP1iTd6s1W5KP2enKB3Ni6XVWsT+jIktolwLU3hTSxuQl4i2G
   6v61GTnj6Oh1Z8fkLNe3yZXq9NJgLFeNIRPHDPuOC6S60X+/Y6bTKVMep
   Qpk4zeI06ldxI8LiMd1E6EyHa3mQNGYRqLkyoQQLqYT65y2vcL++swyQB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="372731882"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="372731882"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 14:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="1081051779"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="1081051779"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Sep 2023 14:01:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmKcX-0003GR-0T;
	Fri, 29 Sep 2023 21:01:57 +0000
Date: Sat, 30 Sep 2023 05:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 9e61589ac3c2d23c528d3ffd44604d98553ea1cb
Message-ID: <202309300543.TkFxpvWi-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_140226_637447_01E352CB 
X-CRM114-Status: UNSURE (   5.38  )
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
branch HEAD: 9e61589ac3c2d23c528d3ffd44604d98553ea1cb  wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling

elapsed time: 1768m

configs tested: 172
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230929   gcc  
arc                   randconfig-001-20230930   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20230929   gcc  
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
i386         buildonly-randconfig-001-20230929   gcc  
i386         buildonly-randconfig-002-20230929   gcc  
i386         buildonly-randconfig-003-20230929   gcc  
i386         buildonly-randconfig-004-20230929   gcc  
i386         buildonly-randconfig-005-20230929   gcc  
i386         buildonly-randconfig-006-20230929   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230929   gcc  
i386                  randconfig-002-20230929   gcc  
i386                  randconfig-003-20230929   gcc  
i386                  randconfig-004-20230929   gcc  
i386                  randconfig-005-20230929   gcc  
i386                  randconfig-006-20230929   gcc  
i386                  randconfig-011-20230929   gcc  
i386                  randconfig-011-20230930   gcc  
i386                  randconfig-012-20230929   gcc  
i386                  randconfig-012-20230930   gcc  
i386                  randconfig-013-20230929   gcc  
i386                  randconfig-013-20230930   gcc  
i386                  randconfig-014-20230929   gcc  
i386                  randconfig-014-20230930   gcc  
i386                  randconfig-015-20230929   gcc  
i386                  randconfig-015-20230930   gcc  
i386                  randconfig-016-20230929   gcc  
i386                  randconfig-016-20230930   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230929   gcc  
loongarch             randconfig-001-20230930   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   clang
mips                           mtx1_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                   microwatt_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20230929   gcc  
riscv                 randconfig-001-20230930   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230929   gcc  
s390                  randconfig-001-20230930   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230929   gcc  
sparc64                          alldefconfig   gcc  
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
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230929   gcc  
x86_64       buildonly-randconfig-002-20230929   gcc  
x86_64       buildonly-randconfig-003-20230929   gcc  
x86_64       buildonly-randconfig-004-20230929   gcc  
x86_64       buildonly-randconfig-005-20230929   gcc  
x86_64       buildonly-randconfig-006-20230929   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230929   gcc  
x86_64                randconfig-001-20230930   gcc  
x86_64                randconfig-002-20230929   gcc  
x86_64                randconfig-002-20230930   gcc  
x86_64                randconfig-003-20230929   gcc  
x86_64                randconfig-003-20230930   gcc  
x86_64                randconfig-004-20230929   gcc  
x86_64                randconfig-004-20230930   gcc  
x86_64                randconfig-005-20230929   gcc  
x86_64                randconfig-005-20230930   gcc  
x86_64                randconfig-006-20230929   gcc  
x86_64                randconfig-006-20230930   gcc  
x86_64                randconfig-011-20230929   gcc  
x86_64                randconfig-012-20230929   gcc  
x86_64                randconfig-013-20230929   gcc  
x86_64                randconfig-014-20230929   gcc  
x86_64                randconfig-015-20230929   gcc  
x86_64                randconfig-016-20230929   gcc  
x86_64                randconfig-071-20230929   gcc  
x86_64                randconfig-072-20230929   gcc  
x86_64                randconfig-073-20230929   gcc  
x86_64                randconfig-074-20230929   gcc  
x86_64                randconfig-075-20230929   gcc  
x86_64                randconfig-076-20230929   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
