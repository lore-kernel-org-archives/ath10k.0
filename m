Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638B3C433EF
	for <ath10k@archiver.kernel.org>; Wed, 18 May 2022 22:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kDGA/BMmC5WkQ2K7/K981Vt8MYm7V2KkZhZmxJm3pxo=; b=O6W/NcQmaLkva/
	phH6WNTik+dSjAB8k3AvrUVLBq3gt6Nf5nKpdA1JRepArMBfW4fYnqj+Yjq0tXYj/qw1K9IgypXl4
	ChGW9ifQONXo+ikvUiYLQ6D4HmXO+/rxSLtX4qJsQmPeYN/7acQS6ay0ig3kQJfImNYWXx5JL9Si6
	cwpHJ8lTKvdIlGL0lIO68LT0EHk0JF9kA0V/ztp6zhLLKeR4w/5BhLHfWUZlVotBnGYTMs8o+N+0u
	+YhT0DzQG1ApibruXqDIvnkYANG9bi5yIbOnvf7fk/JliWmKyw1urkpbDQiaS5EOQb4+BdSOowxQV
	roFGuIvsqzYroKjmK1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrRns-0045Uy-BA; Wed, 18 May 2022 22:06:00 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrRnp-0045Uf-9i
 for ath10k@lists.infradead.org; Wed, 18 May 2022 22:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652911557; x=1684447557;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vkZmuk6gllgzeBzuC8TDhDe4st9V2hvlFWEegMfcpnE=;
 b=DSuK0vArUv0ssseGYNKF5+9E6hwClcCssyWSI9w9p3KgVduiSk6KVWcf
 jXBVBwfDE+R6U7KRDQcJFKzuE18LfH4YuTSk0nSBEdgsReiOzB40lf/qf
 10NSzkaqcrdKcuduLEZa0N/DOsas87lGusMD8sMRTy+ccrTAjPI3/66Yj
 C0+X5gBYmWlMY07SYWHlTFIxFfIq+aDwgPwMxHG/+yiGqdc0W4hT0vDal
 j1uyo0IOZtx5SFphpnCRAx9d+3B5R571yXhis7fkP5JQYHJnB7yeLotYw
 XdRbB6ZJua7IXL4Ko5Bu6EgZJeMgYFv5X4hsCPl9ZgztoETBSnetCECNX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="271603834"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="271603834"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 15:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="661385659"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 18 May 2022 15:05:51 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrRnj-0002g1-A3;
 Wed, 18 May 2022 22:05:51 +0000
Date: Thu, 19 May 2022 06:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 8f329ae0f58625307735dec33c76e348902f4c4b
Message-ID: <62856dac.tqVwM+/0VNAZaOCb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_150557_428485_8A829C1B 
X-CRM114-Status: UNSURE (   6.27  )
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
branch HEAD: 8f329ae0f58625307735dec33c76e348902f4c4b  Merge branch 'ath-next' into ath-qca

elapsed time: 868m

configs tested: 58
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
sh                             shx3_defconfig
ia64                             alldefconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc64                            defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                   microwatt_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
