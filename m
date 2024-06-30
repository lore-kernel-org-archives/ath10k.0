Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3A1C27C4F
	for <ath10k@archiver.kernel.org>; Sun, 30 Jun 2024 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yppqQ77eDxnVytbNmLrLyFXYSQKMqB50XQnw5pigShY=; b=iTh1x3WCvVuI8uLkOgGIUe4N8s
	8TI+e6/yZbi1frRsU+HP4/r00TUtc7Ft0ozbiWawC+3KCTW8BeAOekXB/+DnJQzwvAYHqTDmPEiDk
	Sx3VXbDJZVmmsxR62Q39VCVVuKs1zSIA00tP+1exyTI7cvO7KppjlDao2zJIgUJgn9aZztCb/CAUk
	Sgr5uKo2dXaa60MbcKGVkTWwB9nLwWee6buRbApaZPS/R8ALnMnb5KP82VPNeIxfot+dPiOMh1RYW
	VOqQFy5ZlbZfGBdNmhAYU6vY/ec5wv70wvMZpXtLqufVZH2okkN7mRtzyDc/ix7RcM8acKas1MAIy
	L5SbjdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNuBC-00000000POe-26od;
	Sun, 30 Jun 2024 13:01:18 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNuB9-00000000PNt-40lW
	for ath10k@lists.infradead.org;
	Sun, 30 Jun 2024 13:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719752477; x=1751288477;
  h=date:from:to:cc:subject:message-id;
  bh=g/GQtfa9LluakSWI08K5cT4oTinL0UPdPrIsGimP9YE=;
  b=PuFomvp6KWVM2uU9/v0NVvaBB7Gk3n3TTggRJjieStT8VJRDBiFGtdHo
   pXEbmd0cYvDqUQZQTsM7ypl9/3seAY4m87qnbVxuUAO0IpJT3k0Gk06ep
   NhVByXcsoKvrgLi1puaWuwv/WLLoCbGs503gHvpU+jsWg0yGwjgjgVzUX
   Sq/4L2hue2ZbSJT/XhLcufxXAsloEH8Bgz8MXH2vobOjTQLjBuFMlDyHu
   U/LF9d4ka/rGyS6YSGCakvyBMbmlyZtoI9yUSXgiD5I0M52eCfH7viWW0
   sgHDtg6DNLLpfZ5xQRatLM9XFdbzneqGcO2YNY4uHqKBeKLzIy9Qgy3Qf
   A==;
X-CSE-ConnectionGUID: BPQARv8kQFCL1PWOhvskew==
X-CSE-MsgGUID: wfGUny9QSJedVteSlYD7Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17096219"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="17096219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 06:01:13 -0700
X-CSE-ConnectionGUID: E5Dr5+CxQFK2oWP3cOMpoA==
X-CSE-MsgGUID: 6dEY3ay/TMqZgKbspDuCfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="45124840"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2024 06:01:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNuB2-000LcS-26;
	Sun, 30 Jun 2024 13:01:08 +0000
Date: Sun, 30 Jun 2024 21:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 9783e0407421a4dfc25e3a3001d0e0cff4236806
Message-ID: <202406302125.jUqH4NKB-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_060116_064143_79F9E753 
X-CRM114-Status: UNSURE (   3.79  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 9783e0407421a4dfc25e3a3001d0e0cff4236806  wifi: ath12k: fix driver initialization for WoW unsupported devices

elapsed time: 4050m

configs tested: 72
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240630   gcc-13.2.0
arc                   randconfig-002-20240630   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                   randconfig-001-20240630   gcc-13.2.0
arm                   randconfig-002-20240630   gcc-13.2.0
arm                   randconfig-003-20240630   gcc-13.2.0
arm                   randconfig-004-20240630   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240630   gcc-13.2.0
arm64                 randconfig-002-20240630   gcc-13.2.0
arm64                 randconfig-003-20240630   gcc-13.2.0
arm64                 randconfig-004-20240630   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240630   gcc-13.2.0
csky                  randconfig-002-20240630   gcc-13.2.0
i386         buildonly-randconfig-001-20240628   gcc-10
i386         buildonly-randconfig-002-20240628   gcc-10
i386         buildonly-randconfig-003-20240628   gcc-10
i386         buildonly-randconfig-004-20240628   gcc-10
i386         buildonly-randconfig-005-20240628   gcc-10
i386         buildonly-randconfig-006-20240628   gcc-10
i386                  randconfig-001-20240628   gcc-10
i386                  randconfig-002-20240628   gcc-10
i386                  randconfig-003-20240628   gcc-10
i386                  randconfig-004-20240628   gcc-10
i386                  randconfig-005-20240628   gcc-10
i386                  randconfig-006-20240628   gcc-10
i386                  randconfig-011-20240628   gcc-10
i386                  randconfig-012-20240628   gcc-10
i386                  randconfig-013-20240628   gcc-10
i386                  randconfig-014-20240628   gcc-10
i386                  randconfig-015-20240628   gcc-10
i386                  randconfig-016-20240628   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240630   gcc-13.2.0
loongarch             randconfig-002-20240630   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240630   gcc-13.2.0
nios2                 randconfig-002-20240630   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240630   gcc-13.2.0
parisc                randconfig-002-20240630   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240630   gcc-13.2.0
powerpc               randconfig-002-20240630   gcc-13.2.0
powerpc               randconfig-003-20240630   gcc-13.2.0
powerpc64             randconfig-001-20240630   gcc-13.2.0
powerpc64             randconfig-002-20240630   gcc-13.2.0
powerpc64             randconfig-003-20240630   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240630   gcc-13.2.0
riscv                 randconfig-002-20240630   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240630   gcc-13.2.0
s390                  randconfig-002-20240630   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240630   gcc-13.2.0
sh                    randconfig-002-20240630   gcc-13.2.0
sparc64               randconfig-001-20240630   gcc-13.2.0
sparc64               randconfig-002-20240630   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240630   gcc-13.2.0
um                    randconfig-002-20240630   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240630   gcc-13.2.0
xtensa                randconfig-002-20240630   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

