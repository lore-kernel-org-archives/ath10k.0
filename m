Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7D5C41513
	for <ath10k@archiver.kernel.org>; Fri, 21 Jul 2023 23:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kGKmsd5S8dyk07S0D65SHipgV9RPyYECWl7onqhUpvc=; b=p9AzaqH2MUOFfQ
	5k+AcTjZ2F4dccPkPWQMl5U2/OXPfJ61Z2RBY04Ta3zAqp8rJskCe3sGiO43hm6T3FxTuGH1KKoR+
	PBt6Xb/l7FJvfR3fceZCVZwYUrw5lX/PndoDiNJDevDOoO4iu3de/Q87YKkj88HFsbKUwjhiz/vRG
	NeHCyX8SAq2XQuuS3l75i4pXRxiOUlDmUrd2ZMfqbcNAEPexw9u1tenXglnt/w23t6K1e31HaOjIZ
	tZUrTlG+3fE/3WsAGEdio4r++fuk2Qu6DE2lm5BjiuPyupS20Ijjwg6NIIyaBO8qr+Dwt3B/jAq2L
	/Iu+yvuOvhRBuGm0/2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN015-00FOn9-2C;
	Fri, 21 Jul 2023 23:58:35 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN012-00FOmE-2h
	for ath10k@lists.infradead.org;
	Fri, 21 Jul 2023 23:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689983912; x=1721519912;
  h=date:from:to:cc:subject:message-id;
  bh=Q6VMYrEDfv0gVU2Fsa7YmGL3Xhfg1RlT9ADB2E6VX2g=;
  b=bnnH7kcLvXc8ln3jYOM6JcAzAZMJMykRRm6AZZOo4omety4gIfS7LPkM
   heeX8zrhwFw/HMfLGT9bpc2FnYr1Sd20jOJztgoPw+3sV83cL8N6C3py6
   Nn1BA5kkQ+1XAi6qXRG0oZHa6C0C+Wje3CdYiwI997bZvsyVp1xB6OWdj
   wEO9zBHdv4sVzQ+zVVmhODCd8dwRegOyDaz9QI9zvcJa7CsUbVt6DbRue
   YgThWs9jQzs1z1DIMscfOvZ+LWLyW20fnyM5ICgx3cp99P62ycOwnJNgC
   jke73agPWIK5ujJMTVb6UMZnr32e/rGfd7vLCsatfIX/C4o53buNybchr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="367173284"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="367173284"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 16:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838729328"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="838729328"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 16:58:22 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN00q-0007mO-26;
	Fri, 21 Jul 2023 23:58:20 +0000
Date: Sat, 22 Jul 2023 07:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 db85b83a7ccf0c703af320292accbdf12d917d42
Message-ID: <202307220751.MJj3GyKF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_165832_888320_8951A4E3 
X-CRM114-Status: UNSURE (   6.06  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: db85b83a7ccf0c703af320292accbdf12d917d42  wifi: ath6kl: Remove error checking for debugfs_create_dir()

elapsed time: 720m

configs tested: 141
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230720   gcc  
alpha                randconfig-r023-20230720   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230720   gcc  
arc                  randconfig-r015-20230721   gcc  
arc                  randconfig-r022-20230720   gcc  
arc                  randconfig-r043-20230720   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          moxart_defconfig   clang
arm                         mv78xx0_defconfig   clang
arm                  randconfig-r046-20230720   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230720   gcc  
arm64                randconfig-r026-20230720   clang
arm64                randconfig-r032-20230720   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230720   gcc  
csky                 randconfig-r033-20230720   gcc  
csky                 randconfig-r035-20230720   gcc  
hexagon              randconfig-r041-20230720   clang
hexagon              randconfig-r045-20230720   clang
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230720   gcc  
i386         buildonly-randconfig-r004-20230721   clang
i386         buildonly-randconfig-r005-20230720   gcc  
i386         buildonly-randconfig-r005-20230721   clang
i386         buildonly-randconfig-r006-20230720   gcc  
i386         buildonly-randconfig-r006-20230721   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230720   gcc  
i386                 randconfig-i002-20230720   gcc  
i386                 randconfig-i003-20230720   gcc  
i386                 randconfig-i004-20230720   gcc  
i386                 randconfig-i005-20230720   gcc  
i386                 randconfig-i006-20230720   gcc  
i386                 randconfig-i011-20230720   clang
i386                 randconfig-i011-20230721   gcc  
i386                 randconfig-i012-20230720   clang
i386                 randconfig-i012-20230721   gcc  
i386                 randconfig-i013-20230720   clang
i386                 randconfig-i013-20230721   gcc  
i386                 randconfig-i014-20230720   clang
i386                 randconfig-i014-20230721   gcc  
i386                 randconfig-i015-20230720   clang
i386                 randconfig-i015-20230721   gcc  
i386                 randconfig-i016-20230720   clang
i386                 randconfig-i016-20230721   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230720   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230720   gcc  
m68k                           virt_defconfig   gcc  
microblaze           randconfig-r005-20230720   gcc  
microblaze           randconfig-r013-20230721   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                 randconfig-r024-20230720   gcc  
mips                 randconfig-r025-20230720   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230721   gcc  
openrisc             randconfig-r024-20230720   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230720   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230720   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230720   clang
sh                               allmodconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                   randconfig-r001-20230720   gcc  
sh                   randconfig-r011-20230720   gcc  
sh                   randconfig-r021-20230720   gcc  
sh                   randconfig-r026-20230720   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230721   gcc  
sparc64              randconfig-r001-20230720   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r021-20230720   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230720   gcc  
x86_64       buildonly-randconfig-r001-20230721   clang
x86_64       buildonly-randconfig-r002-20230720   gcc  
x86_64       buildonly-randconfig-r002-20230721   clang
x86_64       buildonly-randconfig-r003-20230720   gcc  
x86_64       buildonly-randconfig-r003-20230721   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r013-20230720   clang
x86_64               randconfig-x001-20230720   clang
x86_64               randconfig-x002-20230720   clang
x86_64               randconfig-x003-20230720   clang
x86_64               randconfig-x004-20230720   clang
x86_64               randconfig-x005-20230720   clang
x86_64               randconfig-x006-20230720   clang
x86_64               randconfig-x011-20230720   gcc  
x86_64               randconfig-x012-20230720   gcc  
x86_64               randconfig-x013-20230720   gcc  
x86_64               randconfig-x014-20230720   gcc  
x86_64               randconfig-x015-20230720   gcc  
x86_64               randconfig-x016-20230720   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230720   gcc  
xtensa               randconfig-r011-20230721   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
