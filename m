Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BBEC00140
	for <ath10k@archiver.kernel.org>; Tue,  9 Aug 2022 02:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sCO3nIGk2noPe4fZoZTADoBzeZFOY5QO0bky4zZtRW8=; b=jrWdkTc7EvBnOD
	D78cCJ1u18AY1/JDs+zJtxve+zJ8rLz+WlPj6IXxSu4js3JpxB1JfdctzAfzDbsEHYoMcV8fiotNG
	90ia8SIYqBedOUAQifAu5RpPmVxaI531hiM6+7ZsWH6Qwej3QiExMe9Egv15KL1XUANipI3iZxXVD
	tz4pT7UWZujQaInoIEuautuaWNWTonjMIjz5MK5H9XyPTdKY0xRXzXD5BSvphPb49fQ6de9/M3++9
	UUESDhBtaBGJDF/7CjWVvfBv4ms+huzG+GFSCqoBJqncahWP2uJRiblAx/6kxmLMAx8YyKV0+7sub
	tg/1gffy+igoS38Us9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLEwR-000PY7-9a; Tue, 09 Aug 2022 02:25:59 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLEwG-000PTD-Lb
	for ath10k@lists.infradead.org; Tue, 09 Aug 2022 02:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660011948; x=1691547948;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ereOVY1XI5oYIO4CPj89PeX0iVgJjAH4eFOtg6CrAZg=;
  b=WkGQFSyna/wfkywdWyhPb74Vm9oho8KNqkGhn0i7zNFxuAQ8pWrkF2WZ
   5NPZLRtr3FTzhx0naIqic5Ki6fbEURkOeH88Mbou7dltsiJUo3CjOObk1
   xcrI1Qv5TKcgKTL2uv3qdQvCuNj1utMXl1scPUX9ZyComItYrxQcceOnw
   a3gjdAJQWGVsY30FPXUjTX6KIjuL8HZjbJNLLQP4NY6JKObYhbq6fez0H
   KP28vNYC00Xc2DwF/w2cBz2rG9ozM5fPQf/6sRcdgjzRGZ2lnefxlnYBR
   BOERT53CJ2VyJAVxP6yyK/vVrZKjEa9pxvUEIwwua5/6xu/GL3RDJLi+l
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="291523110"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="291523110"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 19:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="746873795"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2022 19:25:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLEw5-000Mev-1K;
	Tue, 09 Aug 2022 02:25:37 +0000
Date: Tue, 09 Aug 2022 10:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 fc2fd76526b5f75c7b525f1fc68e6df37da7f180
Message-ID: <62f1c595.rQaeZ+i9ZJkM7YIn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_192548_829772_68F234AC 
X-CRM114-Status: UNSURE (   6.01  )
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
branch HEAD: fc2fd76526b5f75c7b525f1fc68e6df37da7f180  wifi: ath12k: wmi: don't use wmi_tlv_ prefix in functions

elapsed time: 719m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
powerpc                           allnoconfig
m68k                             allmodconfig
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arm                                 defconfig
x86_64                               rhel-8.3
i386                 randconfig-a001-20220808
i386                 randconfig-a005-20220808
i386                 randconfig-a002-20220808
i386                 randconfig-a003-20220808
i386                 randconfig-a004-20220808
i386                 randconfig-a006-20220808
arc                  randconfig-r043-20220808
x86_64               randconfig-a003-20220808
x86_64               randconfig-a004-20220808
x86_64               randconfig-a001-20220808
x86_64               randconfig-a005-20220808
x86_64               randconfig-a002-20220808
arm64                            allyesconfig
x86_64               randconfig-a006-20220808
arm                              allyesconfig
x86_64                           allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm                             ezx_defconfig
parisc64                            defconfig
powerpc                 mpc837x_rdb_defconfig
arc                         haps_hs_defconfig
nios2                            alldefconfig
i386                 randconfig-c001-20220808
sh                ecovec24-romimage_defconfig
mips                      loongson3_defconfig
loongarch                        alldefconfig
sh                           sh2007_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                        keystone_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc8540_ads_defconfig
arc                          axs103_defconfig
sh                           se7712_defconfig
sparc                            allyesconfig
m68k                          multi_defconfig
arm                         assabet_defconfig
powerpc                     rainier_defconfig
sh                           se7619_defconfig
arm                            qcom_defconfig
sparc64                             defconfig
arm                           u8500_defconfig
csky                             alldefconfig
mips                    maltaup_xpa_defconfig
powerpc                    klondike_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                         axm55xx_defconfig
powerpc                    sam440ep_defconfig
sparc64                          alldefconfig

clang tested configs:
x86_64               randconfig-a014-20220808
x86_64               randconfig-a013-20220808
x86_64               randconfig-a015-20220808
x86_64               randconfig-a016-20220808
x86_64               randconfig-a012-20220808
x86_64               randconfig-a011-20220808
hexagon              randconfig-r045-20220808
i386                 randconfig-a011-20220808
i386                 randconfig-a016-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
i386                 randconfig-a015-20220808
hexagon              randconfig-r041-20220808
riscv                randconfig-r042-20220808
s390                 randconfig-r044-20220808
arm                       mainstone_defconfig
arm                   milbeaut_m10v_defconfig
mips                      bmips_stb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
