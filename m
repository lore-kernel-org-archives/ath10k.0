Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158ADC43334
	for <ath10k@archiver.kernel.org>; Thu, 16 Jun 2022 05:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c1PkpbWlB7Dsa/+UJzm106D052oh3LgO1kr0scPQVnw=; b=WUdTlglERw4At+
	dwqY2zGdHp0yl9csy0F26qjrM3km3IEOVF1mLXNvVrSQ3OopSNtlpgek6ab+fjCF2EFiAczSwyH42
	Y+3sEGvra0z72LBUv/i/BQJE07C/UFrdPyz8CZc5R0AjtFPaysrmVSVKus+pm3M/de5V6aJwpba7C
	uztOhJwCKMSkBV26tGnSQ7ijQwAaqNXI9Kggpq9i7oFLGcE9+Wr4ouQ+oPWk4+kplEFAG0JZT9Daw
	ClHyKxPu2F7G7PH58U4YOf0hU9PVDue32RNDcxM0DBQJfDVy72F4ztsYed8l5dNT5XUETCe34CUab
	bKFNhNYy4HjJcRcLasXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iMN-000bCX-Bv; Thu, 16 Jun 2022 05:48:03 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iMK-000bB4-2K
	for ath10k@lists.infradead.org; Thu, 16 Jun 2022 05:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655358480; x=1686894480;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9kPLFnfJpNy0Xux+eU/QlDAaQK1wj+f/yHSD+JNWNf4=;
  b=geMEaSFoBlRpi6Hu0+nxr5fiILWYL+KvRUUVrDHH9Goq8gUdo8Qlg4NW
   mzDPjkcN/0WfNA5w/9XpC/mUenuLcxVHXGwiX32WFxvsYstjI5LPkhB8r
   kLRaW2ooeEW9MbJzGiDHeNUfQUQvVXWr4wUhO5x04qD0iUSSx91R25Si3
   AYaI/F5Uacz6dVujMMXG/R3zpDHXjtKqJmdWEOIinyGtLlGTApP3lSwF+
   OnALZ5bxU2po0pvSGT56wSoR/Mc15KP4dXTKsouqnk8GMVd4Op4x3UjW3
   WXzHIMeLm6GH5VnD6FlIRvHokMUC0cjnZnfYGUQ6fYXtqbTppQSQQCqqi
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259635463"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="259635463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="713236521"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2022 22:47:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1iM8-000O7F-J0;
	Thu, 16 Jun 2022 05:47:48 +0000
Date: Thu, 16 Jun 2022 13:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 25cfa2cb71218ad4687b744b26e621e42926d36f
Message-ID: <62aac3f1.DkxLdvPVfprMo4/3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_224800_173170_BB61FD8A 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 25cfa2cb71218ad4687b744b26e621e42926d36f  Merge branch 'pending' into master-pending

elapsed time: 978m

configs tested: 52
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
