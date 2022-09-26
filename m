Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A72EC32771
	for <ath10k@archiver.kernel.org>; Mon, 26 Sep 2022 21:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1tBKtv+VHZSvXEoXmJH5o8fNlzqfQReI9V0xpC+l9Q=; b=IjFZ5mar2qeMWT
	X4mDSLFcsmuJq11jm8CWKUC9gtn9b7emn6gM1t9HbK46IbjAXea/XgpX2NxtyMBn5z/uo8UguS+QL
	i9QoXx/lg5AXoxeRpe/yHczAQdNDkm5OO5KXhADGPzfZzUhrmTcvfkBog7FHqrRXSPLwXLclivMny
	AkIMHmG+KrgBw3msqvfXAOUbd6gZsXG+RIUsbY9aqsjdBx9i5Q99O3tb4va5VQGTWliXaulzxcnbr
	ipjI8TYvG347fGZY5tAI4uQlmF+6QxocEF359+yq8EvZdDQSA1Vk+IGK5lqXut1j0y6GH4s+R8cS9
	Bn5CX/RG2L7QRNkPCgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6K-0076iT-R7; Mon, 26 Sep 2022 21:57:20 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6H-0076go-5a
	for ath10k@lists.infradead.org; Mon, 26 Sep 2022 21:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664229437; x=1695765437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/sWIarbPQk1yT4ytOlqqEI+WBFploMGh8UgqOMNcE8o=;
  b=ULjCFrDoM5Gwxok8NkZzz4bw3a2hnZVw53zwSgTddjM2xAH5rvNPIumJ
   +bGY/EMGwD+WbHfM20TfyhmrYTBUqB0rf1J3Tpvf4BpRK3EKTGwktYktH
   Ti6PpvzrRrJ5jzJh1m/i0GekzsD1BtN1+iHOJUdcf2VPeVHq6c+z4RbGX
   kWMjOy2O2Vl2k4KWqNV1ajmYEqMMxOZ1IHmebBk6GzX1olzI9sQXWNx7s
   wAZ/H0JJskGjJQIxBG1vTLq2wYyZUV9KWLDiYDgKVMn4KE5mOYtpCkQz+
   aU+FK6Pyf07Yfs/uIx1p76V56cF77ADBQSnDy2DcXcIQ4wTqjDzO1Ktv7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284271937"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="284271937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 14:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654449693"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="654449693"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2022 14:57:12 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocw6C-0000Hz-01;
	Mon, 26 Sep 2022 21:57:12 +0000
Date: Tue, 27 Sep 2022 05:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 57a808eaad13f7d12dbfd884c8b4f938c3543c5c
Message-ID: <63322032.1QpePFGndnvQITeJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_145717_298450_65DC4FB8 
X-CRM114-Status: UNSURE (   7.12  )
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
branch HEAD: 57a808eaad13f7d12dbfd884c8b4f938c3543c5c  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
m68k                             allyesconfig
x86_64               randconfig-a002-20220926
sh                               allmodconfig
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
arm                                 defconfig
i386                             allyesconfig
arm64                            allyesconfig
x86_64                           rhel-8.3-syz
arm                              allyesconfig
i386                          randconfig-a001
x86_64                         rhel-8.3-kunit
i386                          randconfig-a003
x86_64                           rhel-8.3-kvm
i386                          randconfig-a005
ia64                             allmodconfig
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                          randconfig-a002
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a012-20220926
i386                          randconfig-a004
hexagon              randconfig-r045-20220925
i386                          randconfig-a006
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a016-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
