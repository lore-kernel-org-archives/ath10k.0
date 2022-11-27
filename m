Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEE4C4321E
	for <ath10k@archiver.kernel.org>; Sun, 27 Nov 2022 00:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mAeaVotpnpd5WqUlXqiJA7XspvdUDdfSo7ZC6jDQGPE=; b=WPb+ps0JzsmHrn
	fsztykEYAPnicKmUBy4e0LsRVTHDSYI29C/BkVajCY6BKxC9hhxXAtumfT+f+Y4v9hlfn1jTGvzxM
	ruFQWjV3om0kG4ko38qgShkjNPaCTEDeWqlI2phvexZyCGsmxj3kn6uKJjMJEKrebFPjONnF97GJz
	qdzbQ7q/TLkCArc3EMHly9+tgnPVEJR2jGD7PzfkuiHa/sIKQ1GNaHGjQxdNbqOqPFKqmGK2dZAZV
	lUvpVLUqV8EGJl4mhWwr+R0lIopyE+0dvhgBoNF7oixvn7xQoyIkx7fx4qB6b+assriM9fqDIwCIE
	Mot9YGqrAGgS5zsLYIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz5hZ-008fjS-J2; Sun, 27 Nov 2022 00:39:21 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz5hW-008fir-RJ
	for ath10k@lists.infradead.org; Sun, 27 Nov 2022 00:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669509558; x=1701045558;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bAXlyiE4Z8mufYt7Ze5eHkGq3yr8lgfVm/uBG40VYuw=;
  b=M7kt4XyJOdXLFUEbLEd6xeKPYsh+S2bJbfFISFumQvIQtCR3vrfOLWBC
   DNwSl4idSQ9ZteC6QZv/BAoO1xxIN0VYtw8+0z4Wk/1bHT+UEsmXCYp2s
   utcUEAeDKDg7hdeThL4T7fSScTVFi3p98DhVk4NOESl33TP8RvoNXfOYv
   4SqlmTH7jyRAi9rCeOLgkNS309yoGD3QL7jBvyOvY1EiQxQSUG+bZ6FRF
   11Xz0I6IeSzLadJNGkfcXQJ1c1HWd9vhYxyjS/dL6CvhIDi0flw/SQIw5
   14+9LSSUXtFzJ8oP4GACp4hXsA5UnLvvklqkIlPZ7CH6/DVvFazavkR5V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="400923510"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="400923510"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 16:39:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="706383874"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="706383874"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2022 16:39:16 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oz5hU-0006g1-0N;
	Sun, 27 Nov 2022 00:39:16 +0000
Date: Sun, 27 Nov 2022 08:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 b0f6a553625557075e51db97369aae31491319c6
Message-ID: <6382b18d.W670bnpi7r/+DjeE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_163918_983939_DF150662 
X-CRM114-Status: UNSURE (   4.50  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: b0f6a553625557075e51db97369aae31491319c6  wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices

elapsed time: 2208m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20221124
arc                                 defconfig
alpha                               defconfig
powerpc                          allmodconfig
um                             i386_defconfig
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
ia64                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
um                           x86_64_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
arm                                 defconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
