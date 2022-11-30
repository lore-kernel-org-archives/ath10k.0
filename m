Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA812C47088
	for <ath10k@archiver.kernel.org>; Wed, 30 Nov 2022 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wnISGJTUvXHJ9k3E8KdLZJDSW37HS8ioBs1oczDfYPo=; b=2s/LpJw8GOjgRL
	QiL5utyLfEgjvuxEZO94KDD90fypYN09pl7zE380NJUH21mFWIFlVwrGRrKGze91IRmK0wSjPgwXY
	sl2y6NymC/51gZv8lArRZYlbWNaczToTQBagxcmkEe9tkB6Yon0ja1qcZaobchS4eCJAW3UqCKlxi
	0YbaX8Li22EMpw/X9ZiXc0E3DyiYs1kvJUPCDofE6njxtJc63eGRMeWOPvwxEsjbzqzHDNqMyLtxp
	vQ7NNZR4WCo6HBZPWIn4Jeq7RhBJe6UtVYjaxcolij07/HiDsH5Gj60Qxbxp3uRdmFx2lQK6JMOqF
	AY+1rUuNkkDYoFbfOirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K4W-00FMxa-Ua; Wed, 30 Nov 2022 10:12:08 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0K4U-00FMuL-2Q
	for ath10k@lists.infradead.org; Wed, 30 Nov 2022 10:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669803126; x=1701339126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Iry7qP0NpxwcV+FE+2zumATrHWxwipQFSCjW5+goGCw=;
  b=dYdSj3+tUAbZRNfkXygPQ7OsR2mv48sPXr2FX1HFF4IEf8Xk8HNVqP8P
   NGFpkoJK2QKhUmSaCWWtXO6tuUbFCDWHe5UTDl+1LXAK1NHrbSJdIPzCP
   ZMKOtpL94rnTKd4MwmHV23ySXGuudSnrcIaDLJzvPCbJiIMLHlIOzE8E+
   /xjClZDlsG/iG7lpEPYWw3wHeGcFSCT4vWjTVXVXDsOtG26LdOiC2my11
   XS3AM6we7T3NRBvIOZdOlT5zJkmR/TGpOo+keFThn/2qAp9jVFLKuCD4n
   qiEmcVYGvctvBzu990njgZ9hwTBzCwgEnVpoCrYQY83TAYK0zFZHDOv+2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="377516495"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="377516495"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 02:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="676770591"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="676770591"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Nov 2022 02:12:00 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0K4N-000AyY-39;
	Wed, 30 Nov 2022 10:11:59 +0000
Date: Wed, 30 Nov 2022 18:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 81d58526947b268e1af72296f4fc1357a93a6029
Message-ID: <63872c69.xpixr2nr5hxK5mdK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_021206_221043_72079822 
X-CRM114-Status: UNSURE (   6.05  )
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
branch HEAD: 81d58526947b268e1af72296f4fc1357a93a6029  Merge branch 'pending' into master-pending

elapsed time: 1361m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20221128
x86_64               randconfig-a002-20221128
sh                               allmodconfig
m68k                             allmodconfig
x86_64               randconfig-a005-20221128
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64               randconfig-a001-20221128
mips                             allyesconfig
i386                 randconfig-a004-20221128
x86_64               randconfig-a006-20221128
arc                              allyesconfig
x86_64                           rhel-8.3-syz
i386                 randconfig-a002-20221128
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64               randconfig-a003-20221128
x86_64                         rhel-8.3-kunit
i386                 randconfig-a003-20221128
alpha                            allyesconfig
arc                                 defconfig
x86_64               randconfig-a004-20221128
x86_64                           rhel-8.3-kvm
i386                 randconfig-a001-20221128
m68k                             allyesconfig
s390                             allmodconfig
i386                 randconfig-a005-20221128
alpha                               defconfig
s390                                defconfig
i386                 randconfig-a006-20221128
i386                                defconfig
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                             allyesconfig
x86_64                            allnoconfig
sh                        sh7763rdp_defconfig
powerpc                         ps3_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltasmvp_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
s390                 randconfig-r044-20221128
hexagon              randconfig-r045-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a015-20221128
x86_64               randconfig-a013-20221128
i386                 randconfig-a016-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a015-20221128
x86_64               randconfig-a016-20221128
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
