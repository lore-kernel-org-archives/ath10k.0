Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5C4ECAAD4
	for <ath10k@archiver.kernel.org>; Wed, 31 Aug 2022 00:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lqm6qDIbs+jh2LA8KoVzf7f0W16ZdaDlbMpaFdwtwQ0=; b=1L5GTahpH6JcL4
	6xNU/0UQNjfNTcqQqLZV/yqo6q2tVp4s44Y3ZUNCNeAemLhcJTfFDmrjsnN69nvxT6tJLwYQWnBs6
	NptnjgYJqQKfJxQouj4e+422CB5YdfRToBikHv6UuOQ/vNf4o8b0EZo0rv/XmMpzPhamrrentYrCk
	ZFNDphtRZ7sO4XQVrbhMTWi7FBvQ2h9aiZgsqNtTGSq6Q+EnPkSjVM5bJ+8G0HIJ/gOQoj5qW70R5
	KsCvPPFzyPM1nh8//hr1PYGeo1qd/u14/97nt4XyJNKffo1wA87bjdyWyfVqW/aPX9mOTNg0Ua5rG
	7jOLhhfD9VUlWwzdeSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTBng-002n01-RC; Wed, 31 Aug 2022 00:41:48 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTBnd-002myC-7E
	for ath10k@lists.infradead.org; Wed, 31 Aug 2022 00:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661906505; x=1693442505;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3bCl04Zj9wl/KQxyKRqtPU1CdBJeJTfixhn71y7NH+o=;
  b=VSjV6wug30LZc1wfaAhZfrlnYj/ptUqmBRbz8y1MXnoftwNUbPR9E7kB
   kR5v5Z6Su+bvB191VOQEmuDjFDOsAkrGbYHD2tDOV0wGDBCs5LxZ8pQBk
   OIzTJYCLNKXo6/GaXVEF60V5DL8XIbjoo+ys4xNIiPe/TVUqRqbmvnh2Q
   yt7rwtctFXq9wQwrwX5TM/h0Ld64BTJZ7gxrhhKqo/Z7uLSlxuy0eBmhA
   BESIfz9m8kWn2B5VyqSlmxQs+nLEyEfzFHAwjJnjne/J2y1HzDnAej4a6
   0Jl6ncHJbIkXDzJp/MMQ5/vbCtdWqPggmfyE/nEnSgeuOcGiKSphY6VVu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="321476173"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="321476173"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 17:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; 
   d="scan'208";a="940251856"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2022 17:41:40 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTBnY-0000nf-0Q;
	Wed, 31 Aug 2022 00:41:40 +0000
Date: Wed, 31 Aug 2022 08:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 16424e934b2e83faa81bb7709e13be4b809d35fe
Message-ID: <630eae1d.Qq/8Xjw05yx5kMHf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_174145_334396_B7003355 
X-CRM114-Status: UNSURE (   5.88  )
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
branch HEAD: 16424e934b2e83faa81bb7709e13be4b809d35fe  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 723m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20220830
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a013
x86_64                              defconfig
i386                          randconfig-a001
x86_64                        randconfig-a011
m68k                             allyesconfig
i386                          randconfig-a003
m68k                             allmodconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a002
i386                                defconfig
i386                          randconfig-a005
arm                                 defconfig
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220830
hexagon              randconfig-r041-20220830
riscv                randconfig-r042-20220830
s390                 randconfig-r044-20220830
i386                          randconfig-a013
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a015
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
