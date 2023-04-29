Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE0C77B60
	for <ath10k@archiver.kernel.org>; Sat, 29 Apr 2023 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GK4nIv1g+nVbkcctETAsvFKA3tgWbQOAwJJo+EsOnAk=; b=xedB3i+7cbeWtl
	Nbt01iNv3fgTVivCCfLiFXB0rofV1hq2B6r3FUkaB/v1lqMmcaHTUXKmc7zwMdC/YRfKtVP3jVm1N
	rknd3SktfeIkprHev1H+kcTd6OOPqbQDrUKEHjDGrONEKejw7XMLE7PKQC1d5+bsRkJVpmfZVcklc
	xlJCQ6lLPdDjV5s8HUZHqQch2PusnVX6i+fi3U0IRgyhIwQQTg3A33mp5lAUPm1X4rCGbt9C1hgIn
	HNzs5hD30F8U6XtVjKYehE1TbEj8qCXhEURZrB0xowITzAUSKyEPXmZ4Ata45Mt9BqI+Vfe/PAmds
	2tnzRQ4WpyiAUXpk3xDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psgea-00CSFv-1t;
	Sat, 29 Apr 2023 09:14:04 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psgeY-00CSFW-0F
	for ath10k@lists.infradead.org;
	Sat, 29 Apr 2023 09:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682759642; x=1714295642;
  h=date:from:to:cc:subject:message-id;
  bh=yyL6i2dAgS3OaVHuIA4YEANlKzc0oe9WXwp9eAQ2qIk=;
  b=K20UNTZ0EJNNthb1zPi9tTjYjDTgQTG1Rqyi1HkfMOeweBMD8a3uyLgd
   /JWe0V31mWq1d0Sv1wdxXHhm6mcHvxVDHwAY0GwL8JxoqtJXWMNtRXHw2
   zfoXFb1fqpBOJtcnypjGQi4JnmYismf8aKIcynlBeOTI17DkMbZMcssWs
   pbyexeaA8S84qq6Oc0M15+z4PZsAkpRYEXZSSSKT0KxucaMX02Ze0ez4j
   mg0fQBqQRvcUpWPvgM+1iPhQUEG09BclSNQhzeTIK5gIQD3MmuODnq/SP
   FjJc3YuOGskOW+n0eBDIdSr2FT3F4T072JWEH4NaEpZ6h3lm3Lyww+7Eu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="345380601"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="345380601"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 02:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="784587222"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="784587222"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Apr 2023 02:13:58 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psgeT-00011M-2q;
	Sat, 29 Apr 2023 09:13:57 +0000
Date: Sat, 29 Apr 2023 17:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 0a00db612b6df1fad80485e3642529d1f28ea084
Message-ID: <20230429091348.C3rFH%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_021402_163492_F4967330 
X-CRM114-Status: UNSURE (   6.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 0a00db612b6df1fad80485e3642529d1f28ea084  Add localversion-wireless-testing-ath

elapsed time: 948m

configs tested: 96
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230428   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r022-20230428   clang
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230428   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230428   gcc  
csky                 randconfig-r015-20230428   gcc  
hexagon              randconfig-r002-20230428   clang
hexagon              randconfig-r041-20230428   clang
hexagon              randconfig-r045-20230428   clang
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
loongarch            randconfig-r012-20230428   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230428   gcc  
microblaze           randconfig-r036-20230428   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r005-20230428   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r025-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r023-20230428   gcc  
parisc               randconfig-r034-20230428   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230428   gcc  
riscv                randconfig-r014-20230428   gcc  
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230428   gcc  
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230428   gcc  
sparc64      buildonly-randconfig-r001-20230428   gcc  
sparc64      buildonly-randconfig-r003-20230428   gcc  
sparc64              randconfig-r001-20230428   gcc  
sparc64              randconfig-r004-20230428   gcc  
sparc64              randconfig-r035-20230428   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r016-20230428   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
