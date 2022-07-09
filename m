Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D14C433EF
	for <ath10k@archiver.kernel.org>; Sat,  9 Jul 2022 04:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SPX4ICUKyRptMfqmUl4Gaykhx1WViL6iMa2xfMhOy80=; b=FCir6602iLMbq/
	aQ/s5hq2Hw8FdH/Uw45bHg8BCuo4s87VBpOz3pm0XgcUSwFwNywi2cCCAwJSlROVKwzX/6lHbVRxJ
	zfVWYqY43DHNp+kihMJ7DEHrbfqy0YPQI2CJUKWl5ji9R4WWpsjPP3b1wPQBTG9bevoek8dakBX/R
	MZr82mILKE6LUpli72QotQE4/hvuer8wRCKmbp5vfS9p8ctUoXgsg0/q0G08bG7EAYHKfvpZBcwzC
	khG7i77hQ/7UUCgV7BWijHz/eBTRIqH7a9Pt4W9nwypmhNecZUlWVZZCIwkzJbXkzQgzeJc0Fqnnn
	bA6wJS7LTxNat5HO3TYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA2TP-006zeh-DI; Sat, 09 Jul 2022 04:53:43 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA2TM-006zdB-0e
	for ath10k@lists.infradead.org; Sat, 09 Jul 2022 04:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657342419; x=1688878419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HN6kA1IvEISftu664YUNo5IcRzyDQ9R1N0o24Hfg59w=;
  b=P83NvntXfvFdKE+iDWoJlTsIlKmImO3HS12zftrs/CDHgWyc/l4uOFw6
   yQ/vxi82dVT6cCrmBcnMY541nDuAIoqdZ2necQo4AZb/3l0SdwHasMGRM
   l1cismb/5l8DJwRrjUQpB0EkgeNHphyP+keUE/q/Nin6+BmXXFO3PRYlm
   ZOESe9Df9kZ821XTUkGOCUeGJD9uUOcyW58pCPDfh35ox5A1yfaRwbdze
   SISR8moJVON2G6fq+h1jE8+dolDLvuYNvGM457z8chc81wni76tMesqnK
   z2cSZrkryY1rxV3c9VrwnzF7bpgriNB4XpSfpnUTTBZhD9pJenGrCV6lv
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="283162130"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="283162130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 21:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="921214418"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2022 21:53:24 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oA2T5-000OKL-Hs;
	Sat, 09 Jul 2022 04:53:23 +0000
Date: Sat, 09 Jul 2022 12:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 1864645005a3616b57f99e1578cff64cf0be93c0
Message-ID: <62c909a0.OA4QvJloNkvON6ur%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_215340_103638_29251CBC 
X-CRM114-Status: UNSURE (   4.08  )
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
branch HEAD: 1864645005a3616b57f99e1578cff64cf0be93c0  Merge ath-next into ath12k-bringup

elapsed time: 864m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                           corgi_defconfig
powerpc                     ep8248e_defconfig
powerpc                 linkstation_defconfig
arm                         vf610m4_defconfig
sh                           se7619_defconfig
sh                           se7712_defconfig
sh                           se7721_defconfig
sh                           se7750_defconfig
mips                         rt305x_defconfig
alpha                            alldefconfig
arm                        clps711x_defconfig
arm                        oxnas_v6_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a004
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a006
riscv                randconfig-r042-20220707
s390                 randconfig-r044-20220707
arc                  randconfig-r043-20220707
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
