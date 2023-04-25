Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEBAC6FD18
	for <ath10k@archiver.kernel.org>; Tue, 25 Apr 2023 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DVG41pC8/LqTFirhDPLCvv8RDgEwC0AZBi4cOunEO8Q=; b=Z6DbMY5//kKY30
	jId7K07+a97nc8F2SCwtDxV8FSOI/eyZSeomDFhIbFVnc/uMoKeyN0jTg7mtOpsZLdXIMgZ3lY+NN
	LT48q48CLu3kh0GqSkYj2269hRmTC+Y23YHDfw/VWGg1DSfX3sRzY3K/nOckyj0Mx2lUmX94bWQkj
	qia9oALhshcHIXhVrv/uYbS3lpW8cucZoNdJhHvg6CLxG1kMpM/b/zSBVWcaIb/zdM9Ja1u0pnGLv
	ND2ecutGwQhac/ZZb4EIud7Zxu8ozkfSH0YrejH55GFKIowqtPBkYhhZaFeL5b7PBUqyslvuA4nmh
	zE5mfkPlfdugRi8eHJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prCJG-000ItB-2z;
	Tue, 25 Apr 2023 06:37:54 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prCJD-000IqC-0J
	for ath10k@lists.infradead.org;
	Tue, 25 Apr 2023 06:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682404671; x=1713940671;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QEOVxTGDO5QISUWRtBzDo26zdniCgO89Ak/n6DnQ0Tw=;
  b=CvJM+/7tU3hjJzgYsvZFe7G2qjNp62Pn4EbxpQo2N4ga3SEFAWaI418y
   LrYa5a7ULHwTbhSz1UwwFDSgrusHoM/AGEKy+XsKLQu8oxwrkm2cd2Ewg
   1vl1ompZ/uNMf4MtERudgrcXhWyDmMiB7dJlaXX2Jo4gXDBWfBb7yULDg
   HLPA8siXFN3kldi/ZPE/aldoHpxjrOcs76Ve1t7QjlioEsFzJUkIqf49E
   idhj+XRmQSSR9P07ra8Ce08qkqFQuYxU5E/6r6LDkI+2rsZKjV4UUI5My
   W6HtR9vEDrv+9dYzXKpLl0N7dpKs8OEkP94bXc6Toc81e/wpM2oBKVOi8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432936652"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="432936652"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 23:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939647154"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="939647154"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Apr 2023 23:37:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prCIi-000j6I-2B;
	Tue, 25 Apr 2023 06:37:20 +0000
Date: Tue, 25 Apr 2023 14:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 5a40835ab580abd6f458650298a5f21fa4fa489b
Message-ID: <6447751a.ufgDu4lnQ6UEoqA/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_233751_149343_5AF15AF4 
X-CRM114-Status: UNSURE (   4.50  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 5a40835ab580abd6f458650298a5f21fa4fa489b  Merge branch 'pending' into master-pending

elapsed time: 727m

configs tested: 128
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230423   gcc  
alpha                randconfig-r013-20230423   gcc  
alpha                randconfig-r031-20230423   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230423   gcc  
arc                  randconfig-r023-20230424   gcc  
arc                  randconfig-r032-20230423   gcc  
arc                  randconfig-r033-20230423   gcc  
arc                  randconfig-r043-20230423   gcc  
arc                  randconfig-r043-20230424   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230423   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230424   gcc  
arm                  randconfig-r012-20230423   gcc  
arm                  randconfig-r034-20230424   gcc  
arm                  randconfig-r046-20230423   gcc  
arm                  randconfig-r046-20230424   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230423   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230424   clang
csky         buildonly-randconfig-r004-20230424   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230423   gcc  
csky                 randconfig-r032-20230424   gcc  
hexagon      buildonly-randconfig-r002-20230424   clang
hexagon              randconfig-r041-20230423   clang
hexagon              randconfig-r041-20230424   clang
hexagon              randconfig-r045-20230423   clang
hexagon              randconfig-r045-20230424   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230423   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230424   gcc  
loongarch            randconfig-r035-20230423   gcc  
loongarch            randconfig-r035-20230424   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230424   gcc  
microblaze   buildonly-randconfig-r006-20230424   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230423   clang
mips                 randconfig-r011-20230423   gcc  
mips                 randconfig-r015-20230424   clang
mips                 randconfig-r036-20230424   gcc  
nios2        buildonly-randconfig-r004-20230423   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r031-20230424   gcc  
nios2                randconfig-r033-20230424   gcc  
nios2                randconfig-r034-20230423   gcc  
openrisc             randconfig-r006-20230424   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230423   gcc  
parisc               randconfig-r023-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230423   clang
riscv                randconfig-r042-20230424   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230424   clang
s390                 randconfig-r014-20230424   gcc  
s390                 randconfig-r022-20230424   gcc  
s390                 randconfig-r025-20230423   clang
s390                 randconfig-r044-20230423   clang
s390                 randconfig-r044-20230424   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230424   gcc  
sparc        buildonly-randconfig-r003-20230424   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r001-20230424   gcc  
sparc64              randconfig-r014-20230423   gcc  
sparc64              randconfig-r016-20230423   gcc  
sparc64              randconfig-r021-20230424   gcc  
sparc64              randconfig-r036-20230423   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230424   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230424   clang
x86_64               randconfig-a002-20230424   clang
x86_64               randconfig-a003-20230424   clang
x86_64               randconfig-a004-20230424   clang
x86_64               randconfig-a005-20230424   clang
x86_64               randconfig-a006-20230424   clang
x86_64               randconfig-a011-20230424   gcc  
x86_64               randconfig-a012-20230424   gcc  
x86_64               randconfig-a013-20230424   gcc  
x86_64               randconfig-a014-20230424   gcc  
x86_64               randconfig-a015-20230424   gcc  
x86_64               randconfig-a016-20230424   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r024-20230423   gcc  
xtensa               randconfig-r025-20230424   gcc  
xtensa               randconfig-r026-20230423   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
