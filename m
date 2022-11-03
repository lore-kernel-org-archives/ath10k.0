Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23A0C433FE
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 20:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1LS+DMtEX+y1YnLypwDxCCJuzG0t6HpE2LK+H3ouTU=; b=lxaqWpLYroCrWQ
	0+NHSyhCTwf7owyVH+RTlkK4dBHSUhX2sZ4wC9FcFUHD8ECl9Pf9vkoYELnNAATbTcoqwRouYUhnl
	e1O4xbeTxXIcGMZahKQYVFI97u6tGjci3Teb/WK6rEevTr3B7KKnUOV9+KOU69zBFCTmqUhe8uBn+
	Mqug7t2JCfAiJTSKeD5W/zv7abOAOeMJjeeKdpUwczB8UgYFj1Efizk+UaPJSFJ9yAA95AVufJr3w
	zUanoWeKT+XpjUOo7OlOj6tLaV4Cewz6NNg+sJ8WJZorh4/OjwhdNNHqapuM0fk07Q4/4GzOmlPh3
	rwEdaaGboZMuzQJMvCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgnB-001dEA-JR; Thu, 03 Nov 2022 20:26:25 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgn8-001dDb-IC
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 20:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667507182; x=1699043182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EVcRzwXRVVVlFyw8OJ/HihqHsVCBvtlTbFxkEhVZ8Vc=;
  b=PzcdEZ3/72H96SUU8qNb3OVWwV4QUKgeTHYLTSNFnFypxAVUFCQiqSc+
   4a+SzIVDZCWg9l4Jf/TYJpn9Crn3K/fV8yQ3k0PtYM8pXFb3e7elpnReQ
   9Jq+gOPy0cIvSqKPeJOgxJeV5g86Lnq2qIgXjSIzYzlF1MGFhZhv2GV2L
   9EDZZU8FfGHiFv1c4qlTz5fyh5jNyC+vyZ9EOpvpvoADdfGiv1A0lNbOZ
   O2YZ5UQa8q6cSaFZnUYFzi60kiLRMZdWAJwlvmDoS6tGynxCa79OwcC/3
   CLjZWA+DmM0Jm9ASPsN/mjtmkiCgUEqwx0aa/RS9Rv8n6rOEGXqFtm/9W
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="396098348"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="396098348"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 13:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="585932504"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="585932504"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Nov 2022 13:26:19 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqgn4-000GIZ-2U;
	Thu, 03 Nov 2022 20:26:18 +0000
Date: Fri, 04 Nov 2022 04:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 05f841e6bde99edaec7f6f211d2403a7b2f6530e
Message-ID: <636423b5.T0ez7AUc5MeiNoSf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_132622_651268_9BE4D3CE 
X-CRM114-Status: UNSURE (   4.79  )
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
branch HEAD: 05f841e6bde99edaec7f6f211d2403a7b2f6530e  Add localversion-wireless-testing-ath

elapsed time: 821m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
x86_64                               rhel-8.3
i386                          randconfig-a016
x86_64                        randconfig-a002
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a013
arc                  randconfig-r043-20221102
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
i386                                defconfig
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
arc                                 defconfig
s390                 randconfig-r044-20221102
x86_64                           rhel-8.3-kvm
s390                             allmodconfig
riscv                randconfig-r042-20221102
alpha                               defconfig
ia64                             allmodconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
i386                             allyesconfig
s390                             allyesconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
hexagon              randconfig-r045-20221102
hexagon              randconfig-r041-20221102
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
