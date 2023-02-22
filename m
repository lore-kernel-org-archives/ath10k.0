Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADC4C636D6
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 22:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5vqzvpG+py5iD3fEXXTxZpL2MRbEN9RpGXGBdNZkaVo=; b=pWNBuubgIjJLBs
	K7JEvxqdHhJueUWebYNOAOfY8FQgp+oeDjVILg8qqRQZjsEpaN0M7PQ5sKja4J1QPJiQuOoa1MK9q
	4XX2mx1rpW0mWzOkBxXSNpFpvtJU9lAJeDER/8uxykq8Maib8cOpwUuDScrAYLNr3E4N96wIkjaAO
	7oY+IzE6+FfMgeplFScYNAbOID41IQQENoYZY6RqA0ActxkBGK4czV809txe3fqmZN7PDDwefeDnJ
	YxXFyuJHNkDLsCMvFVbdorg3FimcI7AQkGFOTdBJLB3U32MQCVA5q0B2/BlDSZDVRb557DRPJpAMU
	bvYRTIjQr11z3e5kqFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUxsm-00ELUB-2I; Wed, 22 Feb 2023 22:46:40 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUxsj-00ELSR-G1
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 22:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677105997; x=1708641997;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BN1nOrk9e0xZCzbu60TewI1+G47/1YoJbMJgGO7tsyw=;
  b=QRB0saJLkjlMiZxMcA1dVcKFLOXsGE5NPvd8LDrRCgNBdx/1tt5aodMe
   mxBZHXcnTJw0BLmmyHeGXTZAFgjePY05HpgRvsvqTFztRV8tWN2q37tMG
   jVsQZVb9hdIs5/sukkbudCerlTa2m9AojvNwRejSPaWN49T1uzNTQHGy0
   nT7vgsnt/PYZtdzVV3Icc0NluIqVVMEDRZliHKHbPfWk6OCpHlxRcQItm
   IL2T2+P1JA245DoJAL9RsLdjqkDWXER6g7gzmEebgJMT+iwFjsDc5j1It
   DO97emARVj0eABzvNAd+Vqk5cyyBhvY/RaX1IM8fbvThYN40yTfVGRhWe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="334421814"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="334421814"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 14:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="1001165211"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="1001165211"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Feb 2023 14:46:34 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUxsg-0000mg-02;
	Wed, 22 Feb 2023 22:46:34 +0000
Date: Thu, 23 Feb 2023 06:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 5aa9ff08c0b71be15a607341fa5344546e19ceb2
Message-ID: <63f69b24.KXbeYgtM/yXMxRPM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_144637_604456_57F972C7 
X-CRM114-Status: UNSURE (   5.22  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 5aa9ff08c0b71be15a607341fa5344546e19ceb2  Add localversion-wireless-testing-ath

elapsed time: 721m

configs tested: 73
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230222
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                  randconfig-r046-20230222
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                               rhel-8.3

clang tested configs:
hexagon              randconfig-r041-20230222
hexagon              randconfig-r045-20230222
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20230222
s390                 randconfig-r044-20230222
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
