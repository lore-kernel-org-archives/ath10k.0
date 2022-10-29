Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C82FA3741
	for <ath10k@archiver.kernel.org>; Sat, 29 Oct 2022 02:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+MYwRiMwmXB9e5ZHRfpic8r7V7N2+sh8p7QBPBni3qg=; b=n6bJ0L2McGkYdd
	i5Fr2S/FOTj9v2Ca8sHkAntx7FdG5zddkK24KkGDHnr5XttceDUmiFlHsml5j3Q3/dsJ6SzGMvsEl
	vA3FhGS4xYyzOZD2jlIoiSpyYIC5g/YPtQU+ZoOwTbPphvxiNzC5yU1rt9kdPLIPdftQdl/d+yVV8
	1YNlzpKclrLUbzSuSvoZ50/Dvmntff17+SUahBxmtic4aSMob+2GQAo+1L7OcnGYg1lYxh0Mn1joT
	GRibg6FfL0kKePsHUDwdBnJpgLiYpl6/VFir/sA10uu490blJnBZN/g475RaeHuX+fGH8EwwOv26s
	OjLbgw+GyuF0akp4EnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oobVw-003cs8-QO; Sat, 29 Oct 2022 02:24:00 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oobVu-003cqz-Ez
	for ath10k@lists.infradead.org; Sat, 29 Oct 2022 02:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667010238; x=1698546238;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xlR8YwbfUg0jH8rfy2Vk8buX+EBqsv2eKDUOjRdQ/Hw=;
  b=KqOS02ZHdourWyGd2bHih0H8b1fv8wBodXb/WxXwTNvVThHJ/0M5Dqmy
   8Dg0hJWP1eVc7/eUs9SI1F7pro0Vof8HeYq+opdricMuHQ/0o12ILJkjn
   r0FYtTsF2/uPiyvlsUmLT4LNc87T3uZyYF+AmmoOnETdSiUm6Ci/ffSPA
   V5X17oGu5Wt+enSRXFmKovdnsfh7kaF5vfKPJgflKWS4UVOJwvitF5TKa
   m2WRnY3ssuCAqTfM52RDAUe6nYbB81gvPzCiVumjo/bB6Qc0EzAbS6Wnl
   VHfnxfB4LqIvLT2Ckrp8xllFPfdopHcOFwtNBAMUjHcQudIT/oeEuS7KJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372841033"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="372841033"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 19:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="584122147"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="584122147"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Oct 2022 19:23:40 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oobVc-000ASL-0m;
	Sat, 29 Oct 2022 02:23:40 +0000
Date: Sat, 29 Oct 2022 10:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 f3ca72b0327101a074a871539e61775d43908ca4
Message-ID: <635c8e88./uMFIdQjUGcPdW2T%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_192358_610199_92B31BB9 
X-CRM114-Status: UNSURE (   5.12  )
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
branch HEAD: f3ca72b0327101a074a871539e61775d43908ca4  wifi: ath11k: fix monitor vdev creation with firmware recovery

elapsed time: 723m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
s390                                defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20221028
alpha                            allyesconfig
arc                              allyesconfig
s390                             allyesconfig
riscv                randconfig-r042-20221028
mips                             allyesconfig
s390                 randconfig-r044-20221028
powerpc                           allnoconfig
m68k                             allyesconfig
i386                          randconfig-a001
x86_64                        randconfig-a004
m68k                             allmodconfig
powerpc                          allmodconfig
sh                               allmodconfig
ia64                             allmodconfig
x86_64                        randconfig-a002
i386                          randconfig-a003
x86_64                        randconfig-a006
i386                          randconfig-a005
arm                                 defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
powerpc                      ep88xc_defconfig
powerpc                       ppc64_defconfig
powerpc                      makalu_defconfig
arm                           u8500_defconfig
arm                         lpc18xx_defconfig
arm                      jornada720_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                           stm32_defconfig
arm64                            alldefconfig
powerpc                    sam440ep_defconfig
arm                          gemini_defconfig
powerpc                      tqm8xx_defconfig
i386                          randconfig-c001
arm64                               defconfig
sh                            titan_defconfig
powerpc                      mgcoge_defconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig

clang tested configs:
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
s390                 randconfig-r044-20221029
hexagon              randconfig-r041-20221029
hexagon              randconfig-r045-20221029
riscv                randconfig-r042-20221029

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
