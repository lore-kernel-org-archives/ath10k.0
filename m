Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADD9C38142
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 01:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xAzUS7X6lo1y7zKZBW4H8fxo4tjFghrhVw4ICT7h4KY=; b=GJt6rbIyxZMDWE
	1+57rA+ribcqFLdB+FXNFro/8TaRsr+2YQwEkMGuGCfG5owYPXaZGOFQYqQu6M0t9q88zpmXmH3Yw
	2QLCqifWeK8BdsUbCdGfXh5ssLMRJQNNyYOpBoRES/af25nnliYh3iT41adm55Edz/XWMyTgIKCwu
	xfRz5QT228E+ESru0inrokDmCQZSZU+41WR4Z+gpBo93hlBAeCXgO4utUlTU0RYO26F+tdQ2S5rUL
	cy9ANVy0rabycPLFpAXmzAJLAdWCIXNSFULjI4Aa7Pwj+vbA/6VRHHvAIfVOlJblhkBWPH7GNbzhn
	c//jOHLMavkcIAKQPSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxGv-00GTVi-6N; Wed, 18 Jan 2023 01:29:49 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHxGs-00GTUq-Kk
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 01:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674005386; x=1705541386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qNOC/K3TatGT8NuGYIwJw2ezw6k91P1lpOyq1bQaua8=;
  b=Tod5zvfb1u2wI8OpOITmpByOEC2R5VXqFyGVr9/8K9/NFT6tBsMSR/9n
   i0c7/7KmQ9T4L2H/bCNtl0fT7gbnPIl1388Psnjm+9jhRtx9iBnLQJFoD
   zdEBXsm/INjK1u18H7F2U6UtdGpGdi0vRVw5oAdvnl4yrPnKCVd/iCIC3
   BlvSJgodBCb+ezbE6JihwXYzvq1bq091aJYDeeemDUbn3B1PC0SiuXEcE
   2azZ7e9kCF3ZMKxQjmCKw5SoWS+6rV2ItyJMwgyN6CJCtL0R0jdT2o6Si
   E3IN6FqxGukJqCCpfBuQSS5UrAgswm73lzS13kxvFXO3I37z2rrnfoXv7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="322560857"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="322560857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 17:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="652724210"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="652724210"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Jan 2023 17:29:40 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHxGm-0001Ww-0K;
	Wed, 18 Jan 2023 01:29:40 +0000
Date: Wed, 18 Jan 2023 09:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4eeca198483fb48dd3423ee7536a8524adc4ce6e
Message-ID: <63c74b71.DBXDbeX/IZ4GLGQb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_172946_720347_524531AD 
X-CRM114-Status: UNSURE (   6.16  )
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
branch HEAD: 4eeca198483fb48dd3423ee7536a8524adc4ce6e  Merge branch 'pending' into master-pending

elapsed time: 728m

configs tested: 80
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                          rhel-8.3-func
m68k                             allyesconfig
arm                                 defconfig
m68k                             allmodconfig
arc                              allyesconfig
arc                                 defconfig
x86_64                               rhel-8.3
alpha                               defconfig
i386                 randconfig-a014-20230116
x86_64                           rhel-8.3-bpf
s390                             allmodconfig
alpha                            allyesconfig
i386                 randconfig-a013-20230116
x86_64                           rhel-8.3-syz
i386                 randconfig-a012-20230116
arm                              allyesconfig
i386                 randconfig-a015-20230116
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
i386                 randconfig-a011-20230116
s390                                defconfig
arm64                            allyesconfig
i386                 randconfig-a016-20230116
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
x86_64               randconfig-a011-20230116
mips                             allyesconfig
x86_64               randconfig-a013-20230116
x86_64                           allyesconfig
x86_64               randconfig-a012-20230116
powerpc                          allmodconfig
x86_64               randconfig-a014-20230116
s390                             allyesconfig
x86_64               randconfig-a016-20230116
x86_64               randconfig-a015-20230116
i386                             allyesconfig
riscv                randconfig-r042-20230116
s390                 randconfig-r044-20230116
arc                  randconfig-r043-20230115
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230115
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a006-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
riscv                randconfig-r042-20230117
i386                          randconfig-a013
hexagon              randconfig-r041-20230116
i386                          randconfig-a011
i386                          randconfig-a015
s390                 randconfig-r044-20230117
hexagon              randconfig-r045-20230117
hexagon              randconfig-r045-20230115
hexagon              randconfig-r041-20230117
riscv                randconfig-r042-20230115
arm                  randconfig-r046-20230116
s390                 randconfig-r044-20230115
hexagon              randconfig-r045-20230116
hexagon              randconfig-r041-20230115

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
