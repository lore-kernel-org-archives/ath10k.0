Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930E5C54EBC
	for <ath10k@archiver.kernel.org>; Wed, 11 Jan 2023 01:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D7XqRsidt9nxhZfFZW4Oo7JIHAJcFWZvb1IIkGdsxAM=; b=MmEE0qNzM0vUQ2
	vYTncqMOQQUElGcML+9SCQne1h4yrd4M5ZNU9UD5Mn50KqrAzzcHDvL03h40udQotr+ZE2UMxVhDx
	62pItH1PDBpqYmgCUF9FSP/b/PJUCCiwpE2uLR0EmHdxXfCHok1B+CtBk1EdbMZpbpzZGUm4ElvoD
	4CGZvDApUbNTf/RLadO86IphjhOyMNBdZ3nIPUPD2CtqhApoDLags20cef4XLmBwXhIFP1WEYqQbP
	Hr+p/ErNTy0Q2l7RR4g8LLZO2C1BioJcqrHPuqRYP6RvlNwKuN8INY/MZmIK5Y4rSsFVcFmec59Ij
	rCzGaZZraSEjyVmcLpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFQBT-0099Qj-Sv; Wed, 11 Jan 2023 01:45:43 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFQBQ-0099Q7-So
	for ath10k@lists.infradead.org; Wed, 11 Jan 2023 01:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673401540; x=1704937540;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xS3H99+SB0fIY9W+XqjZx7pCGv3UTMv/Z29Tk2tpPvQ=;
  b=c6zGqsviEIF2kZUgRA6QFPRQUar4QP+XXVrsnHEwvHmPbfybHQtM4N8V
   Jr1UXmwtl0T9nNRMS7fgW2DlmFlR1LrvEG1CBsNUpM/GJ0WtOBuNCkIX/
   urP52X2w0ONpXSLHyBAQezrv1Tt0lijGRlOg/Zx4ebXYr4h8gf/+ndSZB
   NYoz2SetDwXO5zMRUtgPL/fdGCfg0rqFHnv4AdrTK9yOBN9PTpjyt+7PU
   E29ABXwt/R1mjrHrADEvnPo/omLI2M5u/eOJXYzzDc/y8/nJxvL1AcYeG
   kYbpetm+HW8MUT0ky+Wft8SwPR4TZ27qNBXPULyx525WrLOYLwHciXxeL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="320996819"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="320996819"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 17:45:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="687760059"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="687760059"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Jan 2023 17:45:36 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFQBH-0008aQ-0x;
	Wed, 11 Jan 2023 01:45:34 +0000
Date: Wed, 11 Jan 2023 09:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 323d91d4684d238f6bc3693fed93caf795378fe0
Message-ID: <63be148e.uMHbSDvVunNUhNED%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_174540_988743_D7C0D543 
X-CRM114-Status: UNSURE (   6.38  )
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
branch HEAD: 323d91d4684d238f6bc3693fed93caf795378fe0  wifi: ath11k: debugfs: fix to work with multiple PCI devices

elapsed time: 722m

configs tested: 49
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
x86_64                            allnoconfig
alpha                               defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
riscv                randconfig-r042-20230110
s390                 randconfig-r044-20230110
arc                  randconfig-r043-20230110

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-k001
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                malta_qemu_32r6_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
