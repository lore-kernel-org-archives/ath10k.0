Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F013C61DA4
	for <ath10k@archiver.kernel.org>; Thu, 16 Mar 2023 02:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VMkLXM28Q1SsxC+xvSImEbTLHQY3Qoya77o+XGAb3oQ=; b=rfkal1/K0PP1zX
	0dn64ec/NjffPU+5KPctFj0ltvVFT4Y96QdN16zKdbStrdeKN2Mk9op9w4hLEEFQaGqVX9vRZ4PKt
	H4o77viqiU4DvQ3hQhSpqaktEG/rV2m7O2FKgB+MP28qBSsZCFIBykM6JaPG3+K+L5MzJmatHTdPI
	TLThSxVwPIWbNPuVKKHCk2+tiuV5QHesDRYzPnAO9vd2bhq1y5/H7Y0mfFY97MsqVcHd5cddKQ1Jp
	/9pTiIQFP/yDGDrnx2/QU+a2i8+4bmo9UMD8ndr4bDrfZqk5EIgUHd/xokgHmAQHvEodAZ8PKgZWV
	81BopnfqFcr9dm56X6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdFl-00EyHr-06;
	Thu, 16 Mar 2023 02:22:05 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdFg-00EyH4-0D
	for ath10k@lists.infradead.org;
	Thu, 16 Mar 2023 02:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678933320; x=1710469320;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EqeU9sKbuJyJbjaGbX1AGkACg2KoM41Kn568r3PnmR8=;
  b=PBW6ETqCeFmLXoT6LqdOVbQnVE5rMP1TOrDvFpdXdLSSvs+lS2V9KREu
   x5ZZTXRC5OZI/R0rfhXNrxX2tKeQ48ebNXEtvqg+ZLxdGUQ6W6o7Ijy6V
   MW64iap2i2UL2G2wXcftRSXH6jsoMaJMPpfPEBm9ffaAT2o+NTUeYqjDp
   KFPd7saBLlRDwDjcClS3RbiGve3C3K8Ixr8dNg7fMx7bwg9AK4oTOKHTP
   kEznOJTULvRdnNaMm/oEzYu9et8qWi9DNiJRRcGknsq0kQ+W4Z1nKpWFQ
   V3IKkdMPtWe7ADQn3f7srLN0/O+SjUE9kuzEJy8jXtmDKETXdriLnH3Jp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="340234315"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="340234315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 19:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629685578"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="629685578"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 19:21:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcdEz-0008FN-1v;
	Thu, 16 Mar 2023 02:21:17 +0000
Date: Thu, 16 Mar 2023 10:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 5c783f7cdcbee5a036bb42e3cb4b94c576e04679
Message-ID: <64127ce3.Z0m2pIey4JEFI2Ry%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_192200_145481_470DFA63 
X-CRM114-Status: UNSURE (   5.00  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 5c783f7cdcbee5a036bb42e3cb4b94c576e04679  Merge branch 'ath-next' into ath-qca

elapsed time: 791m

configs tested: 131
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230312   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230313   gcc  
arc                  randconfig-r006-20230313   gcc  
arc                  randconfig-r012-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230313   clang
arm                  randconfig-r016-20230312   clang
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230312   clang
arm64                randconfig-r034-20230312   clang
csky                                defconfig   gcc  
csky                 randconfig-r031-20230313   gcc  
hexagon              randconfig-r001-20230313   clang
hexagon              randconfig-r015-20230312   clang
hexagon              randconfig-r023-20230313   clang
hexagon              randconfig-r035-20230313   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230312   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230312   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230313   gcc  
m68k                 randconfig-r032-20230313   gcc  
microblaze           randconfig-r031-20230312   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r022-20230313   gcc  
mips                 randconfig-r023-20230312   clang
mips                 randconfig-r025-20230312   clang
mips                 randconfig-r034-20230313   clang
nios2        buildonly-randconfig-r003-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230313   gcc  
nios2                randconfig-r013-20230312   gcc  
nios2                randconfig-r014-20230312   gcc  
nios2                randconfig-r025-20230313   gcc  
nios2                randconfig-r033-20230312   gcc  
openrisc     buildonly-randconfig-r002-20230313   gcc  
openrisc     buildonly-randconfig-r004-20230312   gcc  
openrisc             randconfig-r026-20230312   gcc  
parisc       buildonly-randconfig-r005-20230313   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230313   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230312   clang
riscv                randconfig-r015-20230313   clang
riscv                randconfig-r022-20230312   gcc  
riscv                randconfig-r026-20230313   clang
riscv                randconfig-r033-20230313   gcc  
riscv                randconfig-r036-20230313   gcc  
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r006-20230313   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r016-20230313   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230312   gcc  
sparc                randconfig-r013-20230313   gcc  
sparc                randconfig-r024-20230312   gcc  
sparc64      buildonly-randconfig-r002-20230312   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64               randconfig-a016-20230313   clang
x86_64               randconfig-r024-20230313   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r003-20230313   gcc  
xtensa               randconfig-r005-20230313   gcc  
xtensa               randconfig-r012-20230313   gcc  
xtensa               randconfig-r021-20230313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
