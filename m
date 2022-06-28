Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC02DC433EF
	for <ath10k@archiver.kernel.org>; Tue, 28 Jun 2022 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AlrEKB56NvrxE5upVX6rCKw5NweJeMhUiovUXgTGlRU=; b=zKEcy5iWuPtOZE
	ZlrtYaqZsLG7X2rQsdz/jqjkOAJjf/R6Hrp66ktbvyLg7lbPGgWPEmY+qMghfsiAGZlBG31LoGAV+
	14TWJQ4GdtiMuXPopy6eLKkkC9PAizot4QVDHDO6vqT9JOU1X0Abq3GJukx9SKd9NQzRYfNf6EJbG
	R8bpj7UlIfnMDyf6WORXchQ010Q4kWqANHmLzZoWVordLmOxMLcVEFFdJ2DbXBALC7kdrfkV9oeCu
	o7VurEPLyeaYMHkmQjcc3VUpSoxo5z378ZcSSgLNJzN97TacDtndKwj77R5LeDWBI2jZG+vqqx/jq
	GXN7ZVAPn1c07qQUcMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o650I-004o68-Hy; Tue, 28 Jun 2022 06:47:18 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o650F-004o47-63
	for ath10k@lists.infradead.org; Tue, 28 Jun 2022 06:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656398835; x=1687934835;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L8owAB5Riir90s8JGZcIawGVLFOnHUrxpgvbYcGyoiU=;
  b=JNBZEqGZzr0V454oR8P3BrpU3uqhTc+wmZ4FZxlmOeJriWAdp5S0rXUA
   2bjuQINW4eCR69FAUV3i0FZIH1Oc4vS6w1V4pHo3BKlm82ynheL7b4nDT
   AnRb5NgFv8VnSn6uzXfvzQC6w4OpJ5OZBfuE0l+Ec6iJMPAyVgoviBfxv
   Ds3yrcMFCB15LoDd9yL6rz4XQ0PUzvXlqYqS5qWAJD9fXt7f0hdVNbYjY
   mnRZsUexCYHkElPU+keDONUXTAe9YewcCDV5tHcllzmyPFdC6FgB/crNM
   EOLZv4fV+hTXNi4I2OfFsaRuTHVW6LtpsgzoFp99jbcV81ZTLfY3cZtrZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282388061"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="282388061"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 23:47:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="917048276"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jun 2022 23:47:10 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o650A-0009e6-BV;
	Tue, 28 Jun 2022 06:47:10 +0000
Date: Tue, 28 Jun 2022 14:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD REGRESSION
 0033f53f76c80130ad434fc3ea899a40b0442b11
Message-ID: <62baa3da.CrcWDW8eElQ4XwQH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_234715_533711_D136BE6B 
X-CRM114-Status: UNSURE (   4.73  )
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
branch HEAD: 0033f53f76c80130ad434fc3ea899a40b0442b11  ath12k: fix mac op start callback error handler

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/net/wireless/ath/ath12k/pci.c:678:14: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm64-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
`-- ia64-allmodconfig
    `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32

elapsed time: 729m

configs tested: 69
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-c001-20220627
s390                          debug_defconfig
arm                          gemini_defconfig
sparc64                             defconfig
sparc64                          alldefconfig
mips                           xway_defconfig
sh                        sh7785lcr_defconfig
sh                           se7750_defconfig
sh                         ap325rxa_defconfig
openrisc                 simple_smp_defconfig
sh                          rsk7201_defconfig
sh                          sdk7780_defconfig
arm                       omap2plus_defconfig
powerpc                         ps3_defconfig
arm                        realview_defconfig
m68k                          sun3x_defconfig
ia64                             allmodconfig
x86_64               randconfig-k001-20220627
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a013-20220627
x86_64               randconfig-a012-20220627
x86_64               randconfig-a016-20220627
x86_64               randconfig-a015-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a014-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a016-20220627
i386                 randconfig-a013-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a004-20220627
i386                 randconfig-a005-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a002-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
