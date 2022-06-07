Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DF8C433EF
	for <ath10k@archiver.kernel.org>; Tue,  7 Jun 2022 02:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sS8M2vGAMT5Yt3Txu3QY5F+Y9YEyiYgPSV+/+lfqU4E=; b=zwx/cdP5PLfq3R
	qxXFcyQo5LlI4qUgyLGaorCWckujXW0kOTPxuUlaGCbH3+rCsJgczL442W9iHIZMJvr6QAoH7lZG4
	EvXPvuPlBrx/Hm6v9/oda8/cpRRyTuf6w6nO3gaAPTxZQ+4G5RT8euUyIX8AI2CM+JjqhLn1qOp8V
	HOOQbvsI3I+78IByiJDPnfBxBoW2oufzHsk8avqVA7IXE0+LvdxvsV4OAdSkuLjbgdH+ZVlUqHLQF
	7cW22KPokv/qorXEhIiMNHA2/s9o8AXo6O0zZOyc+RvbMsWyExk30OL+7tqTSTbWnS5uC0wR/FI83
	Ule/bFpVltZxh4r/pSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPRh-004EVp-D7; Tue, 07 Jun 2022 02:59:53 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPRe-004EUB-5q
	for ath10k@lists.infradead.org; Tue, 07 Jun 2022 02:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654570790; x=1686106790;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IXPokxiRvUtwjPgjCOjyma2RBwElBeuRpaSKtr+3bo0=;
  b=GQ2cXop2ZRv3puDU0xxz01CxPgYE9xD0xRFt6tSkZXuRARbRy74nS0SP
   s9HLJj0fBtJecIhIeSGkfT9Q7z1CpIKtZvznCkdVadSexhIf6tRQufpiP
   +UtFl0eEwGzLQS9Po59snjW4S8smriQFbIMH5FwRXrnaNawduzk7HD4pm
   P3QfWAjGn+tsQMhByZFxDbk9OFhcDzonpKclTVKjWwzZ0bvDET0DlZjn4
   fW7rKqgwicQHrg/K2x2cnTQSIqci5vezs9qmDT6dqgWrtLgloU1eSodKA
   go+QmqRqxeDX86eOdgj+upfQwnSA0+XIkfSF8semBfOpem/FBsjrulkj8
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="259297197"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="259297197"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 19:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="635906747"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2022 19:59:38 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyPRS-000DGt-2Q;
	Tue, 07 Jun 2022 02:59:38 +0000
Date: Tue, 07 Jun 2022 10:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 da558ec077c00a2bf55709f65d0f9d74d561dadd
Message-ID: <629ebefe.O2+Q5D860jOy31VM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_195950_347693_F006F7A0 
X-CRM114-Status: UNSURE (   5.90  )
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
branch HEAD: da558ec077c00a2bf55709f65d0f9d74d561dadd  ath10k: fix recently introduced checkpatch warning

elapsed time: 726m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
m68k                         amcore_defconfig
arm                          pxa3xx_defconfig
arc                                 defconfig
sh                   rts7751r2dplus_defconfig
sh                         ap325rxa_defconfig
arc                     haps_hs_smp_defconfig
xtensa                generic_kc705_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     taishan_defconfig
sh                            shmin_defconfig
sh                           se7750_defconfig
sh                          sdk7786_defconfig
arm                        mvebu_v7_defconfig
ia64                        generic_defconfig
powerpc                    sam440ep_defconfig
powerpc                      chrp32_defconfig
nios2                         10m50_defconfig
arc                          axs103_defconfig
powerpc                     rainier_defconfig
arc                            hsdk_defconfig
arm                            qcom_defconfig
openrisc                    or1ksim_defconfig
m68k                                defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220605
h8300                            allyesconfig
m68k                             allyesconfig
xtensa                           allyesconfig
m68k                             allmodconfig
csky                                defconfig
mips                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
mips                             allmodconfig
sh                               allmodconfig
s390                                defconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                             allmodconfig
riscv                          rv32_defconfig
parisc                              defconfig
parisc64                            defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
parisc                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
s390                             allyesconfig
sparc                               defconfig
powerpc                          allyesconfig
i386                             allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sparc                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
um                             i386_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
arm64                               defconfig
ia64                             allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
x86_64                        randconfig-a011
i386                          randconfig-a010
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a008
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a007
i386                          randconfig-a005
i386                          randconfig-a009
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220606
riscv                randconfig-c006-20220606
s390                 randconfig-c005-20220606
i386                 randconfig-c001-20220606
mips                 randconfig-c004-20220606
x86_64               randconfig-c007-20220606
arm                  randconfig-c002-20220606
i386                          randconfig-a002
x86_64                        randconfig-a009
x86_64                        randconfig-a007
i386                          randconfig-a006
x86_64                        randconfig-a010
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a008
i386                          randconfig-a004
x86_64                        randconfig-a012

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
