Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782ADC38147
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 00:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l/t4euLeX2MKWiA1BhiYreK3rDM6g7yCiQ4C/EI/I/Y=; b=ffJ0woYtF9OVxW
	8o0A3RyXtDcAGWCv800kkJeZ+kfJq9+Eog/QmlaYgo9nQBRbFzN+mkVVrnJSIEEFWEAU8h6R9EA/m
	3TvmN2cUXX3ohP7gjVfzDR9Uw6n84GvlE/k9Fcd8WtQWwSrOxQo4Zmv4NSU6UmLhWJ2vjLNNukMGH
	vTBD2k/eentbtxCQ+mXrjeMwBomx/Ueta99oa+Kmns25aUwNRzIL+qvqxmET2ZHvlDSWUt0MBzvMq
	IqQhIlrdjWXTmrAhRUU+C/0FVSR1gXqRTgZYVtDCdl4pMdf4puXNPksMepJRDj/XtCjSaW6UrO+38
	dLol5gmKHdpxqvNNKF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHwDc-00GKZj-T9; Wed, 18 Jan 2023 00:22:20 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHwDZ-00GKZ4-QH
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 00:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674001337; x=1705537337;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0NYg9ulOAOMXm+3jLin7CF1X2boYmJM3EG6dxpUmkNw=;
  b=GcZc3rV3ukapGC9ipT7hECnPTktLaU6diEVJTZ1qdWzS5ePwOxSORqAi
   y6m4iBROxMskuXdFg4B04xKROh4RUlbKwD4yRRnWGNNBnN5oqJYZhh6rS
   XBLYq96s4gI8Vb0y+WVsBqC0uIklMjFYAZ17J40Ax3V9sxxADL65NcJBo
   gzaJpr+LMa/ToeqQ9HJgwHWEbHN0YwnETq5OybPklIOi3ofw8H3Cebz0Z
   0c25s3n1/z62VIthvp08syFEEjiLyhtaBmlNdAGJUx5kE+GuyMLU6Sj1p
   tAPJukfvXOPD7U7D7pexR1MvH1i/SvQgDuCAu8v/NfP/kDhVHksQbvLOm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387206031"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="387206031"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 16:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="659568197"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="659568197"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Jan 2023 16:22:14 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHwDW-0001UW-0V;
	Wed, 18 Jan 2023 00:22:14 +0000
Date: Wed, 18 Jan 2023 08:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 68f32e3be36a91de70195e5ca250fd32e8aefbf3
Message-ID: <63c73b92.0X4ZIZfHg6tHakAJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_162217_922067_0D7FEB02 
X-CRM114-Status: UNSURE (   5.95  )
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
branch HEAD: 68f32e3be36a91de70195e5ca250fd32e8aefbf3  Merge branch 'ath-next' into ath-qca

elapsed time: 724m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64               randconfig-a011-20230116
x86_64               randconfig-a013-20230116
arc                                 defconfig
x86_64               randconfig-a012-20230116
s390                             allmodconfig
x86_64               randconfig-a015-20230116
x86_64               randconfig-a014-20230116
i386                 randconfig-a013-20230116
alpha                               defconfig
x86_64               randconfig-a016-20230116
x86_64                          rhel-8.3-func
s390                                defconfig
x86_64                           rhel-8.3-bpf
i386                 randconfig-a012-20230116
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
i386                 randconfig-a011-20230116
s390                             allyesconfig
ia64                             allmodconfig
i386                 randconfig-a014-20230116
x86_64                           rhel-8.3-kvm
i386                 randconfig-a015-20230116
i386                 randconfig-a016-20230116
i386                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
arm                              allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20230115
s390                 randconfig-r044-20230116
riscv                randconfig-r042-20230116
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230115
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a006-20230116
i386                 randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
hexagon              randconfig-r041-20230116
hexagon              randconfig-r045-20230117
s390                 randconfig-r044-20230117
hexagon              randconfig-r045-20230115
hexagon              randconfig-r041-20230117
riscv                randconfig-r042-20230115
arm                  randconfig-r046-20230116
s390                 randconfig-r044-20230115
hexagon              randconfig-r045-20230116
hexagon              randconfig-r041-20230115
riscv                randconfig-r042-20230117

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
