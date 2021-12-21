Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB36C433FE
	for <ath10k@archiver.kernel.org>; Tue, 21 Dec 2021 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QYIKvKWlzgvmq8zoXlqS3dJ8QMAD9/fzB6cS0Jy7cA4=; b=plTWqGQ3zTIpZc
	39dLVWq7i3xqtR3ZASw5rYvLNZszmTHIM25d7UOafEaXx/beYey6NxDczesbxDYklK3aRj4PXE5pg
	GPkmxD+C5yF2wyvn+yVv+SsoaSVDSMJt0yVXNiw0LZDilmbPy/ztxSHjZfkIxzzWpPIlBBnRZ0KN4
	VBjMHJPuVCklqzVtojepgHmEXBOmpDLMUpP/MRmHMn7Zh5akH4sFP+sFpuGhtvd2LTOHmsLtvktkh
	TNJJRSS0dbLka1PLs4zP1ne0lXkT5Zx000klDqiL5uBJuNA2qyW/g2mSGrYbs3B7oITOYmoJL0jWJ
	ycSHsTCj6CqHaU9XCirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbKd-0066SR-PD; Tue, 21 Dec 2021 09:21:15 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbKG-0066Jh-Gs
 for ath10k@lists.infradead.org; Tue, 21 Dec 2021 09:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640078452; x=1671614452;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=+P9mKix1MKkSBEGZ5wmekAA6F9nDYymTe8JbYvMTRSk=;
 b=aL0Ikc/dZi/MA1aqT/mMYdbsLNdBPyOeRiETC7hp6l2iN8egDxvkn0uw
 AEA73zH+lYFSKKyFJSWjHUwECkR4ZmaZL6niPM1WF+E/NxnUL+/GXjMU0
 yHq/tnqgUICvY8EHdOW9YAO+k/lWhwufuxCdE8MNr/ina77Wd4ZMsGzyx
 RNSnvVFB8Dc76GFUGjQVtYArgxj8/XnOS5MUzVarkFT6ogU6EnDBePoy+
 OWg/L6Z4ohkCSkT3FNsjFkcgDY+Rk4hXxOSdIxBHVw/wwNa+TP+vXv037
 BqKH1R7C2CjUdA+MZxZn2iX8Jj++LRIkvCXQBlBcuQG2LDooE6AaDE9Gf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="220371188"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="220371188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 01:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="547954879"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 21 Dec 2021 01:20:50 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzbKD-0008uR-PF; Tue, 21 Dec 2021 09:20:49 +0000
Date: Tue, 21 Dec 2021 17:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 586c6295a767b441ef12f9190bd7b06c91329cd0
Message-ID: <61c19c6c.Njs7OQ4gXmzvsU3e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_012052_682438_3DDD518D 
X-CRM114-Status: UNSURE (   5.56  )
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
branch HEAD: 586c6295a767b441ef12f9190bd7b06c91329cd0  Add localversion-wireless-testing-ath

elapsed time: 724m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
arm                         s3c6400_defconfig
powerpc                      arches_defconfig
arm                          badge4_defconfig
arm                         s3c2410_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 mpc8272_ads_defconfig
arc                            hsdk_defconfig
arm                         palmz72_defconfig
sh                             shx3_defconfig
mips                       lemote2f_defconfig
arm                         hackkit_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                             sh03_defconfig
parisc                generic-64bit_defconfig
powerpc                       eiger_defconfig
sh                            hp6xx_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a013-20211219
i386                 randconfig-a011-20211219
i386                 randconfig-a012-20211219
i386                 randconfig-a014-20211219
i386                 randconfig-a015-20211219
i386                 randconfig-a016-20211219
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
