Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E2BEB64D9
	for <ath10k@archiver.kernel.org>; Fri, 16 Jun 2023 00:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YGOtA38/wKJxJpvcArhdvK2g2AM0SSLHh1+1rvVKQ2U=; b=t9oUFkfF3cYyPj
	AwJh4GkjL/S5u2dctHaE0BgX4eEW/JhmDBHYnW/jNHKBJEbDPuq3/rnDkIl/s7KqDUcZCJU2H85ls
	gJ+F6vQNQQCujUCU+IUs9wE4QMCaDnZ0gohjCdjd+ZlsB7epiE+YZTFGkVXdrZtUBAjwtNiNneBw5
	v8YPRb8uoAdMI6uR/RgvQeZHvYKPoKxTXSd+nIic1zde++Ege2f4nHSNv66Qugm0mJy7yaYHOsXfe
	+YU/SsQI9bhy3kwVTrnUjTP0rY+njixXQvmIcJl1h7gFceQCy2It5/DXzl0jcWcFlHAHLo0n4oN4Z
	q4fxemKQVQNhQmWUgOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9x9K-00GPaO-1y;
	Fri, 16 Jun 2023 00:17:10 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9x9G-00GPYa-37
	for ath10k@lists.infradead.org;
	Fri, 16 Jun 2023 00:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686874626; x=1718410626;
  h=date:from:to:cc:subject:message-id;
  bh=EWlG7eJyLjFBw7yCb/+HhJIOZr/OifwOqscBUCBVH/E=;
  b=RupWxsTJS/XMo6LNZuzXGTZ1Cq6C/g9nBTKUTGawOfaoSt/4o8a1VLL4
   V+15XzdQ7bPA/8qwu9vpR3HLJI6VnE2hg33p4g4mtDOiLQWY161FaU2VM
   QvRntJxw0ChATVC7wTUhuKECTBM67X6DxzJR6eemRMAwJI6YBt7I9IOIl
   8UzRTXnSA/4ZQbYFbZRycfkL9zAWtZpbYrsYueZxrcOTvxrJUoh4ey/rN
   Z9CU1IdjqYweWS2BiBzAkAhlom50rjxug8aAP2K6dAVVo8b2qqzaLVx6u
   X4CEl7gR7AlmbvnX1OjJBZi8qYT8v++AyuNSuysQHLJoc3S0Aa9ENeik+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387689509"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="387689509"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 17:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742437926"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="742437926"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jun 2023 17:16:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9x97-0000Yh-2U;
	Fri, 16 Jun 2023 00:16:57 +0000
Date: Fri, 16 Jun 2023 08:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 204f2ef2f76d3350dacd3c05c3ea2ffeafef0401
Message-ID: <202306160849.JvBiWWtd-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_171707_021327_F6B543EE 
X-CRM114-Status: UNSURE (   5.40  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 204f2ef2f76d3350dacd3c05c3ea2ffeafef0401  Merge branch 'ath-next' into ath-qca

elapsed time: 732m

configs tested: 120
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230615   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r043-20230615   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230615   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r046-20230615   gcc  
arm                          sp7021_defconfig   clang
arm                       spear13xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r002-20230615   gcc  
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r005-20230615   clang
hexagon              randconfig-r035-20230615   clang
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
i386                 randconfig-r024-20230615   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230615   gcc  
loongarch            randconfig-r011-20230615   gcc  
loongarch            randconfig-r016-20230615   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r033-20230615   gcc  
m68k                           virt_defconfig   gcc  
microblaze           randconfig-r001-20230615   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
mips                           mtx1_defconfig   clang
nios2                               defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r003-20230615   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r006-20230615   gcc  
parisc               randconfig-r025-20230615   gcc  
parisc               randconfig-r036-20230615   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230615   clang
powerpc                       eiger_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                 mpc8540_ads_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r014-20230615   clang
powerpc                     stx_gp3_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230615   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230615   clang
s390                 randconfig-r021-20230615   clang
s390                 randconfig-r026-20230615   clang
s390                 randconfig-r044-20230615   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230615   gcc  
sh                   randconfig-r031-20230615   gcc  
sh                           sh2007_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r012-20230615   gcc  
sparc64              randconfig-r032-20230615   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r006-20230615   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230615   gcc  
x86_64               randconfig-a002-20230615   gcc  
x86_64               randconfig-a003-20230615   gcc  
x86_64               randconfig-a004-20230615   gcc  
x86_64               randconfig-a005-20230615   gcc  
x86_64               randconfig-a006-20230615   gcc  
x86_64               randconfig-a011-20230615   clang
x86_64               randconfig-a012-20230615   clang
x86_64               randconfig-a013-20230615   clang
x86_64               randconfig-a014-20230615   clang
x86_64               randconfig-a015-20230615   clang
x86_64               randconfig-a016-20230615   clang
x86_64               randconfig-r004-20230615   gcc  
x86_64               randconfig-r022-20230615   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230615   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
