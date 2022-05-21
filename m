Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C111FC433F5
	for <ath10k@archiver.kernel.org>; Sat, 21 May 2022 05:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TpEQuYYewM9Ry3cEbCeq1AhHX7HuhFWdohTMtfTu3Ys=; b=XSIJ8iQpsacp6o
	OahbPU+oJmtpo+0b3lMDX+7b36KE7MD+BMiOQNn0q/yHdy5q9lIqnvnYXjxftJs9HmtTWhK5RfumL
	u+F8jPN7w0Y9werppPYqsm85yTLB10LA5RBYSjbQ+hkvp8bLEid8/qHunMI/j/NYBTIkcOoF4Cqqp
	PmEcTemcbU6ltFg2LYZW+TksWjOfr3vqP+Mtmfwb+JNw4a3CHq9qXWLZ1/Y/yLOt8AYXgw6f84zLF
	5Yt1nBKcf5bfC6I3JNSuNobcYi4I/aDqyKKtAajkqKg7fiwZ4jX5bDOiTM51Av/778/DCYR/b0SLO
	xmsefekZaiAsvfXhphRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsHiP-00FZCD-2g; Sat, 21 May 2022 05:31:49 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsHiE-00FZ9V-Br
 for ath10k@lists.infradead.org; Sat, 21 May 2022 05:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653111098; x=1684647098;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Gb55S2wJv3pf5ylDzEElZhl643YLPekIQEPRflxILH0=;
 b=FK3r8KSJ2x21OYbqtLlZS4AMtbWxx3hI/kXfpNgSQid6HgY5mLnugj4a
 UyvGM01/cBhiF/TyjCMPOg5O1ch7Y/y1xEPURnHxPoTLPBuai2s9+KUGP
 BbTki/oh+VsTE/yeqSAACqXz53uIyeRLq98YSqnFOMgmnzetTNCsdMm0D
 qHclMoJaE/Tki6hfDl5vk+r5UaTkVrBKVtLYBhYnABTKNoFbZC5EGOPgg
 9ZGzarCo8ZbQrNYHUsc/j9oUH3OPzCfw/ZONU5kPWJz1ApcD9emTgE6lJ
 nm54WgvzJZVQJwdWOTJ4j4l0sKx9cX7sUyP+jH/WUJYYHBEepdZLo57G9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="271636405"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="271636405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 22:31:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="662604938"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 20 May 2022 22:31:30 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nsHi6-0005yO-2h;
 Sat, 21 May 2022 05:31:30 +0000
Date: Sat, 21 May 2022 13:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 fdb8fc34a6fbf8c7614f222cbe1176a0598f1941
Message-ID: <62887930.LQTkr1WAnq6iSKYY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_223138_465347_BBB46917 
X-CRM114-Status: UNSURE (   5.34  )
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
branch HEAD: fdb8fc34a6fbf8c7614f222cbe1176a0598f1941  ath11k: update missing MU-MIMO and OFDMA stats

elapsed time: 4195m

configs tested: 58
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
sh                             shx3_defconfig
ia64                             alldefconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc                   microwatt_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
