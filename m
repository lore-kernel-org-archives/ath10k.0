Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ED8C6FD1F
	for <ath10k@archiver.kernel.org>; Wed, 22 Mar 2023 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CF5RHzVxAWRMZwOkSh7Sq0rdaJphg2ZNAVgb7++dWwc=; b=0cAy/0a6NLivMX
	snEEDOt5nbIwLGY/eXMe/Tg+93LGG7XXBzNdA4AOAukhBRYwmyQSZhsXRxZ1Tkzd427otPfLjRQ+y
	rVpq4VgULqnKHCW2hs+gvjAaQJEVE05WLPhYHztKEJgGkC7Z/pwBmykyKdzacPAP94RX+3fBfvRbR
	Kd1SA84Fn1O0+MuqjDFIKkgDJ7jmPOeHczhA5CbPGn4K77G8FbiLU+UlRvb5g0yb2zJK7Pm8hfXHz
	hD7mpLx1+P7VuoPoXonqxkF0FWoIGds44L+q3qYP3FG4cP6EAiSRuLs0j9D6GDhfZb8ZUil+egiiB
	CQNBfwHSiZnnwmcEYFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf6vC-0000ZZ-1O;
	Wed, 22 Mar 2023 22:27:06 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf6v8-0000Yx-0l
	for ath10k@lists.infradead.org;
	Wed, 22 Mar 2023 22:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679524022; x=1711060022;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MzosBrdoa1lAvx4TYGlm68JdyrQA8sh4hHL2llV1YFI=;
  b=jOmgskpYFmTzYbjyXlNZltRRxPmeT9MfFPdBw+czufCr2IZtJhnw+grZ
   gLWVJm58RPz6OEGkNOqFzzgqGTGcpVRYoxD6rIH9Ig2A8NXEM2N0UrP+0
   +h7pg1IAPfjHcGHIXq2jOWNTwEwCLpnLnVMhLihZFUwZMraNhy59pieyh
   8uhydaNUYftY7Q3o7vckMcCQEvrptHhhHs17P9B64WjRD+99GB43lEpK7
   /BwzinW0Qq9v5vjRCXivOyYlszmuuaWNupl0kM2aOFkneST3bX4dlPHKg
   klKO98zZy01VsaXjDlR7C5r+f82beT+kl5PoE7tuFXo9wCChk+wr7/FHz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339383610"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="339383610"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 15:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="792745546"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="792745546"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2023 15:26:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf6v3-000Dic-0T;
	Wed, 22 Mar 2023 22:26:57 +0000
Date: Thu, 23 Mar 2023 06:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 584e56beffc20c9f6f3dd624137b217558b07cfa
Message-ID: <641b809f.x7xEyNX5f7qOxR4i%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_152702_339344_B7BAB4ED 
X-CRM114-Status: UNSURE (   6.18  )
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
branch HEAD: 584e56beffc20c9f6f3dd624137b217558b07cfa  Add localversion-wireless-testing-ath

elapsed time: 732m

configs tested: 98
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230322   gcc  
arc                  randconfig-r023-20230322   gcc  
arc                  randconfig-r024-20230322   gcc  
arc                  randconfig-r035-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230322   clang
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230322   clang
csky                                defconfig   gcc  
hexagon              randconfig-r003-20230322   clang
hexagon              randconfig-r015-20230322   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
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
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230322   gcc  
microblaze           randconfig-r036-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230322   gcc  
mips                 randconfig-r005-20230322   gcc  
nios2        buildonly-randconfig-r004-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r034-20230322   gcc  
openrisc     buildonly-randconfig-r002-20230322   gcc  
openrisc             randconfig-r012-20230322   gcc  
openrisc             randconfig-r026-20230322   gcc  
parisc       buildonly-randconfig-r005-20230322   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230322   clang
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230322   gcc  
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r033-20230322   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230322   gcc  
xtensa       buildonly-randconfig-r006-20230322   gcc  
xtensa               randconfig-r032-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
