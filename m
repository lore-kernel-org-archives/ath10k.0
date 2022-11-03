Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE270C4332F
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 05:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AXKla9jYKDgFlvAaBSXGvHn2QnERQi3E3ltwLdRB6kA=; b=qJSUczl2U+OeoF
	XP1tZJ+ViVC9cSAHAdkoj4z/tZKyYmatnywLHsFEPV4k6N3bdZdahbo6Ds2OWdqB1crsKBvoZVnf4
	IN7iOGgWdrizqP49K4OIV57N67Dn9iATVEhc77yF5/8k8dWqZ9ElD1xto2F/+DPhtAJaZ0cJOkYFV
	xpZR73ourGAi4WHauU/RtD7WmviVwVJjXwtC8X7B4GSHmKMAO81KiKztTan3Un9VjPS901PrAkB3B
	neT6vgf29VbkHMweK/oWKtx65TbE/EGGve0zL8PjG+Qnhm8U+C0nzHclE7bdorLZSJZaNF+HEH/wX
	KRN4dNC+RwCMtnmhhfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5X-00GCnr-TK; Thu, 03 Nov 2022 05:48:27 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5U-00GCmU-43
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 05:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667454504; x=1698990504;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dg4+zXXA0O9BOjjaZSz6VZkQgIy1OPwlbu2ZrF17foI=;
  b=Q2i/5HrVg9GNYvcPNf6dAxxMEkTa27YGSJlhxLozszeQiEQFR4JB8aeQ
   jKyfRdWHZPhCxxvuRWCyiay7WMPARiYV0/utOg3oEIKP76Q1r4YvCL3WY
   gIi0hRBOR0YSeOyKRPwFs8tCVW3K0d6F2q1cn7a3x41KYYzSct2ucGgFG
   Rvrf5rY0gKPNTKhowwpdui/7KRRvtQeazFQKBCah3YNeMwBbQm36DN92s
   xNozOoGi5kb4OZ36b0HCFk48Y/ZoAREWp3ajGDld05o6IcVnK9fb07GqD
   v54Px7VBlWHVp5FmnUPfG70KMExEks1vzJifUWnqNyIYkiVlTnYS/jcl1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="311321074"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="311321074"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 22:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="809542667"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="809542667"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Nov 2022 22:48:20 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqT5P-000FYK-12;
	Thu, 03 Nov 2022 05:48:19 +0000
Date: Thu, 03 Nov 2022 13:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 62cf1271969636bbc7fdc429d223ca03a07b254d
Message-ID: <63635603.SrGuNdHQSrk6eQH6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_224824_232707_B25EC624 
X-CRM114-Status: UNSURE (   4.03  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: 62cf1271969636bbc7fdc429d223ca03a07b254d  wifi: ath12k: Endianness and bit ops changes in wmi.c

elapsed time: 726m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                           x86_64_defconfig
alpha                               defconfig
um                             i386_defconfig
s390                                defconfig
s390                             allmodconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
x86_64                        randconfig-a004
s390                 randconfig-r044-20221102
x86_64                        randconfig-a002
arc                  randconfig-r043-20221102
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
riscv                randconfig-r042-20221102
x86_64                        randconfig-a006
x86_64                              defconfig
i386                          randconfig-a001
x86_64                               rhel-8.3
i386                          randconfig-a003
i386                          randconfig-a005
i386                                defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a016

clang tested configs:
hexagon              randconfig-r041-20221102
x86_64                        randconfig-a005
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
riscv                randconfig-r042-20221103
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
s390                 randconfig-r044-20221103

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
