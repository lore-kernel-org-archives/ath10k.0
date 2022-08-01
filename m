Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24040C00144
	for <ath10k@archiver.kernel.org>; Mon,  1 Aug 2022 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W2bqQXsUDpYkc9Bmx9PNJJaD5YdbQzS3GJ0OGzlO8H4=; b=qKC/BqsEjqjJQE
	rDFwKdOAvTYKMHcTowIG4RITGAkbOETlCb7krA1PuILho/jLB4Vg6QW/dL2+4fyt857zBDz4PCfEp
	wabrXGHvipbFXXU6xUqp5GAZmX8AX1gIiK4JR+q36pqUMFjwLYmRjnI2G/9IVaesIh5HQbtqCavuJ
	hjpBgkjQ8xUwpJmNMebqIPd4gkh8BbYKj/w6MtSYgrLIB+hAh0y4AhkdaCFe30AWRdbBPEvYaYhat
	Vv+z+l2khXZ48xCT9MEtrijE6YwEgInenJqouF5S5LSlTaLI5IOxfZAnC+tl+r90LJuburALMGnho
	hI+Ps7+FfGSzQ6kRQ3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIbKP-009wqA-97; Mon, 01 Aug 2022 19:43:49 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIbKM-009wo3-CJ
	for ath10k@lists.infradead.org; Mon, 01 Aug 2022 19:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659383026; x=1690919026;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i9HhVKHcl17cVTNBbaTEDhGEgOd48GCJKZ28aD48Zas=;
  b=T9jcr4oNbRMLpI34qisYMEii692WPi/MA7sc6Vm18lT4knne5M6yNHpM
   1AvLr7A5zbiiUKBvUMZ2DHXjtHWEwFhGpjEKmr3atJcsPqxDKS6pYi5ce
   vxAVDScgFEHQwnx06dxPufDgwAnpUe6WDmvBsrq9GoNh/1NDotE17HUWI
   F+hPfRX+dyHu6TlHHTlx+P7mK5HuA2EA8+vKCK4Lswnc/pJfMzR0vgceu
   e7sS7x58bptaOvejSAnZ3cqEgZbPe4FLf0xKkt0Cauv3UqpC247JWWS4M
   wEWlYpZjU4z4SHBT9ARztSbPjyeEMUI8yVfGjCZfXx5pXBAoxuyfpai2Q
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="276137386"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="276137386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 12:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="577911627"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Aug 2022 12:43:43 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIbKI-000FFj-38;
	Mon, 01 Aug 2022 19:43:42 +0000
Date: Tue, 02 Aug 2022 03:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4e9aaf6337ce7b4be340c9a0439c7171a938e155
Message-ID: <62e82cd4.bwqMvk40l5hZRPEK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_124346_502754_C14A2DD2 
X-CRM114-Status: UNSURE (   5.97  )
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
branch HEAD: 4e9aaf6337ce7b4be340c9a0439c7171a938e155  Merge branch 'pending' into master-pending

elapsed time: 712m

configs tested: 54
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
arm                              allyesconfig
x86_64                           allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20220731
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
m68k                             allyesconfig
i386                          randconfig-a014
x86_64                          rhel-8.3-func
powerpc                          allmodconfig
riscv                randconfig-r042-20220731
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
s390                 randconfig-r044-20220731
x86_64               randconfig-a014-20220801
sh                               allmodconfig
i386                 randconfig-a012-20220801
i386                 randconfig-a013-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a016-20220801
i386                 randconfig-a015-20220801
ia64                             allmodconfig
s390                 randconfig-r044-20220801
arc                  randconfig-r043-20220801
riscv                randconfig-r042-20220801
i386                 randconfig-a014-20220801

clang tested configs:
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a005-20220801
hexagon              randconfig-r041-20220731
i386                          randconfig-a013
hexagon              randconfig-r045-20220731
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
i386                          randconfig-a011
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a006-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a005-20220801

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
