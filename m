Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544BBC6FA8B
	for <ath10k@archiver.kernel.org>; Sat, 10 Sep 2022 19:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iRu4+bfH6wO3W3wayJtGAGTgsCq5cIA4IQ9pS9lQX30=; b=bUfblE5DbqpkN8
	B3TX/ORxa/nR1Xqwriiv+SRmReXcuZL1A5VCn9q61bc1GIdZFT3Nzx4V6UbHWWD7zG4v/GhUUEn1y
	5wY1+zzVdxpzeUu0r4kouxU7M4706fYo9M6oK1MRjVfNOZt3QAd63ICqGuVIrYaSvxx9AFj1QvzQ1
	RXj0zjqkFn4xighSgbagn5nVE78eWfv+vgFrntrP6OXePzEMoqJjX3A1Ch5YFfq3cpkbQXO0nTtdL
	3XC3FpbQc6OvTXAwsIf2gQJZfgQqEkjxP6qwoXIYyBzk5SAiXX/ChzQqWJw/JncLClA5dqdeb2FOV
	bsfEwC8x6CZi5FB/HXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6ND-00CeZZ-8T; Sat, 10 Sep 2022 19:42:39 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6NA-00CeYG-SY
	for ath10k@lists.infradead.org; Sat, 10 Sep 2022 19:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662838956; x=1694374956;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a9ew3NXrWSVr1aAiRJe3ezTCJ+6QTKkLTcrlu/J0ukk=;
  b=Kt7cDmdAyNcgFWYvbEdjRqVqrWFGI8FfLv7GSljiu6gFoslhB3jI11pv
   E0/vsINhmt48U64lqsP3EW0MDtUHukfXcTiApDuwapv3Unaj8wi4AekHT
   q6wVY98xRQo2ra0A3krEdPrZwbx1gzVLj2en3pGY/j3Ca5+DSQy8bGzTQ
   desxEpid2x6Ux/JfoVUtd7n5tfMZwuI1VgQlwN9a69bKJ3TL6YOlFLAZ4
   6fEa52w6kRcsRV86Wg74v9viUuZXZ++9bhjAAGIyG3qq0CsTwZPM6pY3N
   8jhL/EcGduOnGq2QtZARJN2pycTnW6H4LHlkNS8OLRmDMiz45A0TpFtl+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="323890907"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="323890907"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 12:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="593004796"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Sep 2022 12:42:16 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oX6Mp-0000Pv-2F;
	Sat, 10 Sep 2022 19:42:15 +0000
Date: Sun, 11 Sep 2022 03:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d773d379e135ecee28de092eca4b8e2ad1f5db1d
Message-ID: <631ce880.c4MaeZGi95+SYZru%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_124236_963987_9815328A 
X-CRM114-Status: UNSURE (   5.99  )
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
branch HEAD: d773d379e135ecee28de092eca4b8e2ad1f5db1d  Merge branch 'ath-next' into ath-qca

elapsed time: 771m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                              allyesconfig
alpha                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220908
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
s390                 randconfig-r044-20220908
riscv                randconfig-r042-20220908
arm                                 defconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a004
x86_64                        randconfig-a011
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a006
ia64                             allmodconfig
i386                          randconfig-a014
sh                               allmodconfig
i386                          randconfig-a012
arm                              allyesconfig
i386                          randconfig-a016
arm64                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20220907

clang tested configs:
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
riscv                randconfig-r042-20220907

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
