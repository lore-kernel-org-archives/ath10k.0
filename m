Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F5C00A5A
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 01:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A58O36x3P5mV3RlvEzEIJ+J4/NqFw7qpi0z4drTwvuM=; b=mexQrN6IZt57Hy
	Ja6RH4A7MYiljzgY/n+xNTYAsc0vJ1lQ3zfGsoYnnmcq8elcFTo7UF7NJOflZeq9Ys3CHGZtuLRrf
	zRFzHLGyRLBce7iVwLbfAroWZ48ij79DfRfGZqlODmArHjtoeuFTTP9xb7tyM1T8aTq48XY46oYnU
	eyOsvDcAqey4TG8MPjK42MlzGrOhGij+HTGU1RChaY02O3j0bJbxoLUYCEe0HVGB1kEFrH0id6/0N
	oiPd1sZSs7a4XY/QkuPpvVgvhIavqIhWTkW8tW6OHx447parx06iTsvXlyqo04NssZNXJxFZakBjk
	sXcnoy3vTp9289DQFBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHx8W-00GSNl-L6; Wed, 18 Jan 2023 01:21:08 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHx8T-00GSMG-I9
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 01:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674004865; x=1705540865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FuclWI+xg7CtDAkLG6+LmhMb1cYlsAPu6dPqCm9CqHc=;
  b=V4+NNkUaxHt2uhMlPwmp5SLEjgbeFxxZ2gVGC4Ys6woyQ4CaXaH3Nu56
   pY77/QTLnwEFSQvugoojmsuBdPtcMg/CETH8FbUU/VlBp1wbIr13vyXv4
   Hdxdg6NobtwvMOMoel0H+0pYPc6jkUBi9g2sQ2iq1nn3PfaaKwHF56G+d
   hzTtSEKTAhCL08JeOeqbHNVL3KCSkUsB3GkvTuhx2dchoRz8u89ZGhu0J
   azfbYUllf/d4odgR1KRWpB1DYPlLkmZuEFURrcgisoVqRooLNn0zAe1A+
   s096lRGjlsbg8j9wJzlqH8zyQmaz5cAIDWxln4mywqwEK+aHAyBlpCMiT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352116329"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="352116329"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 17:21:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="801979448"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="801979448"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2023 17:20:50 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHx83-0001Wi-2L;
	Wed, 18 Jan 2023 01:20:39 +0000
Date: Wed, 18 Jan 2023 09:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 c02714e4c536679a7a989fbfd9c79d583a3eedbb
Message-ID: <63c7495e.Pajf3Nd5ULQYJucu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_172105_641568_07F03F1B 
X-CRM114-Status: UNSURE (   7.68  )
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
branch HEAD: c02714e4c536679a7a989fbfd9c79d583a3eedbb  genirq/msi: Free the fwnode created by msi_create_device_irq_domain()

elapsed time: 720m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                            allnoconfig
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
s390                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
i386                             allyesconfig
s390                             allyesconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
x86_64               randconfig-a011-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a014-20230116
arm                              allyesconfig
x86_64               randconfig-a016-20230116
x86_64                           allyesconfig
i386                 randconfig-a013-20230116
x86_64               randconfig-a015-20230116
i386                 randconfig-a012-20230116
x86_64               randconfig-a014-20230116
i386                 randconfig-a011-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a015-20230116
sh                               allmodconfig
arm64                            allyesconfig
arc                  randconfig-r043-20230115
riscv                randconfig-r042-20230116
s390                 randconfig-r044-20230116
arc                  randconfig-r043-20230116
arm                  randconfig-r046-20230115
arm                  randconfig-r046-20230117
arc                  randconfig-r043-20230117

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a006-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
hexagon              randconfig-r041-20230116
hexagon              randconfig-r045-20230117
hexagon              randconfig-r045-20230115
hexagon              randconfig-r041-20230117
riscv                randconfig-r042-20230115
s390                 randconfig-r044-20230117
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
