Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3DDC38A02
	for <ath10k@archiver.kernel.org>; Sat, 29 Oct 2022 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w9FmVoy+mYEo6RRmDxMS5aW6vlnrwXwYKsAnwGxr6fs=; b=BnhwcibpYZcB92
	3i98m2X3yyMAuOS3RrRl8L3drC0+jPTCq7wKbUs2jvnvfClIORUJTXiRPKzcKPW8BTNHKGzDzl9nx
	+4ieMRU7oRzl56jAqBJReynoTYBSwXJ4usjYZTWtinV+0RdgXJPPJd33kVhlf/G2tS6c48uUVgkMO
	k/vLCct2hlWyYdO4nZ9ksfAV69LUG0SCY7wsNlp75gLG3EbJ3Qv+JoJpPLYy6Nq9QOxZMHhtHddPH
	iZztOaFxnRFsLXfjOQYEu9zhHyHnDCCFnzwJk7/KhNERv6btwHmqOOVJiVdaoZBXscQLlZ3YLrpst
	Jy+B58UyNx7pIQ4tBLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq2G-007iEN-3l; Sat, 29 Oct 2022 17:54:20 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooq2D-007iBu-IN
	for ath10k@lists.infradead.org; Sat, 29 Oct 2022 17:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667066057; x=1698602057;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IwcN9pmDfeCKScJoHXIvwgikPOLhXi7Rr36fIDYYi08=;
  b=AIWIFYNVDGhLaN5xMCkuwr9HO/UZRtQpNNmSBmCwKI6ys4lJ6yCMF7j0
   xFcwORYaSJMGQBGtnllR5IIml3FwCp/7j0gOi+g2dFnOvCxbllIDIKW4e
   GuJB224ldJItAjris0j1fFppmQpKIT3VD0Q1B8DINHCxB4ikd6PCA6PfM
   ua5TtSMmdTCZxAsxjlAf9/p0590RO+/G+AnHQJq/Qwqjkt3oWdsRq6rqF
   taguI6fSgOUVsY5XJL6oNXUeh6zSZIx5gC9WAR6VXEMK+6heXadMXwlCI
   ZL6RFcATqdo8ay5JNotqod/H4bVWxriG9KEfbdX8bbPndJAFy4HcMecsg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="309770808"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="309770808"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 10:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="611073564"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="611073564"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Oct 2022 10:53:54 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooq1p-000BGT-2S;
	Sat, 29 Oct 2022 17:53:53 +0000
Date: Sun, 30 Oct 2022 01:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 a9501019f2de706eb43b59d66dcde70a23440cd3
Message-ID: <635d688f.ta2gzGlpPVjDS+Tp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_105417_683324_E2693B9F 
X-CRM114-Status: UNSURE (   4.84  )
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
branch HEAD: a9501019f2de706eb43b59d66dcde70a23440cd3  Merge ath-next from git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git

elapsed time: 721m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                               defconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                                defconfig
x86_64                              defconfig
x86_64                        randconfig-a002
s390                             allyesconfig
s390                                defconfig
arc                  randconfig-r043-20221028
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a005
riscv                randconfig-r042-20221028
x86_64                               rhel-8.3
x86_64                        randconfig-a006
s390                 randconfig-r044-20221028
i386                          randconfig-a016
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                             allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
i386                          randconfig-a012
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
m68k                         apollo_defconfig
m68k                       m5249evb_defconfig
arm                       multi_v4t_defconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig
sh                            titan_defconfig
powerpc                      mgcoge_defconfig

clang tested configs:
hexagon              randconfig-r041-20221028
i386                          randconfig-a002
x86_64                        randconfig-a005
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a006
x86_64                        randconfig-a014
i386                          randconfig-a013
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
