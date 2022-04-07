Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD4C433F5
	for <ath10k@archiver.kernel.org>; Thu,  7 Apr 2022 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5EIllAe5REYMUD7PNxxWPm/kRt8lCXVELIb/YKbC3LE=; b=uwTU1Pr8rKp3T0
	2JBlyg8Yt7czXJCZBYBbQRKYeVbmN8apKDCpa/pAsHrKargtxHAVo0VRm4lyNEvPiIv6kGSTm13FI
	GjWdiguAjf1WzNH7aMDIQAGqUVaC3uzF2F82uGt5xa4D4wSy4lR78EVlRsWPBMpVtDldS+H3QZeIS
	Ii59s9myOWiXZFZwievb3vbcOsfNYsMa8YEfBPsc2tUEDK2+DXJ4tGMTk6BtsN0uWDwj9NjsWNnPO
	4zvCYG1HRhlC7BygEtJKJidgBglK2XoA1NiptK1Oqu/WRiK3MG/dw5/7mKqfS+iZ7v8RRURlkzU6J
	FtEIexv2haowRDPM86rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncPqy-00BQE9-IL; Thu, 07 Apr 2022 10:59:04 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncPqe-00BQ39-Ea
 for ath10k@lists.infradead.org; Thu, 07 Apr 2022 10:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649329124; x=1680865124;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=qcF1SGNAjrjhXGU+Fky5n3IY8uzKppgu3u778RwLa3g=;
 b=HB8ohUUjwvz+waQNX9sT/7g/wPjmpOjZx41LeHznY+cO6Q4PD8yx39JK
 CTGqTWDTnWpZDB6qdGUNBmS5X4BnR+7NhZytzh1VVo/9J3EbcHhlrEb92
 lr+3k8kZ0JGGzglTrdDhWWcrvak1juqlj8nl8+wJuAZX399BJ3IqFFP/p
 x3z/EQbzWctB58yqs040xrF9fGHi5qu4xfCSU2mC42HmbxOD4oyc0LTst
 AlBDyqdncLUSPEYuCUCdyx+MYVqTxXfwCg0MEQsCBSzTvQvU4IPO80B+x
 JEerMNEN4ZcaQg7FsVVndd4e2Ku7+OTvutX/NCdpTrjJEGT5YhHhYP/ov w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="321983243"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="321983243"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 03:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="524875833"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 07 Apr 2022 03:58:40 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ncPqZ-0005LT-Sj;
 Thu, 07 Apr 2022 10:58:39 +0000
Date: Thu, 07 Apr 2022 18:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 7641c9a2dca608dd65bdad0e622925a1c41e230c
Message-ID: <624ec3a4.ttqx4g5V2dv0gFUB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_035844_617131_44D7CA7C 
X-CRM114-Status: UNSURE (   4.20  )
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
branch HEAD: 7641c9a2dca608dd65bdad0e622925a1c41e230c  Merge branch 'pending' into master-pending

elapsed time: 959m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
m68k                         apollo_defconfig
sparc                               defconfig
mips                      loongson3_defconfig
xtensa                           alldefconfig
arc                     haps_hs_smp_defconfig
openrisc                         alldefconfig
openrisc                            defconfig
sh                           se7343_defconfig
sh                        edosk7705_defconfig
m68k                        m5407c3_defconfig
powerpc                         wii_defconfig
arc                        vdk_hs38_defconfig
arm                            pleb_defconfig
arm                         s3c6400_defconfig
powerpc                         ps3_defconfig
h8300                       h8s-sim_defconfig
i386                          randconfig-c001
x86_64                        randconfig-c001
arm                  randconfig-c002-20220406
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220406
s390                 randconfig-r044-20220406
riscv                randconfig-r042-20220406
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
arm                    vt8500_v6_v7_defconfig
arm                       mainstone_defconfig
arm                        multi_v5_defconfig
mips                     cu1830-neo_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220406
hexagon              randconfig-r045-20220406

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
