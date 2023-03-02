Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A962C678D4
	for <ath10k@archiver.kernel.org>; Thu,  2 Mar 2023 03:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BEXfO7IGzIY+6O8qPmiApBSHOUgA/gNlJ+bpnAa3Xv0=; b=JIJnLWoOq3ZKDh
	0k29pd9cgWoTD3iITqdCHvtLlwejBWb94JF3PQq+SRME+zwck8kItbvAwoH63p3i4RJRS/6Dw5fYU
	M0W3O5V/UqQFin4NuDqiVm7JqW6WP3N3+xJ/55L1bJEGsc8jk9NNfguFlA8Da7tHGAo7nB1oN6hNw
	i/llVyplHKIk93lEWKkRVxYICAuc9lriuh7P7p9rQGGfR+9IZp88L5AEoejOeHkMmSzPTQIhlxzQK
	at60eUHSyDYk73b+WzC0YhdkEZJxspOOY+dwdA7YTHkgq5vUIz2f14XRjYgz/EIDHuu1KJ/YJ5n8b
	gTChbp4ikpfruL25SMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZtQ-000idV-Lh; Thu, 02 Mar 2023 03:46:08 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZtK-000id0-Ug
	for ath10k@lists.infradead.org; Thu, 02 Mar 2023 03:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677728762; x=1709264762;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=84xPibpBAm1z3ci/kRkqvVMlqnct3ll5Jw6WEu6xArQ=;
  b=MO1zOtaCkz6oM1BrlLATQMcT/BYhb0tAhNeKUxMlUtNnAbNvNtkqFsQN
   87OBqZz9ni4U2TKFmfyJY7x3m+ZWAX+ypsVaWkNE53QRrwY2StV0hD02c
   l5JqK6HW+/gAk/zTmkkseKAGolEFEyysqDh+tbqKZjvE+vJc8VQEjhS1q
   GLDTvPu7TvCqXdVLYcuZ4CNWRKSK9JkYJ5OEXOnq2c2l0PkeF5eIJGHLz
   lDkl5Wg8VyritG4si/Sq8OYYAg9QKCKzuhfa1jUnTqP/Sq8EOwukfeEPE
   TCAjpA61IBabwaoaPJx3LMC99Z2Edo/6KkOG5dr0CUViBypRUe20EpTZv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="362192160"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="362192160"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 19:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652257187"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="652257187"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2023 19:45:59 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXZtG-0000AV-2E;
	Thu, 02 Mar 2023 03:45:58 +0000
Date: Thu, 02 Mar 2023 11:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 f2893862b63132d21062e311a7f8532335bfd525
Message-ID: <64001bbc.p3QpEg5qoTeKQLEs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_194603_058427_662D3494 
X-CRM114-Status: UNSURE (   6.61  )
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
branch HEAD: f2893862b63132d21062e311a7f8532335bfd525  wifi: ath11k: add debug prints in regulatory WMI event processing

elapsed time: 792m

configs tested: 100
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230302   gcc  
alpha                randconfig-r015-20230302   gcc  
alpha                randconfig-r025-20230302   gcc  
alpha                randconfig-r031-20230302   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230302   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230302   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230302   clang
arm                  randconfig-r046-20230302   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230302   gcc  
hexagon              randconfig-r021-20230302   clang
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r045-20230302   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r026-20230302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r016-20230302   gcc  
m68k                 randconfig-r032-20230302   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230302   clang
nios2        buildonly-randconfig-r003-20230302   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r012-20230302   gcc  
openrisc             randconfig-r013-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r033-20230302   gcc  
powerpc              randconfig-r035-20230302   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230302   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230302   clang
s390                 randconfig-r024-20230302   clang
s390                 randconfig-r044-20230302   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r002-20230302   gcc  
sh                   randconfig-r003-20230302   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230302   gcc  
sparc                randconfig-r011-20230302   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230227   clang
x86_64                        randconfig-a002   gcc  
x86_64               randconfig-a003-20230227   clang
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230227   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
