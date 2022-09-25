Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE03DC07E9D
	for <ath10k@archiver.kernel.org>; Sun, 25 Sep 2022 02:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ulAtkxYDJPEARs5gWMpSu10r/RCTfuCwm1fNRkYV6g=; b=NsmN+yPQGnKlIn
	pfZBLtSLXWSz4lc0CjcRiTQmjdjGdLCzq456IEQKTL00KtzVk/dPYu5sHNSh8vdoOlABfE58oazzP
	tcmi0v8mHwTspd0cDLiZZwzPl63mn3KHW3jNwQYDhmPVWh4THIxYxdosObiNcaiLDjZ8W7KxbeRCT
	c/awjUjRJg/xVzm5ecjhYpl3PoDd2qfOh/6wmhUgENW20ftd6141Cazp9OpqL3NrmiZZiL3vc6l4y
	QiNATw8qjC07E13oQtWOs2mU+xq/Xdgn8sagoGKElFp35xae0rFHBtI3uQrcmXp5PRcuC92hwHugp
	u0ItBjuduj+5OnHYTVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHLk-00AOkm-8q; Sun, 25 Sep 2022 02:26:32 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHLf-00AOjK-Sm
	for ath10k@lists.infradead.org; Sun, 25 Sep 2022 02:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664072787; x=1695608787;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SORlhHlWN0oYfi1rAeag0gTqE4+0g3I2z7YDj00IDo0=;
  b=j0Wmp87bAkdLR6MxSo4co+NLnyq4sLaQe/rYgE5LiTFCxGOw19qWyQnO
   Us6E0iovczqTfgAheaeoFguaUyxEEU/EfC+Aiu/vtYl9FIay3JFQ0QaQT
   CnuXEgQsXGW8Kyw4W4h/wt/5Y4X/rQViD5Wwvfk2rgbWkT411VY/U1M0v
   EvnAPmNJDhYqLf/DxScy5cv7CIHO2sMgDyI6flM3mjAHYzWdMHLyV9Jrx
   r4AlEmKPFMyx7ye3hPFH9Pf09EIfRTESeiqP9JIIMVhS6M/uQLHNqZHEz
   VIcaUSw8Wu8nOVdFxtRHZ7RA6UQrMBnumEwTtNgaRbPmxjudJzrgqIHaB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="283938986"
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="283938986"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 19:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="746219881"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Sep 2022 19:26:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocHLa-0007Hy-27;
	Sun, 25 Sep 2022 02:26:22 +0000
Date: Sun, 25 Sep 2022 10:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 24f23bbc5999d899565ade22793410c69351de89
Message-ID: <632fbc44.YggtCdASeDjWEFs+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_192627_997485_DCF25751 
X-CRM114-Status: UNSURE (   5.80  )
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
branch HEAD: 24f23bbc5999d899565ade22793410c69351de89  Merge branch 'pending' into master-pending

elapsed time: 727m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
i386                                defconfig
s390                                defconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20220923
riscv                randconfig-r042-20220923
s390                             allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a001
s390                 randconfig-r044-20220923
sh                               allmodconfig
i386                          randconfig-a003
arm                                 defconfig
i386                          randconfig-a005
i386                          randconfig-a014
x86_64                        randconfig-a004
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
m68k                             allyesconfig
arm                              allyesconfig
alpha                            allyesconfig
arm64                            allyesconfig
m68k                             allmodconfig
ia64                             allmodconfig
arc                              allyesconfig
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
s390                 randconfig-r044-20220925
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm

clang tested configs:
hexagon              randconfig-r045-20220923
hexagon              randconfig-r041-20220923
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
