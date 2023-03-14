Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F61FC6FD19
	for <ath10k@archiver.kernel.org>; Tue, 14 Mar 2023 00:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tAqjLnQkAG4+yZuNWlPp5227GNbPcn+Vhb52/FFRGdM=; b=Ib77E09RlkqYDO
	SqK0n7223SGtpiUcaTvOvI73cvdbI0lBfId3c5QBL7ItM3890QGwQ8a3GGQq9RY3i06UUMhSh5u3q
	0fCDH4pGmPhDDtutvqnDPCa1nRvJX4YiEoSwr8nOwPoexNhI7wYEPy4tM0uhBv5VsBW2+DG7f335n
	Ki6yB2cMPflyNnKumBzafuA9+VfkhjYMjYwI5h9XCx6kH7c8uF7PvR1cOwaYNZk3GGwkH06BBSj4M
	fnez324wILY1YuX55qHu3/6dFDqfr2l8pJMiMlXjcqu10EwkGDYVyxa0UOFUwyH7JQO85xJdbQp3u
	uiZhMvI3QZhCey0oXFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsVM-008Plk-1r; Tue, 14 Mar 2023 00:27:04 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsVH-008PlL-FE
	for ath10k@lists.infradead.org; Tue, 14 Mar 2023 00:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678753619; x=1710289619;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ia4+hQIHQEpJ5FJEz6k2lo4/3zxoE6eBixqYYATmOSU=;
  b=dwFQoFl1/cWx+N+lcvsDH2OwQ3vtTTmFpfeBkBKmJ7Ec7OFf7T61IqJQ
   CKK5x9pjGisoQRuidSlamKYWkxUfPWMz/Q5WGwF3Zfx5sCbSDbzt3L5Sf
   HJ0oSQPe10/gMwEgCScRLmbSH0BNOWV606dbwNokTCUcXVs/Odv+n9gPm
   wUz66VBgFgLt+P9f3RRMnkGJMLSLAN6tSRBZ5KWnYOD3rigooFtCiKV4c
   gvv4wgyPiMnFm8Qbd2yo23fl3iQo0ec1z2ZBOJKnH3zQQ/wgkW/Tkz/JD
   NpMbgQoyFniUlOwpuf0BaN5OYpEtde5CezRpCoHfAOr/JCTzh38iXyHFk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338840818"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="338840818"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 17:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747797982"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="747797982"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 17:26:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbsVC-0006IG-2u;
	Tue, 14 Mar 2023 00:26:54 +0000
Date: Tue, 14 Mar 2023 08:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e238e62ba8868a784e485eb94451c87cd1b85cee
Message-ID: <640fbf3c.AwcoYA1D2JQ6eYhO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_172659_606916_598C2C75 
X-CRM114-Status: UNSURE (   6.08  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: e238e62ba8868a784e485eb94451c87cd1b85cee  wifi: ath11k: add debug prints in regulatory WMI event processing

elapsed time: 731m

configs tested: 129
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230313   gcc  
alpha                randconfig-r032-20230312   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230313   gcc  
arc                  randconfig-r013-20230313   gcc  
arc                  randconfig-r031-20230312   gcc  
arc                  randconfig-r033-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230312   gcc  
arm                  randconfig-r006-20230313   clang
arm                  randconfig-r033-20230313   clang
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230312   clang
arm64                randconfig-r006-20230312   clang
arm64                randconfig-r034-20230313   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r032-20230313   gcc  
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
i386                 randconfig-r004-20230313   gcc  
i386                 randconfig-r022-20230313   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230312   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230313   gcc  
loongarch            randconfig-r025-20230312   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r001-20230312   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230313   gcc  
m68k                 randconfig-r005-20230312   gcc  
m68k                 randconfig-r014-20230313   gcc  
m68k                 randconfig-r023-20230312   gcc  
m68k                 randconfig-r035-20230313   gcc  
microblaze   buildonly-randconfig-r005-20230312   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r015-20230313   gcc  
mips                 randconfig-r023-20230313   gcc  
nios2        buildonly-randconfig-r006-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230312   gcc  
openrisc             randconfig-r003-20230312   gcc  
openrisc             randconfig-r014-20230312   gcc  
openrisc             randconfig-r035-20230312   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r024-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r012-20230312   gcc  
powerpc              randconfig-r021-20230313   clang
powerpc              randconfig-r024-20230312   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230312   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230313   gcc  
s390                 randconfig-r013-20230312   gcc  
s390                 randconfig-r031-20230313   gcc  
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r036-20230312   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230313   gcc  
sparc                randconfig-r026-20230312   gcc  
sparc64      buildonly-randconfig-r002-20230313   gcc  
sparc64              randconfig-r012-20230313   gcc  
sparc64              randconfig-r021-20230312   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230313   gcc  
xtensa               randconfig-r002-20230312   gcc  
xtensa               randconfig-r016-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
