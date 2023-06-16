Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C00EB64DC
	for <ath10k@archiver.kernel.org>; Fri, 16 Jun 2023 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8nT4Mw2cCvhoyxNMe02RVBqFXI4fuXewKJB6Lm6jfe8=; b=ehZivnuD+dhv44
	UnU5XF8rGM/ce+cBmzNdEXVZKDxtSD9ZTF6uZM+EV7szE/5u/j6eh33c4YhoB5MZT/3WL1weYHEOk
	hTzWpDUCGclQQAlxhCZHt6TND1k3qQ3lVzAIwCbp1DLMFFuJpCBOJPdcERMBASZfxJfKJh+g+N0wK
	Mtj4djsMXqwEuDDq2U+oS7I0mTMkh75sbNlxga9zBIxgH2DaREQ5Njk0C2Ju4C6p+DAajVYBYv9aK
	Rlbq73lcT9dn+LPLPIY4iiD7jGLIWuG49bFd+lXWAUcb87BLXIdnV3tvk779nIPHcvpLGy6B6LFGC
	SmO2ALeUaQGGQS/ZlXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9x9I-00GPa0-3A;
	Fri, 16 Jun 2023 00:17:08 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9x9F-00GPYa-0o
	for ath10k@lists.infradead.org;
	Fri, 16 Jun 2023 00:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686874625; x=1718410625;
  h=date:from:to:cc:subject:message-id;
  bh=U0VVJNF2f8Ek/P8LfFq5+516m8flPhbslg85G+aiK+Q=;
  b=ITYDhoZ+1o6Vp7wKqFx/5RhhZN+CpzDxrq1J/yFd16A/ljqf5zSg/kIN
   wUNeppwIUdWMzUVkGUZVHulTVROoRYEucER8g5n+XHYdgti9HeI+kYmi9
   GJAYezm1t7N2czz73GSs4AYFouW135HeMq2OzVl1ApY+8BJ7NGiuXWMoE
   yy/krzzB6xKqlmZt8r7Ew/i5QzlrN/1ehNXe4yvcfg+VLkw2ZFz7j0bkv
   9eUy7JpiiYwp2RnoxXVUEbzU1XiQDloTV2gQULbIuSvCtmZUG2z34E6SZ
   +rWEXpHBcA9vVx6yppreio/qnvnSrfqj4Qcp7ioiHZLekbPDIZ/dazi76
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387689507"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="387689507"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 17:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742437925"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="742437925"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jun 2023 17:16:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9x97-0000Yk-2a;
	Fri, 16 Jun 2023 00:16:57 +0000
Date: Fri, 16 Jun 2023 08:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 16e0077e14a73866e9b0f4a6bf4ad3d4a5cb0f2a
Message-ID: <202306160840.vqZ0Vb3l-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_171705_309408_BC9580C1 
X-CRM114-Status: UNSURE (   5.83  )
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
branch HEAD: 16e0077e14a73866e9b0f4a6bf4ad3d4a5cb0f2a  wifi: ath11k: Add missing check for ioremap

elapsed time: 732m

configs tested: 117
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230615   gcc  
arc                              alldefconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230615   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                  randconfig-r022-20230615   gcc  
arm                  randconfig-r046-20230615   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r003-20230614   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230614   gcc  
csky                 randconfig-r034-20230614   gcc  
hexagon              randconfig-r036-20230614   clang
hexagon              randconfig-r041-20230615   clang
hexagon              randconfig-r045-20230615   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230614   clang
i386                 randconfig-i002-20230614   clang
i386                 randconfig-i003-20230614   clang
i386                 randconfig-i004-20230614   clang
i386                 randconfig-i005-20230614   clang
i386                 randconfig-i006-20230614   clang
i386                 randconfig-i011-20230615   clang
i386                 randconfig-i012-20230615   clang
i386                 randconfig-i013-20230615   clang
i386                 randconfig-i014-20230615   clang
i386                 randconfig-i015-20230615   clang
i386                 randconfig-i016-20230615   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230614   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r004-20230615   gcc  
loongarch            randconfig-r014-20230614   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230615   gcc  
m68k                 randconfig-r026-20230615   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230614   gcc  
microblaze           randconfig-r031-20230614   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                 randconfig-r016-20230614   clang
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230615   gcc  
openrisc     buildonly-randconfig-r001-20230614   gcc  
openrisc     buildonly-randconfig-r006-20230614   gcc  
openrisc             randconfig-r021-20230615   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      makalu_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230614   gcc  
riscv                randconfig-r025-20230615   clang
riscv                randconfig-r042-20230615   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230614   gcc  
s390                 randconfig-r023-20230615   clang
s390                 randconfig-r032-20230614   clang
s390                 randconfig-r044-20230615   clang
sh                               allmodconfig   gcc  
sh                               j2_defconfig   gcc  
sh                   randconfig-r035-20230614   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r033-20230614   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64              randconfig-r002-20230615   gcc  
sparc64              randconfig-r006-20230615   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230615   gcc  
x86_64               randconfig-a002-20230615   gcc  
x86_64               randconfig-a003-20230615   gcc  
x86_64               randconfig-a004-20230615   gcc  
x86_64               randconfig-a005-20230615   gcc  
x86_64               randconfig-a006-20230615   gcc  
x86_64               randconfig-a011-20230614   gcc  
x86_64               randconfig-a012-20230614   gcc  
x86_64               randconfig-a013-20230614   gcc  
x86_64               randconfig-a014-20230614   gcc  
x86_64               randconfig-a015-20230614   gcc  
x86_64               randconfig-a016-20230614   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230614   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
