Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E1C32793
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ivCghhpn2eR8YOfoN1gQzJcpfcDPaBPHj58NbrQqd/8=; b=LsarRXzM1/vyb2
	PRzGslEgWX3e+vXvBpfJRN6qMCPvT1m5pOlYHwxhW6dOsB2jBPq43LxZRkLppQEs0DQlNms2Kt8Af
	bkshRjM4krM7XZCin9Lnzb0Lc+9G3l5v7cjco5eMMp3pIxpY30zm0+SbbNAqLqxXKw+z3W81QWd8A
	JKxhfNBHj9niWveZDmr+/iOEuPWJWpHMzf6eqwNgucZzsM5OmFe7OOQStH4Thu8vdliHdA4TogEJS
	ps0DfzEUUemwiFzeQXSouCueFP2j7rIxIcqIth+j/bs18nei5hyqbbP/2pkhsFgMtYwbFUDIPNnlz
	dUin0WzYOkho28Yy6zNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDfb-002O5M-T4; Wed, 18 Jan 2023 19:00:23 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDfX-002O2i-2H
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 19:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674068419; x=1705604419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CBu5FDK8axJLZMiVowZ4pY/4k/dYR+Q6bGeohSC+iio=;
  b=gBZNG0QZVWdrKokBeDjoOUgTdQolGWbeJR0FPjo1b1WLGA2NKibiVkvl
   n++1t+EeCYOegcy39FgMhTC0Erid9paaGzFD4lQRXSInU7VM9vW7vNv9M
   x7TI3sAg/AVHjp4P8dbNWcLFq97ryhQ8iYA1BRLfcN7BUQDaAlA73BUX3
   CyMg8ad2pc3YE7fn2KZ7qDjZWHr4C1XTqgGB0DLEYCFomfqg7BwFctjAZ
   6LsEtQnD93iDWNhEdgRp7SpJZrdTZvBXscp0+SPYYndHE3DK8y50bHNTf
   lK69IJVPCc7QUg6DaiYbNzLHArNzizSJtqb6DY1rA5ZB/NCQKJ749zVJ/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322762452"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322762452"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609756645"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609756645"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 11:00:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIDfO-0000dm-0b;
	Wed, 18 Jan 2023 19:00:10 +0000
Date: Thu, 19 Jan 2023 02:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 ea726a8d305ac2db035028aa6c23e3e7b7747837
Message-ID: <63c841a0.9ZmIxRdgsDt3szl6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_110019_152695_679DAE4C 
X-CRM114-Status: UNSURE (   7.07  )
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
branch HEAD: ea726a8d305ac2db035028aa6c23e3e7b7747837  Merge branch 'ath-next' into ath-qca

elapsed time: 730m

configs tested: 89
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
s390                             allmodconfig
x86_64                           allyesconfig
alpha                               defconfig
arm                                 defconfig
m68k                             allyesconfig
s390                                defconfig
m68k                             allmodconfig
x86_64               randconfig-a011-20230116
arc                              allyesconfig
x86_64               randconfig-a013-20230116
alpha                            allyesconfig
x86_64               randconfig-a012-20230116
i386                 randconfig-a014-20230116
x86_64               randconfig-a015-20230116
sh                               allmodconfig
s390                             allyesconfig
i386                 randconfig-a013-20230116
x86_64               randconfig-a014-20230116
x86_64                           rhel-8.3-bpf
i386                 randconfig-a012-20230116
x86_64               randconfig-a016-20230116
x86_64                           rhel-8.3-syz
i386                 randconfig-a015-20230116
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
i386                 randconfig-a011-20230116
powerpc                          allmodconfig
i386                 randconfig-a016-20230116
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20230115
riscv                randconfig-r042-20230116
arm                  randconfig-r046-20230117
s390                 randconfig-r044-20230116
arc                  randconfig-r043-20230117
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230115
ia64                             allmodconfig
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
x86_64               randconfig-a001-20230116
x86_64                          rhel-8.3-rust
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a006-20230116
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
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
