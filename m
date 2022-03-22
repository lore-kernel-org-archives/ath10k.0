Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A896FC433FE
	for <ath10k@archiver.kernel.org>; Tue, 22 Mar 2022 02:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=InMcckcn9F/nn5GaKHSZvu0JryV2Q4spDOtvtXhaNEs=; b=b/H+eeZBK310QJ
	uK7yGaNKHHR4JeP7vhGzL8RkJ6hhZFYheyCNxXZyMPvd0RkjXVFTE4R/0s7jCt8bsqipxMpO7Tlj+
	6EeCbuLAqq0rt6uPDRkA+YrxMt5hztAuqLRq+Jz++6w4W0g3zfE9ikSoY/CH8mOKWK3twex10SYuJ
	QA7qg2FxO5JCpH9uQDTNaqXDopVR/Z9rUy+I7LrnF0IILgG5RwWT2n5UZLs9EORs5oiDkzEUe+kUK
	NOcCnQI+Q6UmsT7lolcIL2nEjwEgpl2QbtAu5Ae5fuWhqEGybi2vbs8longAo65L2vQQrZ+M+MPwt
	C2wLl/OZJpemnmkuZ98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUiW-009nqv-Tm; Tue, 22 Mar 2022 02:57:52 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUiT-009npk-C0
 for ath10k@lists.infradead.org; Tue, 22 Mar 2022 02:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647917869; x=1679453869;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=S4xbYVQWYdKSPV37k3vOuiqPU0wOCKDqm4nlVSS9RJQ=;
 b=MzkAASoz2H4IqkqmLnCTRbhiVc804eRofGUKLvn91qs/0l+YLxktiLSP
 ZpkOf4a2ZsoEwNvyCrgB+AUVbGy0/eLRE7XdrkGILoAdW9H4BcowC7v4l
 NcOn9GA2Rjh1otNJTlgYW1TLKNFkkXZLWAOc1eVTawooXpBWiKRY8Jt+T
 ZmGss6RsF/mbMdlt5jtIrK/kKytY/RmkeTM6uo9PrWk+RlV//DbD6+vlg
 VMylci58HE1SWeGS6bjpwm7H8Q6zEz9Qwf680OvhdGaimGKIEBahVV06m
 R2IAwLI6FRHC0rEiaiqUnFCO/601jGrBEDfnM767KIwvQbxW3vmUXRq+e Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="238312554"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="238312554"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 19:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="551942603"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2022 19:57:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWUiM-000IOW-Ni; Tue, 22 Mar 2022 02:57:42 +0000
Date: Tue, 22 Mar 2022 10:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 b748057f80c32e8a3c86e7a28239c1181fcf9f44
Message-ID: <62393b07.IDpJGNg4uFCDMA7W%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_195749_478656_318BBEC3 
X-CRM114-Status: UNSURE (   4.57  )
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
branch HEAD: b748057f80c32e8a3c86e7a28239c1181fcf9f44  Add localversion-wireless-testing-ath

elapsed time: 722m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220321
arm                          lpd270_defconfig
arm                          exynos_defconfig
sh                         ecovec24_defconfig
powerpc                   currituck_defconfig
sh                            titan_defconfig
xtensa                  nommu_kc705_defconfig
ia64                      gensparse_defconfig
sh                        sh7785lcr_defconfig
sh                         microdev_defconfig
h8300                     edosk2674_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                              ul2_defconfig
um                                  defconfig
m68k                        mvme147_defconfig
arm                            hisi_defconfig
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220321
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                                defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a013-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a016-20220321
x86_64               randconfig-a015-20220321
x86_64               randconfig-a014-20220321
i386                 randconfig-a014-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
arc                  randconfig-r043-20220321
arc                  randconfig-r043-20220320
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                      acadia_defconfig
hexagon                             defconfig
mips                          ath79_defconfig
mips                       lemote2f_defconfig
mips                        omega2p_defconfig
i386                 randconfig-a003-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a002-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a006-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a001-20220321
x86_64               randconfig-a006-20220321
hexagon              randconfig-r041-20220321
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220320
s390                 randconfig-r044-20220320
riscv                randconfig-r042-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
