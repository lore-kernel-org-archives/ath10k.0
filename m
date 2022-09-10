Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F93BECAAD3
	for <ath10k@archiver.kernel.org>; Sat, 10 Sep 2022 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TetpbxpBNWvlkTDI0vPVDP1cXPVwv0nmsOY5pEkZvqA=; b=FJ3u26M3DMDW+5
	HaKLLkUf4EFOa3G+swtEWbfM3HZ8JVc/EKgJaH8cx8IPHiK+/++QQFZokHE1LmdeogkPIq2JP3PtU
	gkZE8TJ5Jjl1p7/iqu0lm/QhWqq1+AQuZEnKiu3/0WhCSyh5yJcALI/iQNp20yGgMv6iWlPXN/L+p
	ZCHQ0G5M4GCKarH9Kkg2Vhc5JdRt0WEcwmxlLPd1sLqrjPp5XItQMgc9y4zKBP8qOh29EhbrWPo3S
	1eJ/jeieCbFFo74luUdPMutg/KL1PQzSJhlYbz6MpS2u9xraOoUsJ4JkMtrz5RPJEDYdsGcvI0eY1
	zMaxh7upcoNBDMmwkOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX5bl-00CQeP-IU; Sat, 10 Sep 2022 18:53:37 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX5bi-00CQb5-C4
	for ath10k@lists.infradead.org; Sat, 10 Sep 2022 18:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662836014; x=1694372014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5jsznUS9VjsmqdKZ2oe4z7P/XiV19dRjPlVHjdJNDIA=;
  b=NEjxxv0tVpibEej5cqvyuUOfnOUBzXTKBmJAfo2ZOvGSwgi3Sa2Huapg
   CY7WUFY8I5EgK4r3s5h1aEuS2TeDImK7irzN3tDVCvM4HMc2MNguc+fTr
   LpRmmex2Nwqiopbr+YbLnvOJlL85zPh8DUhrox38OLhLMSJydA/DgdaYD
   wJ6zusYDe9nNWs7R/9xjGnAoQyVQepY+eay2N1s2sLYMLYoR7RMLq4ibv
   VGpX2SixwCOB7CXQIAlr5+4k/+x+HVldbp4eimLFd4tzQCcbNqqATVtIi
   RgApNZLmV0f0JhEQitNq2uOBJeMq3rIhvDWeKR7Bbg2a6cWUWvSOwzCvm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="277400701"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="277400701"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 11:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="944150629"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Sep 2022 11:53:15 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oX5bO-0000O3-2n;
	Sat, 10 Sep 2022 18:53:14 +0000
Date: Sun, 11 Sep 2022 02:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 97c9e37c7a7d7845b09035569da9b0eea196b1e1
Message-ID: <631cdce6.Qn9VTvE9lFUuhBcy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_115334_444149_155232B7 
X-CRM114-Status: UNSURE (   4.23  )
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
branch HEAD: 97c9e37c7a7d7845b09035569da9b0eea196b1e1  wifi: ath11k: Increase TCL data ring size for WCN6750

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
i386                                defconfig
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
m68k                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20220907
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a015
arm64                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
arc                  randconfig-r043-20220908
i386                          randconfig-a016
s390                 randconfig-r044-20220908
riscv                randconfig-r042-20220908
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r041-20220907
i386                          randconfig-a004
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
i386                          randconfig-a006
riscv                randconfig-r042-20220907
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
