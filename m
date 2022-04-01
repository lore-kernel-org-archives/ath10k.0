Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A509C433EF
	for <ath10k@archiver.kernel.org>; Fri,  1 Apr 2022 04:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HmDs0WJoqQh/yqajEXXkdUVFDaqOh/A2aDkopzwtBy0=; b=C502Y6CtOFG2Zz
	racVcCXLpL7B7Z78v2eEzlPFqFvCYFks3vOOHviEIdB9Vt5OSk4YTjjQIEYk1MUba+7FN2Ay0oX7D
	pQI6DLOjv5WCFedM5JjkdgN+0S6RYvfSkOUrdQLxztch6YP+iCBW1DWhSRUHyoydH1i7Aa490ll9L
	Rvrj51wVoTxskh199zfVnxoIs/xRB5HXIqL03QkojFd1PZOEkhGG3vpWXamnaZlYBFSlySyBp1n01
	w8XZ1UnY6SwmLkb2NxPAlGZz/TuaYVHkyEu1tqZe75d6bSFtOdOP9zg+ywUboyFGWvabK58LzRxfW
	AJLJpcX2sjVv4DLPVLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na8tb-004Sdo-Qb; Fri, 01 Apr 2022 04:28:23 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na8tY-004SdG-KP
 for ath10k@lists.infradead.org; Fri, 01 Apr 2022 04:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648787300; x=1680323300;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=C1rvJxqDZDxTebb4ZztpNbUjwoES2dAEsur0V/zdXYI=;
 b=cHcIcqQ6LDpHggdOJwn59IaEhjjxE9lJlndijtF3mDL7w1CFfANIxm9j
 1V8jN2MDO8LQBR9AmpS/ks1Vg7kJaHWqWlYvwq6fBe6z3hPaBB1dpL0ri
 efFYowsHlf6pnTUbuILHNILkdU0wd4uSslaN2OYMfxyOu7YITWE/28bnT
 m3+EmH4va4GWLxv9188meWaqXoETQy4qCfoymFHDpaCCT/PhUFMuq0ojg
 wqCu2xxUWnJG5gZXkOqts4Qg4OKKibMpqqlfzJev6sEwu6mCcvYGKYcIc
 y4ZUuoDol8dgSjQHcTjfoA8ZaQKq3swTmLlef6/XiCtfD2EZiKOzAWmPH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260027483"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="260027483"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 21:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="567126171"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 31 Mar 2022 21:28:14 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1na8tR-0000wK-Mt;
 Fri, 01 Apr 2022 04:28:13 +0000
Date: Fri, 01 Apr 2022 12:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 310726a70f6142496bb4ea3f3bab829fb70383f7
Message-ID: <62467f36.OZOy2kK5kX3LroSa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_212820_795865_48EFB080 
X-CRM114-Status: UNSURE (   4.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 310726a70f6142496bb4ea3f3bab829fb70383f7  Merge branch 'pending' into master-pending

elapsed time: 946m

configs tested: 86
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
powerpc                     taishan_defconfig
powerpc                         wii_defconfig
arc                     nsimosci_hs_defconfig
sh                        dreamcast_defconfig
arm                            hisi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                     cu1830-neo_defconfig
powerpc                     mpc5200_defconfig
powerpc                      ppc64e_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
