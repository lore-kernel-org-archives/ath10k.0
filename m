Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211FBC46467
	for <ath10k@archiver.kernel.org>; Wed, 30 Nov 2022 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mGZsQNyGS2ETGTp+IpkBLe4aVABMHc6jfGpUgSyffHY=; b=qbUusT8lk1EkhX
	W8gZDXz67LpPmM8H4LDIc86rT8D/bHbEqGEWtT65VQ11aa5v3Xjc/gFd3dnn5CwxKoCls7OJzcMIc
	+wmMf+hEISZGKZdN4+nRO8aKdJZc4q732ZB9TJrO3+NL0AQFcUaA1nKqMorqCOeZuU1Ni91gRDo2p
	1SeCWINg4EHQ5tqTHUM3sx1jc41bywefAF1+DBCaHvk683RMtUXgVxGajigGSqa8w1AvePvbClKxd
	OjH+yosFNZS3UJftNgShu/gnwkiByTUhPTVImULKZXYC2AC2QCRfve6F/ihZXdqnmegkuu0UE02OI
	gOFb3hW4WqJOM+ymlhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K4o-00FN6A-Ms; Wed, 30 Nov 2022 10:12:26 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K4j-00FN0j-Gv
	for ath10k@lists.infradead.org; Wed, 30 Nov 2022 10:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669803141; x=1701339141;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8ReUrmXRrMbVpFK8lM0ZLiAzPMxfl4lRJL/6ewgH2ik=;
  b=H45gSHA44nYhZWeDI5o6E/+rnwKloobkzTacr9rJHKe3ut8rW67gTjyS
   uxoEOK5FMw1s1K2iVwblXhT5uQ17M5joTfnVWSQe3XkyvY5TzYjztTVh2
   vr9yM0OTww/qP4d3xpYAZr41DJrBOVRpQyaNOUqLs6mWuPetGLmap0t3U
   0MIqfw1yUtSchKGnKZLi4jRwxp1ivAQ2WQVHzn1r0/8HqpqhAXau9wsof
   fsdkxFuNKx0FYKd+3yco3B+nX8cPxIg3dqUY60JZA6rZF8vXotWiJTq0E
   3VTvv6AwNbVcQDpVGwlyzWd5MiTZqaZXdKYTIeYcmZ+y5FjNPFyCvApfc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="314051538"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="314051538"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 02:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="646275390"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="646275390"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Nov 2022 02:12:00 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0K4N-000AyO-2l;
	Wed, 30 Nov 2022 10:11:59 +0000
Date: Wed, 30 Nov 2022 18:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 e7260785c20db2fe281c1fd13a89b6fa11a2da0f
Message-ID: <63872c66.+tvOVglqsFN9FwOL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_021221_643210_B00DE2FD 
X-CRM114-Status: UNSURE (   5.07  )
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
branch HEAD: e7260785c20db2fe281c1fd13a89b6fa11a2da0f  Add localversion-wireless-testing-ath

elapsed time: 1384m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
s390                             allyesconfig
arc                              allyesconfig
s390                                defconfig
i386                                defconfig
alpha                            allyesconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a005-20221128
x86_64                          rhel-8.3-func
i386                 randconfig-a006-20221128
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a004-20221128
arc                  randconfig-r043-20221128
x86_64               randconfig-a001-20221128
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a003-20221128
ia64                             allmodconfig
i386                             allyesconfig
x86_64                           allyesconfig
x86_64               randconfig-a004-20221128
x86_64                               rhel-8.3
x86_64               randconfig-a002-20221128
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a005-20221128
x86_64               randconfig-a006-20221128
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                            allnoconfig
sh                        sh7763rdp_defconfig
powerpc                         ps3_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltasmvp_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
i386                 randconfig-a012-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
hexagon              randconfig-r045-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a013-20221128
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
