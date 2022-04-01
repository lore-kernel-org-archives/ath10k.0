Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADFAC433F5
	for <ath10k@archiver.kernel.org>; Fri,  1 Apr 2022 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nQ0V4jDGle4KHvQLuJ0YukNNZFCPhguQIFr8LITnw64=; b=qEK9820tkZngfA
	WYaJReuPtso6RLEpgrDSVMQ9m2yv2sQFk2F2+q2ICtp/u8nautq3/v9/u3SibyuMWuwNvZ33p5ROk
	kIEpSBcG7dF97zerrWT5Zf4dsAbUZL7cb53OMyCNwHd/GrturFYQqJyGpgwGEddnwWKTbwX+rtxoc
	xI+ERCBV80lnn0ZBbI++6buPijCbaXEENQwdPhAIdo4xp/8BINl6ToqwSpV+gxL6Sfx4E70Ntdb6f
	8lzZKULvbN6UFwZeMDB9V6FcW2/ssb1focJ/MKRmIUzocpggTJfp0HdV8hV8Q1QqeNF965zw5GArt
	/Y9pYlRYYJOvCn1QuEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naARZ-004cLP-7E; Fri, 01 Apr 2022 06:07:33 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naARV-004cK9-Pv
 for ath10k@lists.infradead.org; Fri, 01 Apr 2022 06:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648793249; x=1680329249;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=wlTxuxpEbecOjmQJ8UMW5OgAKaHIB4GgATfo0VNjU0Y=;
 b=DokDBClj7b/aqdAafIH8kLYFyVQc9dzSsq3xyQgIZuLiyF+JGKRAoNOu
 oGdDyfqFrdbfdoca/cgbZ/u1v16jZTbSbW6HZ1o/KQwhhxeRufUNjjFyW
 f6cyWj1QuHWiE5Vw5kICVPHeLJKvkc99BoluC2AU4yItYoUJetd05s8+U
 sOvpIdsMU4jmJ5vlRVoTCMScWBhDvwn2jv9fbgMB0f/pz+nnheGua/ERc
 gdFnm7+TmNqPv3+Rv4D2K9kp+bkCz1Aa7CEJYNyW8d6tnVV6vVSFU12jM
 pJFHBjd/Em6nDYMZIHCmbyFPIiqYyQbgMw63386ddH/sW3d0rZUOr2wqo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="284977402"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="284977402"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 23:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="547664638"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 31 Mar 2022 23:07:23 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naARP-00010U-2j;
 Fri, 01 Apr 2022 06:07:23 +0000
Date: Fri, 01 Apr 2022 14:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 210654018454e73aaa0d5b3be3d6e42c6368ae8e
Message-ID: <6246966e.NfCY60W9QgkzBvt9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_230729_980244_D61544E6 
X-CRM114-Status: UNSURE (   5.81  )
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
branch HEAD: 210654018454e73aaa0d5b3be3d6e42c6368ae8e  ath11k: fix driver initialization failure with WoW unsupported hw

elapsed time: 1045m

configs tested: 105
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                     taishan_defconfig
powerpc                         wii_defconfig
sh                            titan_defconfig
sparc                       sparc64_defconfig
m68k                       m5275evb_defconfig
arm                            zeus_defconfig
arc                     nsimosci_hs_defconfig
arm                            xcep_defconfig
arm                         cm_x300_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7203_defconfig
arc                        nsimosci_defconfig
alpha                               defconfig
powerpc                     mpc83xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220331
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220331
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                     cu1830-neo_defconfig
powerpc                     mpc5200_defconfig
arm                       mainstone_defconfig
powerpc                      ppc44x_defconfig
arm                           spitz_defconfig
powerpc                      ppc64e_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220331
hexagon              randconfig-r041-20220331
riscv                randconfig-r042-20220331
s390                 randconfig-r044-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
