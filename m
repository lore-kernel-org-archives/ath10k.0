Return-Path: <SRS0=t6ZP=HY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6CCC433DB
	for <ath10k@archiver.kernel.org>; Mon, 22 Feb 2021 20:20:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F5764E2E
	for <ath10k@archiver.kernel.org>; Mon, 22 Feb 2021 20:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F5764E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtOkcfrZ1x2iw4W2zQ7xOZ1dAcMBwKQ9i+xSEu+Rq7M=; b=0otaYHcqtqjwwm0dWzZJrClIXI
	zvqtRtKIl+3V3HKhn6+Org6H/KI+UZ+fFD1BrEAtTuqW6s+yx/5vijtec9Eup+mNHKHl1OClywarf
	6P1Dd2Pu0YEuNopu46waSUewmwNnePY/5PFfHskNjMxIyLmmm8vW+5YLlch28Hyt4CpdwDBVedsuT
	DR8NoYEkxQZGNHZd8KODLwBW0qGt81PT6FeGHVDPf7Q+y0O/D68PlOxkIsf+LNVW87nArpmnAhva9
	W6r5pDXP91oAN1E8gNPVyTYeYn19dr0PDIcO2vwNW9EwKNJpFnsDLlnRwJgADp72e78wmh7Iyjn6Q
	CQmnsY9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEHgu-0007QJ-W0; Mon, 22 Feb 2021 20:20:25 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEHgr-0007Oz-6P
 for ath10k@lists.infradead.org; Mon, 22 Feb 2021 20:20:22 +0000
IronPort-SDR: R39jT9XXQ5PUayYuxY7HxsKmMtES0Em2cJUZUrJc/kfXCE7tHyJ4E3SHEbGIMQJtrgcNne8xSG
 Xu+RvXXFF9hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181137152"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="181137152"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 12:20:17 -0800
IronPort-SDR: YvTs1qUnDZAqsKBwUzJ8WWT8I9aLg1ArkcMnWIt3Nw/cvJ05OeWhgA/Pqe+aeYGQ0Vo2BQiZFW
 rgeGhN+JcBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="403199423"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 22 Feb 2021 12:20:15 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lEHbu-0000e5-Eh; Mon, 22 Feb 2021 20:15:14 +0000
Date: Tue, 23 Feb 2021 04:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 b157d227636eb4fd9854218c4802e8dab2eadf1b
Message-ID: <603410ce.xiS8TblHKP1+EiYp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_152021_403109_0D2538F9 
X-CRM114-Status: UNSURE (   7.86  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: b157d227636eb4fd9854218c4802e8dab2eadf1b  Merge branch 'ath-next' into ath-qca

elapsed time: 723m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         lpc18xx_defconfig
mips                     cu1000-neo_defconfig
powerpc                       eiger_defconfig
mips                         tb0226_defconfig
mips                          ath25_defconfig
arm                           corgi_defconfig
nios2                         10m50_defconfig
sh                             sh03_defconfig
sh                              ul2_defconfig
arm                         shannon_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
sh                         ecovec24_defconfig
sh                           se7724_defconfig
m68k                          sun3x_defconfig
mips                    maltaup_xpa_defconfig
mips                      loongson3_defconfig
sh                          polaris_defconfig
powerpc                          g5_defconfig
mips                          malta_defconfig
arc                        nsim_700_defconfig
alpha                            allyesconfig
powerpc                     akebono_defconfig
mips                            ar7_defconfig
sparc                       sparc32_defconfig
ia64                      gensparse_defconfig
powerpc                     ppa8548_defconfig
powerpc                     mpc5200_defconfig
arm                     davinci_all_defconfig
mips                         tb0219_defconfig
arm                        keystone_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                      makalu_defconfig
arm                            qcom_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                   lite5200b_defconfig
powerpc                      ppc6xx_defconfig
ia64                             alldefconfig
arm                            mps2_defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
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
