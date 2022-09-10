Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860B8ECAAD3
	for <ath10k@archiver.kernel.org>; Sat, 10 Sep 2022 19:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PruR641nIs4ifBCce24Iu3rI5msTPkLfRFf7wT4qzgA=; b=p/CtwwlRG8L+9M
	S/HncGC3sth6jBPGQZnBn/f6j1uiuJMa4XcjPCIv7F2f6ip20geeh5/T9g7MpRMNZBQSyZrhDTflf
	L/oGR2H8CwCZsxjX7B3t7VJ/b8pLgcxPJvLZ4KwYUIqbDU04yuK6wV9p/V3JtDoH87LQqMdaxoln8
	21Ia+UviieNFoBUoqYviEs9yYg0F3F7mibIzDSkOHQ4hl7ymafbsIRdTEM8XM/kVDD4Jx1GEf584F
	NGif/6SJPwF+xZK1nNYh8WEuvy4sbHAn2QTOsdvLjKTIIUwIcz8kUA2CakLdWwZuIZ32CH7usi/ph
	qsrGL2M2EoF2pNjfN+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6AM-00CbbF-JU; Sat, 10 Sep 2022 19:29:22 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6AJ-00CbaD-JF
	for ath10k@lists.infradead.org; Sat, 10 Sep 2022 19:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662838159; x=1694374159;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gawkIixx8+zmgH9VdcWU3mpIMeyJdse0V6lUhinjyCU=;
  b=IGKbaM+EhN7GyaI13lKsH6htwWYYlXT6WnisaN9b4US2tSFTVd1xu4nD
   vFMu3qAc8DpfM/41pX/vbYPS6CwUvQcMZedq6/rNPZeaDMazgRUl77BYU
   A1SXB+orh1RtbPdO13/jBtf+kRP2TRi9qHInNk1o/lHJOeKIDnlFpFicR
   py0olYunVCIrBxUkEFPVa95U60gVZEv/H4x4EyBdHLAQHvl6f15f/2VdA
   EvwrAlOGAO1W22lceKN9YBD9sxApZ5VucsAd0J/2LE0WX6JD+cbt/I7IA
   Xel1N3SDaZIcKTJv6+1bN/UZo7nYJQy6bBx87govbr8Htp97b/ODK5ekI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="298467898"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="298467898"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 12:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="944156497"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Sep 2022 12:29:16 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oX6AF-0000PT-1f;
	Sat, 10 Sep 2022 19:29:15 +0000
Date: Sun, 11 Sep 2022 03:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 f7b17e2d88c4c0b59039b221808f73e362c661c6
Message-ID: <631ce584.npcGXb5Sc/QflsZx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_122919_707486_8CDB1729 
X-CRM114-Status: UNSURE (   4.63  )
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
branch HEAD: f7b17e2d88c4c0b59039b221808f73e362c661c6  Merge branch 'pending' into master-pending

elapsed time: 728m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allmodconfig
alpha                            allyesconfig
x86_64                              defconfig
arc                              allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
m68k                             allyesconfig
x86_64                           allyesconfig
sh                               allmodconfig
i386                                defconfig
arc                  randconfig-r043-20220909
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
i386                          randconfig-a014
x86_64                        randconfig-a002
arm                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arc                  randconfig-r043-20220908
riscv                randconfig-r042-20220908
arc                  randconfig-r043-20220907
ia64                             allmodconfig
s390                 randconfig-r044-20220908

clang tested configs:
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
riscv                randconfig-r042-20220909
s390                 randconfig-r044-20220909
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
s390                 randconfig-r044-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r041-20220908
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220908
hexagon              randconfig-r045-20220907

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
