Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FD5C4332F
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 20:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJ0B8UITcx3/OIZqU7SBC2eLTZvFAUwJIEAnNEYGxbk=; b=ZsMGeTXxhdMAhX
	urPozZuBh4kxpI/sYPZ/R8ED5EPpRUk62Ty6bHdSLgFlmUBDOF+VfqPST6iEAoCqDNuEytEdGmb81
	QMk+H4KST66Pp61xjXimNfp1I3DxfGXWAy8z1BTi973n2aUM4t5/LOoHKVWx1dU3VDk4/qKDxIU/D
	JUXW0zkEVdvzAHZKquJu54QInpD6JVv4CdPL4JUno8jLQac7TnT+rRd/TOG98ZwJ1VBWQvBXgs2Hn
	xKAp/E9R/X+xcwnqtMRzW9vvsJTa1bUU7BO3iiOGSQbRHoNBEjAv3/Vz6zVj+e+4y0WWzvq/PVb04
	fpthz8uwZ+tozC1Jxa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgnD-001dEQ-5S; Thu, 03 Nov 2022 20:26:27 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqgnA-001dDr-ME
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 20:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667507184; x=1699043184;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LJEB1qFoS3Rz1fzbSG/TSYkgd/S50MPHB525lu3RGog=;
  b=FsFtC06vdcUkUzGGBl9t/N/HYxnLGvAmKF9a5COXEUr0zmZi2ES68G5L
   Qnqb7ptypgU5RhC2JhOeBfXyCpsDiNYMZpU22/ftSPV8UgtLCeg9L4LXz
   2n1PQDARBhE4x6YURddB29dDCXwr9yAOzj5EXf8Xm8rbEeSmncGaiYmmZ
   maPIJrQKeHODsgL59BuWo8cb96F7bk71o52pGJrMtQkIAsXxUNRNf1HC7
   Kr1jFl9jec1K+ClUeW+R9Qf8FZORHjokDC2fGGQNlRIt+CE7GSilJEids
   RycquyfUJKFbwNb1fLZriOHNhLbX45RHZOgRMy2aN9A59r6vdh+g9YHSU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="371900498"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="371900498"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 13:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="612794590"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="612794590"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2022 13:26:19 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqgn4-000GIX-2O;
	Thu, 03 Nov 2022 20:26:18 +0000
Date: Fri, 04 Nov 2022 04:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 93c1592889fca46d09d833455628bab05516cdbf
Message-ID: <636423b3.HFJsZIM514X9Rlke%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_132624_791132_891C5045 
X-CRM114-Status: UNSURE (   4.01  )
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
branch HEAD: 93c1592889fca46d09d833455628bab05516cdbf  wifi: ath11k: Make QMI message rules const

elapsed time: 822m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
x86_64                        randconfig-a011
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a015
sh                               allmodconfig
arc                  randconfig-r043-20221103
arc                                 defconfig
ia64                             allmodconfig
x86_64                        randconfig-a002
i386                                defconfig
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
alpha                               defconfig
x86_64                              defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
s390                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                                 defconfig
x86_64                               rhel-8.3
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a005
x86_64                           allyesconfig
arm64                            allyesconfig
i386                          randconfig-a016
arc                              allyesconfig
arm                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20221102
s390                 randconfig-r044-20221102
riscv                randconfig-r042-20221102

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221103
x86_64                        randconfig-a001
hexagon              randconfig-r041-20221103
x86_64                        randconfig-a003
riscv                randconfig-r042-20221103
s390                 randconfig-r044-20221103
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a015
hexagon              randconfig-r041-20221102
hexagon              randconfig-r045-20221102

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
