Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDAEC00144
	for <ath10k@archiver.kernel.org>; Mon,  1 Aug 2022 19:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KkDiQjrHRnrI9tI6O8KcKZxDIknBdXNiO1Bh1Hur0po=; b=Q8gXSYy2W0KWMy
	/2Fu0iI8uDjTiUXw6HTPlmXj0RUypV+8tA6e7TarlB7X5gm1Whkn31ajMejPaDYXweF87kFUlgSuA
	cXq8Pvj0EPANmP3wIqtwWWEysl6Xkr7jWBjH30L91/aYNKe8Lcx2yMjIDRqg36Ax3EP3omyJMwZiU
	64yJhPpFvMrUF3khFS5SVt03KBEUgVYNHe5DFXfmfFWPCBb2uyOUy9G3jNRLsrOWkvUfifGGUmjjB
	PTXmWHpjjsAA34QAE7GhCswMxi/XQiiW6c+Fn09D/RppK4Vg9V4FC7UWlUMYJ8tdpsUThR3/WUk/s
	KliIoJzihlmUxwpOORPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIbJU-009wIG-52; Mon, 01 Aug 2022 19:42:52 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIbJP-009wEd-KJ
	for ath10k@lists.infradead.org; Mon, 01 Aug 2022 19:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659382967; x=1690918967;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dzxzI1fKFDLxlejU3t/RBUxihBuvlEJ5UXw5Cy4RKEE=;
  b=OEgXf62JUTAh5V4yng+G3rpG738MfH4WxEaSOnhqVeGTiQ3TEjhLB01c
   lEQzHtextCSwwtgiquVu8DfwSzBpf9BpyECGll59Hxn6vb533gtaYR/aO
   p2oMNf0xWPpG+fO8ECa1fPT6eIGDSJ2CFpm8OWwcF4Fx9IwqaI5LkTRvc
   ONF05rIZwLQO09w5Ftt/jIebuOVzLipui57eHrsjw71KkCWN/tekmI/qp
   MPwc64Eo/gRHDxoiNck+mKO2GyJhMrYwCIAXc/6LylAHIsnPa3S1aQejn
   pvK08DEMUHBr0PRrT6CSi3QcRMge31CWK1cRVzNpzea4x4WbDV7gQ1c1x
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="272274574"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="272274574"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 12:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="670167099"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2022 12:42:43 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIbJK-000FFf-2k;
	Mon, 01 Aug 2022 19:42:42 +0000
Date: Tue, 02 Aug 2022 03:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 43504fb867664d0e01b45a71e51404a3312df9b3
Message-ID: <62e82ca7.xTa46+cgF0BVufuX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_124247_736792_589FFDB4 
X-CRM114-Status: UNSURE (   7.61  )
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
branch HEAD: 43504fb867664d0e01b45a71e51404a3312df9b3  wifi: ath11k: Add spectral scan support for 160 MHz

elapsed time: 711m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arm                                 defconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
arm64                            allyesconfig
i386                                defconfig
arm                              allyesconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
s390                 randconfig-r044-20220731
i386                             allyesconfig
arc                  randconfig-r043-20220731
x86_64                        randconfig-a013
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
arc                              allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a011
i386                 randconfig-a012-20220801
sh                               allmodconfig
powerpc                          allmodconfig
i386                 randconfig-a013-20220801
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
riscv                randconfig-r042-20220731
x86_64                        randconfig-a006
i386                 randconfig-a014-20220801
x86_64                        randconfig-a015
i386                 randconfig-a011-20220801
x86_64                        randconfig-a004
i386                 randconfig-a016-20220801
m68k                             allyesconfig
i386                 randconfig-a015-20220801
m68k                             allmodconfig
s390                 randconfig-r044-20220801
arc                  randconfig-r043-20220801
riscv                randconfig-r042-20220801
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig

clang tested configs:
hexagon              randconfig-r041-20220731
i386                 randconfig-a001-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a005-20220801
hexagon              randconfig-r045-20220731
x86_64                        randconfig-a005
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a003
x86_64                        randconfig-a014
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
