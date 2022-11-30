Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934C1C4321E
	for <ath10k@archiver.kernel.org>; Wed, 30 Nov 2022 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4F6pTDd+qQaO9BpHzy5JNyOr3eEsVlnmwQSXwSIcEk=; b=PaitFaDCqA1ZEQ
	LPbG+4TLRh7IwS87Dwqg/S4rqQ69PcJlluisK7zi9krYfJswdXGoymnw5ouCGH9Xivg9F3C8bJc1E
	2f5cyCmwQ5WsgjgeqLwM1YyLH533gCQ3BAJaWH9tn/IjGfu6fgfo/4JXPvudWmZeLLApaKfnAdIdB
	37pJ25fxywUys7rXuXLNEQt/HvKIVv7a0JapknaARZSGe8y07EbzafOaGOILsTFZx1EFeH4NaeU/w
	y/bsH4TcCx0aFJpa+6xJ328rHSxbKULit6GcyyRKmiwfCd/kgFxMOnHD7q8TPRNkw0ihzOVkZY7bF
	Sp6kdPcRhB3WqDyCQAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JdV-00FBAV-3I; Wed, 30 Nov 2022 09:44:13 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JdN-00FB3w-Gm
	for ath10k@lists.infradead.org; Wed, 30 Nov 2022 09:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669801445; x=1701337445;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yzmV6C+VFbOgVQfmTg8gAJ1GiYq1LSIrdHqaRxpbjCE=;
  b=MvWU+PQSOUI9VbwgC8SOH9cQxwTZWxLjJN3wkixGquIhO++PkNQuS+oX
   vIP5xZt+oz5QPEhG8SltrF+14MQZikES7Dg51DjdXeOWw2hXqOPBsmbQs
   dSuhu9u7s79rIViUSLvEBydXO59IsJ5TsubqZGSInNhPp0Ec440ei88Zi
   2M+fKoNsKSj+Lb6yqrYTPO5Hlkp3CmjtlIALhoL5jBceBkQOi1hT9wiYi
   VOvEeQYq2MPGq7MIGdTbzOBCQnMa+9Om/Bq8i9t2LHtIGl8GrYaV90DD8
   DULAq5Xc1io8cF7D5TRgSE50wo5Dxny+8lDBppYByqX5krj73EqcsO7Ii
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="316505091"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="316505091"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 01:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="750271611"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="750271611"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2022 01:43:59 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0JdG-000Awl-2F;
	Wed, 30 Nov 2022 09:43:58 +0000
Date: Wed, 30 Nov 2022 17:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 84730e8a58684fbe42373b9d8aba7e88f2bb0396
Message-ID: <638725a4.kfeD/136KQOIstKA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_014405_673855_770A823B 
X-CRM114-Status: UNSURE (   6.63  )
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
branch HEAD: 84730e8a58684fbe42373b9d8aba7e88f2bb0396  wifi: ath11k: Fix race condition with htt_ppdu_stats_info

elapsed time: 1331m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
powerpc                           allnoconfig
um                             i386_defconfig
m68k                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
mips                             allyesconfig
arc                              allyesconfig
i386                 randconfig-a002-20221128
i386                                defconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
arc                                 defconfig
x86_64               randconfig-a002-20221128
arc                  randconfig-r043-20221128
x86_64               randconfig-a001-20221128
i386                 randconfig-a003-20221128
x86_64               randconfig-a003-20221128
s390                             allmodconfig
x86_64               randconfig-a004-20221128
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a005-20221128
alpha                               defconfig
i386                 randconfig-a001-20221128
s390                             allyesconfig
i386                 randconfig-a005-20221128
s390                                defconfig
x86_64               randconfig-a006-20221128
x86_64                           rhel-8.3-kvm
i386                 randconfig-a004-20221128
x86_64                               rhel-8.3
i386                 randconfig-a006-20221128
i386                             allyesconfig
ia64                             allmodconfig
x86_64                           allyesconfig
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
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64               randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a016-20221128
hexagon              randconfig-r045-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
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
