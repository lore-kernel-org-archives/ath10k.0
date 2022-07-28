Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36D7C04A68
	for <ath10k@archiver.kernel.org>; Thu, 28 Jul 2022 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VadXhxDtntCK83KL4QwCBxlQD9ec8feE44Aod54wzx8=; b=tsGna4HWuEqb64
	A/eB0g5PUT74q/azEB6Lorzvp5CitPXXnkScDx3pJJgAleyXHxmaCOeGRmuT6ZE9Tpi1jBkoRpppN
	AVHX/tG3FAYZp6CxVxoMu+EqeycTVFdjuPTcw6YMJsJ++Slc0VCCMnCfY/RtotPzQvSPfwwUgA8g6
	Na4MlGpzYIdzES5oiKuGAylcKmjThMNwkeGqQvcpKrbipwBdCK0rbvP4ofV+kVpUFnpuJbngR9ftY
	NOSnU8+2c5/knYVtDGZWF2kCyGbEhrr2eOBMzToiGWUNyRHxrVurvhE80hDFCW7jxMhYcU5RrMX3a
	YZ2A/10B5J2UHEPriBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5rJ-00Aicb-Jg; Thu, 28 Jul 2022 15:55:33 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5rG-00Aib1-Rd
	for ath10k@lists.infradead.org; Thu, 28 Jul 2022 15:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659023730; x=1690559730;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wFi5LxLRVXMcHnSh+w28EaYTy6irRjieu6+b9FMAuA8=;
  b=CWTBZoFjWjhgxyNMDJhS8cc0W5i2aGjKkQ1+YQEW0gba53cdAD6/WAaE
   10Z/T/ZK+bVpGnNJyi/lDZukUulc2LK2z98FjG0QUCgUkf9ULPZCPp7mv
   QDkPAbof8Loiqf7RrCEiLrR9UqkapO/7GrgHB6cF/6/H1GVoGydbjNpPa
   zhKsYnTXCSrhKBsUqgmg/2zBQ5zCA9qma2vSvsStzIlkcdAk+diWi8KZd
   EK4+HIloMWBfIzQ94gRYdYdhJKkB4qgogRFRNAHiRnISkcMw4S2wckDxD
   pBtYRkeVJXGQ9+7ULV1QmTVLDczt1I6KHrW+s2cBYegGcHrQxvQHkMRbt
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="350251590"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="350251590"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 08:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="576529662"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 08:55:28 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH5rE-000AJy-0B;
	Thu, 28 Jul 2022 15:55:28 +0000
Date: Thu, 28 Jul 2022 23:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 efcafbf252edcdf19893788474538e0d852ec874
Message-ID: <62e2b154.RaLwkEoQZRfPWABb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_085530_996693_06F3EAB6 
X-CRM114-Status: UNSURE (   4.12  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: efcafbf252edcdf19893788474538e0d852ec874  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 1740m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
x86_64                        randconfig-a004
i386                             allyesconfig
arc                  randconfig-r043-20220727
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig

clang tested configs:
riscv                randconfig-r042-20220727
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220727
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220727
s390                 randconfig-r044-20220727
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
