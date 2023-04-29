Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562FCC77B60
	for <ath10k@archiver.kernel.org>; Sat, 29 Apr 2023 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/NI/5aU9+SxkUiELKhG6V1PvkPvM394GTtTkfVPfv3o=; b=Blkz9HJ6XmIFdr
	PQT54plt0jAgZQhkldPhe7jb82OQekcL333vXWbKSBVdpcocPupn5GL4frR02U6L4RSJELZLdeQTu
	dPMvo/m2reBjtXUFD136xiIUn8HvcLUo/Km1nmXgV7aclTGMsK304/INCuDUtLjaDg7Xl5yxJMZUs
	dQUnPA/9kuXxf7PMX49Kw46Q3HHPh5d/86ZWIw7F5aEYjEispFEo7aSbD+MBJTfPdpZPGZuIIecSU
	hQ/oQkZTS6bMI7Znqq83gMp6E5AS+2VUF1B58dLMZvDkeWE1eDxIfWEg+xaqVIxqhsyZ+5zsKcEFe
	ciOXiHMx7fJBgW/R5aPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psdGd-00CH6v-3A;
	Sat, 29 Apr 2023 05:37:07 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psdGa-00CH5k-2G
	for ath10k@lists.infradead.org;
	Sat, 29 Apr 2023 05:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682746624; x=1714282624;
  h=date:from:to:cc:subject:message-id;
  bh=W6U0eX1hMDQ8K3x7sHjGbAQgcmPcNFjazTn/OqABJXw=;
  b=C/SGDFiQpewxPCTJCpfpgpktlJR/UvwXyVs6d9SlCHcWslSD3lDULhdu
   SqRSF6wDzNVqpFhjDuwZZU4vLM52UiIq2d8BhX+9Fkc4TL2rjEfN4fGWg
   UAHx63+MeByHF8dxzYE23tL7YvLr853VIKUaTKZjPh5NNjGcZhWPPSKuU
   NaJcxMeMY3IajLeU46LR9REXKLOdnmAebkwgMgtu7w7RcvsNVWFB6PAUj
   KvvQNJ6zi3AyLUc+XQMVG5IyRqat2vlTdaKkibe7rqm1KqcqJkJwUDBHW
   OposD9MIzWLIEfUub7+MVcfILGfKDRRsHl5kCwbBJ7sRuOAOqzAF9Xpn7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="345365979"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="345365979"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 22:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="689133722"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="689133722"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Apr 2023 22:36:55 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psdGQ-0000wC-1N;
	Sat, 29 Apr 2023 05:36:54 +0000
Date: Sat, 29 Apr 2023 13:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 bccfab1df38128480ab8a8cc36243f02a8cc3d45
Message-ID: <20230429053610.p36Nl%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_223704_755506_049ED941 
X-CRM114-Status: UNSURE (   5.47  )
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
branch HEAD: bccfab1df38128480ab8a8cc36243f02a8cc3d45  wifi: ath12k: fix potential wmi_mgmt_tx_queue race condition

elapsed time: 728m

configs tested: 99
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230428   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230428   gcc  
alpha                randconfig-r036-20230428   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230428   gcc  
arc                  randconfig-r014-20230428   gcc  
arc                  randconfig-r026-20230428   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230428   gcc  
arm                  randconfig-r023-20230428   clang
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r034-20230428   gcc  
hexagon              randconfig-r032-20230428   clang
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
loongarch    buildonly-randconfig-r004-20230428   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230428   gcc  
loongarch            randconfig-r024-20230428   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230428   gcc  
mips                 randconfig-r021-20230428   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230428   gcc  
parisc               randconfig-r015-20230428   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230428   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230428   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230428   gcc  
s390                 randconfig-r035-20230428   clang
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230428   gcc  
sh                   randconfig-r022-20230428   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230428   gcc  
sparc64              randconfig-r031-20230428   gcc  
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
