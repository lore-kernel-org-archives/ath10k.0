Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57EAC433F5
	for <ath10k@archiver.kernel.org>; Fri, 30 Sep 2022 22:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BJQMyyTXKAJh+gne2rvDtxgVT6t92mmhbITDkDw60Kk=; b=EWK0yZ8aDXrI/D
	hEmH8jWjenU3c52UMn67MdHa4N6kOs/ZsBDYTYlf0LchvjSgbW5fXNujNk8pKrsdi+AzrU0wwA/9L
	ffKKnIKOz5SwnF3IgcADLcc9SRy6ZFYi5i110MV5L8/zS4GIA9XBuvdceHQG5+ZZnCHY4FgZIukG3
	iSdQPlA2BzLfBYsmlFGLWE3l5LdDbvyru+IyzqabuPkmXbAY7ctTZ0VjirtyYHwY2PaJW+0GUll/T
	4Nr9c5OOX+JLVu1kz4wTKZ19aHtg/ApyYzve9pubU5U180HNLcwf+voibTcbq4BvVQGvP+WjP4T9d
	ohOna0Mx5BgQcrHqx3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOpr-00BxtP-Oa; Fri, 30 Sep 2022 22:50:23 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOpo-00BxrU-QS
	for ath10k@lists.infradead.org; Fri, 30 Sep 2022 22:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664578220; x=1696114220;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pZjEQfzjM+zduiFKFM+owYO5fCzKapdFijOVIk+DzrQ=;
  b=PEwHF0jawwRR8QXc8xv9GVo8pp5YAXszITDXslH8v0HJjQc5cYhXj+4v
   U+rBNlewbK2kkrbOtZL9+3TcBxoT1IhWzey3/DZt4WJaterb/O0hhvN81
   7NnyHEISYp9U+lygR7XzVl5hT78Ihxl4fuvl758RoVf1tn4668KCYOGQf
   EE639awmqT9kyUcfuvHzHGjCFASd6cinp4ge+5G2sKeJhORMg2qr0a3bk
   Urw0Igf8nG4ZmjcYnzslvtssHB7CuqMvvZDC84RwRnfN8k9tLcjuRBfxi
   pXnPRg7B20bfX/TiLxG83ExJdvRuu5/c3Pu1x/dByBISYOt1ekoKhD9s4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="282675674"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; 
   d="scan'208";a="282675674"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 15:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="656112015"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; 
   d="scan'208";a="656112015"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Sep 2022 15:50:03 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oeOpW-0001cd-3C;
	Fri, 30 Sep 2022 22:50:02 +0000
Date: Sat, 01 Oct 2022 06:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 15bc43a23ac0504a2a99fceae4a31b8bf37ec8fe
Message-ID: <63377263.5SSU9F4+9jEXAIWv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_155020_922220_553B48AD 
X-CRM114-Status: UNSURE (   5.83  )
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
branch HEAD: 15bc43a23ac0504a2a99fceae4a31b8bf37ec8fe  Merge branch 'ath-next' into ath-qca

elapsed time: 947m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220926
arc                                 defconfig
x86_64               randconfig-a001-20220926
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
alpha                               defconfig
x86_64               randconfig-a003-20220926
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64               randconfig-a005-20220926
x86_64               randconfig-a004-20220926
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64               randconfig-a006-20220926
mips                             allyesconfig
arm                                 defconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a002-20220926
s390                             allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20220925
m68k                             allyesconfig
i386                 randconfig-a003-20220926
riscv                randconfig-r042-20220925
alpha                            allyesconfig
arc                              allyesconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
arm64                            allyesconfig
arm                              allyesconfig
m68k                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a012-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a015-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a012-20220926
x86_64               randconfig-a014-20220926
i386                 randconfig-a015-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
