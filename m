Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A88C433EF
	for <ath10k@archiver.kernel.org>; Wed,  6 Apr 2022 21:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jV0vRn8jFrbhF2gAV2sUUyiSLM/MbKYSVcZT388rJ1w=; b=Lacrt+pvoFMBxS
	JVakmuN9+Ox29WHfsbSchLWAExns3PLYxNiqmFF8YNN+NQvrVzpo6SWF0BPDRWxe1jHbv3HN5b8O0
	2cZEkeSXkU9vhfdNDY3p41eK7ZAjQsm3K4uvZx4uP0ZKokPBB8pvUojQUkJDOybZ8eywYnV3qMMp6
	QsM3uDQh9r4nHV9w/BAzzrKKlJa3bIJ4FXNIvkjbjK9smH25FVELCzSj6klwKQz+dgO3ejrY5dGKF
	tMjET7thve3QaVpayKixQQ7/1EFq/buxSdoAViLEv+kRV95ahg6fRWohlAxVMhcKzxoFuycrqOHwp
	Nvz3j2ekeSCqPw7Z4XMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncCzN-007yOg-0l; Wed, 06 Apr 2022 21:14:53 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncCzJ-007yMp-VS
 for ath10k@lists.infradead.org; Wed, 06 Apr 2022 21:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649279689; x=1680815689;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=IYecyYzAKsn8chtklsrFOc4K4Fvmtlv4weHr9skhais=;
 b=U6UoMfiLXS3r489vM77z4yu2TLVjnbbi0pnBDxFsm0g8fUUZmPu8RH7y
 /FiVxOTRdB14eBAbdqLA5z27G9IdZ38YK8wAvt/Ibur+eZCC7t5VjoJaj
 UCGi7oMtnAsFaVM1KtWkxCfJhL865VxjGQsiGNWyE/OOaYunW9FMSEK3a
 O2PrnpjjagfnMOHdv6Wt+pxFQdv+sCXcdV+izkELY5ifvucJ3aW1MpV35
 fbiBXgrx9gDO4DFygwQGt72DnudaWCNc5kcbwD0xmts75Y0A5Jd7keUZg
 s+8KNjEQvK9GEB+K6SfU2CeStqU3kQikYHCFinLBxX1+BnvWM7qwJ6bkF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="241745258"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="241745258"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 14:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="588531516"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 06 Apr 2022 14:14:44 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ncCzD-0004l1-VB;
 Wed, 06 Apr 2022 21:14:43 +0000
Date: Thu, 07 Apr 2022 05:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 b9e34ba6b314780a47ac40f450ec04f18be85b5e
Message-ID: <624e02bb.2Bx0bHAjsvbi4LVT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_141450_078005_819DACF4 
X-CRM114-Status: UNSURE (   5.58  )
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
branch HEAD: b9e34ba6b314780a47ac40f450ec04f18be85b5e  ath11k: mhi: remove unnecessary goto from ath11k_mhi_start()

elapsed time: 746m

configs tested: 109
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arc                        nsim_700_defconfig
powerpc                        warp_defconfig
mips                           ci20_defconfig
arm                             rpc_defconfig
powerpc                 linkstation_defconfig
m68k                         apollo_defconfig
mips                      loongson3_defconfig
xtensa                           alldefconfig
arc                     haps_hs_smp_defconfig
sh                           se7343_defconfig
openrisc                            defconfig
openrisc                         alldefconfig
sh                        edosk7705_defconfig
m68k                          atari_defconfig
arm                           stm32_defconfig
powerpc                     stx_gp3_defconfig
parisc                              defconfig
powerpc                      cm5200_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7757lcr_defconfig
arm                          badge4_defconfig
arm                         s3c6400_defconfig
sh                          landisk_defconfig
ia64                         bigsur_defconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220406
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
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
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
arm                        mvebu_v5_defconfig
powerpc                      ppc64e_defconfig
arm                         socfpga_defconfig
mips                           rs90_defconfig
arm                       spear13xx_defconfig
arm                         palmz72_defconfig
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
