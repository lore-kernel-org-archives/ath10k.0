Return-Path: <SRS0=h0BU=HZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BC9C433E0
	for <ath10k@archiver.kernel.org>; Tue, 23 Feb 2021 04:06:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB07564DD0
	for <ath10k@archiver.kernel.org>; Tue, 23 Feb 2021 04:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB07564DD0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1B4Zfr4o/bezOZbX6inNgmpL9A76v8CmFsQ0v/glLdY=; b=iHwBdw9o3o73wpT5XdRCe3bfQd
	85Xlmxace0rxLu6TyEK7aSM42fwvT+ZQYSK0dChRg2080FNaSHxNjgXU50IaINojFGQpHqztqmWjE
	Yy1lnNgys/hy9uFxVDQrNlMHUhlyleMEcqgSY8DQIByWNeUHTfvrWhz5nJO4tb5VNy01BchknZS78
	jB7fUmLlMJavjxBmSKUUIcxHZpRA9RGyHNCWRwgrMAx9VsIhSgMPE8oBf9F/gtQEtYTGl33s2NEn8
	dxAuoPHbBAhMnsfn8hZCyEtkMTXM+LFQajI3uJxeOlnptQ55XAzUSz2qZPqe3rGoZ0l4e2aSuubXY
	LRdUGfNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEOxC-0005oL-4Y; Tue, 23 Feb 2021 04:05:42 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEOx8-0005n8-7V
 for ath10k@lists.infradead.org; Tue, 23 Feb 2021 04:05:40 +0000
IronPort-SDR: cjvs8O7lHyUFykGKL4wAZKLgghaW4LSuuBzU8V9p6uFy/LG/idbocIsdHH0fBJorbP1I7ZhTlZ
 07DihTyz3BOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="183973939"
X-IronPort-AV: E=Sophos;i="5.81,199,1610438400"; d="scan'208";a="183973939"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 20:05:35 -0800
IronPort-SDR: fzt5twADBHsC6PSceZrz2L8dul6N1QkDB0AiFFR8Ehgcq4nTHMZ0e5GzWGAXKoyfEmfdZXpypa
 haqBELi+xGMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,199,1610438400"; d="scan'208";a="364337737"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 22 Feb 2021 20:05:33 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lEOx2-0000tT-CB; Tue, 23 Feb 2021 04:05:32 +0000
Date: Tue, 23 Feb 2021 12:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 8e704a7bca9c2f43dac2be3437ff895112365b4c
Message-ID: <60347ed9.KibhTSB93gX8P8s1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_230538_512884_2D7BBE41 
X-CRM114-Status: UNSURE (   6.25  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 8e704a7bca9c2f43dac2be3437ff895112365b4c  Merge branch 'pending' into master-pending

elapsed time: 726m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         at91_dt_defconfig
mips                     decstation_defconfig
m68k                       bvme6000_defconfig
arm                       versatile_defconfig
arm                        multi_v7_defconfig
powerpc                     akebono_defconfig
x86_64                           alldefconfig
mips                            gpr_defconfig
s390                                defconfig
powerpc                 mpc836x_mds_defconfig
arm                         hackkit_defconfig
powerpc                     pq2fads_defconfig
powerpc                     redwood_defconfig
powerpc64                           defconfig
mips                          rb532_defconfig
mips                            e55_defconfig
m68k                       m5475evb_defconfig
powerpc                      mgcoge_defconfig
m68k                          sun3x_defconfig
arm                        multi_v5_defconfig
arm                          simpad_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                        sh7763rdp_defconfig
sh                   secureedge5410_defconfig
sparc                       sparc64_defconfig
arm                     am200epdkit_defconfig
openrisc                            defconfig
arm                        mini2440_defconfig
powerpc                          allmodconfig
arm                       spear13xx_defconfig
sh                        sh7785lcr_defconfig
powerpc                   motionpro_defconfig
s390                          debug_defconfig
arm                            lart_defconfig
powerpc                          g5_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210222
x86_64               randconfig-a002-20210222
x86_64               randconfig-a003-20210222
x86_64               randconfig-a005-20210222
x86_64               randconfig-a006-20210222
x86_64               randconfig-a004-20210222
i386                 randconfig-a005-20210222
i386                 randconfig-a006-20210222
i386                 randconfig-a004-20210222
i386                 randconfig-a003-20210222
i386                 randconfig-a001-20210222
i386                 randconfig-a002-20210222
i386                 randconfig-a013-20210222
i386                 randconfig-a012-20210222
i386                 randconfig-a011-20210222
i386                 randconfig-a014-20210222
i386                 randconfig-a016-20210222
i386                 randconfig-a015-20210222
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210222
x86_64               randconfig-a011-20210222
x86_64               randconfig-a012-20210222
x86_64               randconfig-a016-20210222
x86_64               randconfig-a014-20210222
x86_64               randconfig-a013-20210222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
