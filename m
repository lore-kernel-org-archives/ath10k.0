Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E7FEB64DC
	for <ath10k@archiver.kernel.org>; Tue, 27 Jun 2023 01:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tpwMo8GN8AGNVECsIOnvztiNJ0C3+/itB6CSC2Kpx0I=; b=wA/UvmUd2+AJo9
	snyHjEBCae0IgvUVeB+K+5bHbeQqsoD9Osfg3mXDJKfI+Tw9NUJER69QxRqASrJDl7OztrG5D0lpj
	i8dVdVeqYI1A3AjvLNKl3ismoC+5ORQ/fkTWjBEiwhdQqSLr1+6TT7B1LI4fSUEgmrKSuamdS9uaG
	t6NRp3ValFIlr9joixHPopWNcx9W3e4AVCmWJomL3iqPmSOCYSMaF//et8aEZmtL59+kwFK/eCZck
	SAB5yRYbmg0/Bw4qGfyUCwlgM8KSmlsm5huUOumFsm3JYyd3h4PLw81oTytczXK0ihxi+Q36Yk1CI
	gBY/PgprUm/wsx9eikrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxH5-00BLMm-0w;
	Tue, 27 Jun 2023 01:13:43 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxH2-00BLLc-2G
	for ath10k@lists.infradead.org;
	Tue, 27 Jun 2023 01:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828420; x=1719364420;
  h=date:from:to:cc:subject:message-id;
  bh=TapBWPTLNrbgSNCzdpQfPyPlDd4hR7fH4cshfQAXirc=;
  b=Bm6D5DF7DJaC2hTqTR/2MAte0xljeCtQSbTQB4rPU5jW6a3Slb95HG9z
   alFiBNAnx1dSKNNhGHWCDtxTGY8VTu+WJGCJZG+wMzlRAMaq0e6EnLsz2
   IareeQnUcjMBe6ZrE9TAxRw/1e+J1pA10hPTGOW6J39LkbycB7WB6Scbi
   EYfmP33jpRcKUqai3EHW+CxGFfMyGlftm9TR4ZPUhXiVgg3QeHdeguM1y
   ATiGSNpL86j4jVXIpiYX/24rg4Agc37LFb4bktZhhIOk5PyqNFJLwHTJ2
   V7lE5q4WDaHRjTQpxAvottv2n/jJM0BrPTquvWWPlgpWjMIFmh+3jwUT9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="360301214"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="360301214"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890481456"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="890481456"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Jun 2023 18:13:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDxGx-000BDb-1e;
	Tue, 27 Jun 2023 01:13:35 +0000
Date: Tue, 27 Jun 2023 09:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 12ec37be3faf9df7831ce210947f111b3417baf3
Message-ID: <202306270910.0dRihCZq-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_181340_749639_B36E5C9D 
X-CRM114-Status: UNSURE (   4.66  )
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
branch HEAD: 12ec37be3faf9df7831ce210947f111b3417baf3  wifi: ath10k: improve structure padding

elapsed time: 7445m

configs tested: 90
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230622   gcc  
arm                  randconfig-r006-20230622   gcc  
arm                  randconfig-r036-20230621   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230621   clang
csky                                defconfig   gcc  
hexagon              randconfig-r005-20230622   clang
hexagon              randconfig-r031-20230621   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230621   gcc  
i386         buildonly-randconfig-r005-20230621   gcc  
i386         buildonly-randconfig-r006-20230621   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230621   gcc  
i386                 randconfig-i002-20230621   gcc  
i386                 randconfig-i003-20230621   gcc  
i386                 randconfig-i004-20230621   gcc  
i386                 randconfig-i005-20230621   gcc  
i386                 randconfig-i006-20230621   gcc  
i386                 randconfig-i011-20230621   clang
i386                 randconfig-i012-20230621   clang
i386                 randconfig-i013-20230621   clang
i386                 randconfig-i014-20230621   clang
i386                 randconfig-i015-20230621   clang
i386                 randconfig-i016-20230621   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r033-20230621   gcc  
microblaze           randconfig-r003-20230622   gcc  
microblaze           randconfig-r011-20230621   gcc  
microblaze           randconfig-r035-20230621   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230621   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230622   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc              randconfig-r012-20230621   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r034-20230621   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230622   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230621   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230621   gcc  
x86_64       buildonly-randconfig-r002-20230621   gcc  
x86_64       buildonly-randconfig-r003-20230621   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r032-20230621   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
