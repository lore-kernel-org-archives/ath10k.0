Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C5C433EF
	for <ath10k@archiver.kernel.org>; Tue, 26 Jul 2022 06:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6k9RsoTeC/S16COsnp4fH4W2no4lF/o9J32XC206z+M=; b=pmuElIzPvK4K9F
	2bJQl4lY0HRnN1ux/xbptXM83lfYp856SA/SFnaV6BO88pBk92qUb+ApnIzn3+H5+8qo9Wadf4ooV
	jed4LA3v4VmLIpMVMM9GjRFb4yhrF811Jr6Y/O92OjycMVsQBP45qG+VbiGFq478cpDuqnyh22CYe
	0IJrOKs5tWDxrFtMn4XXqTqB3vB++LfQr3+1mw+D+vl8ps8woROpkqxBhQEmZWN0l14T3aHOaF4f9
	WRL/vm4qj7VJkvR6b5zw730zYGhFUbZzffhnziT4oJNF9Smwbhun85GKE6yvMnBjob03jYcYeNm1P
	FXfgQWStv9LzJWA5psOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGE6j-008stQ-WC; Tue, 26 Jul 2022 06:31:54 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGE6g-008sqC-Rd
	for ath10k@lists.infradead.org; Tue, 26 Jul 2022 06:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658817110; x=1690353110;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UtO003WR/3XHFOluIhKETwwM8v4Gf6zDdr8yp1R5JHk=;
  b=DqbZBM/0luK4rWiFLYCSKu3cRUegFeFBQB6BJ/T+vhZhea1Jx70XeXOI
   f5cmWx2/9pwq9D+GrRkxPbfP5NjhcIJ5UkyT6F81dXfBOd5c55dTwYavJ
   Wm+JrCIvTgfs1l33gW4AAADUroMSQdhXYy0YICkAHyEUvqNpZTgdQrmcG
   IZWY6D2HrViSwC8xvAfhP6mQEImPWDwQXyzu0X2yNlNZqNa8oqH4fZDlk
   jHuhO0Xe5vp9X9YqipAsImbKHRhE0CfLlpCAAW8xeXnpnDYfwUfb8C8Pv
   khXmcw27PJsGOhsBpz5Ceyiemrw9DzftP4FeSjL5smmi5nuBvxxZvXX9Q
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="289061713"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="289061713"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 23:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="927207762"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2022 23:31:46 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGE6c-00069A-09;
	Tue, 26 Jul 2022 06:31:46 +0000
Date: Tue, 26 Jul 2022 14:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 34eb684bd60e6a8a1ab9a5f2b141a67563eb22eb
Message-ID: <62df8a21.r2bFSZZ93ykyn6Ma%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_233150_973213_49741FBA 
X-CRM114-Status: UNSURE (   4.83  )
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
branch HEAD: 34eb684bd60e6a8a1ab9a5f2b141a67563eb22eb  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                             espt_defconfig
m68k                                defconfig
mips                           gcw0_defconfig
mips                         tb0226_defconfig
sh                     sh7710voipgw_defconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220724
arc                  randconfig-r043-20220724
riscv                randconfig-r042-20220724
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                      tct_hammer_defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220724
hexagon              randconfig-r045-20220724

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
