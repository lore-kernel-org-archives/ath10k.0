Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2760C433EF
	for <ath10k@archiver.kernel.org>; Mon, 30 May 2022 23:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k/OqvRgURJ3C6rQxYSsQjgs9T9iw9bV5FC/kYIFxasA=; b=XogZaNzIwcqIsJ
	SkceNuf4xFIhCdqQ2HOMR0KKsBdrdUCsoJV3R+27ih9oAah3oPBPaZN2LJmQShdzFjQQV3nTLh5NR
	t+D8RGmU42O5isreQQb4h4uLK2tyy3Sr9L98BMK4eYfrAfUFZl10yeM25+aMbEp45S9XcZ7kt5bTd
	3Pba1jl7RbYGdPzxBCgs9LK7SPBFbTDCGfDgfxv36TRroA20vPW6yX4yiCG0M/RMKkKx2/f2aVnKR
	2dLCBr2HNxzismZGTILV1Me7QYwVywnOTAYUX4QRplFK33xgGx642LDGcY7jNcNKn8rvUP2+mrbCS
	xLTAPQoBe+J2zhWE8JHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpGk-008e03-Nb; Mon, 30 May 2022 23:57:54 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpGg-008dy5-VI
	for ath10k@lists.infradead.org; Mon, 30 May 2022 23:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653955070; x=1685491070;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZYJjdGlcsySiCU2plOG+NDakY8gnqQ4BflBXFJoxFFc=;
  b=S4G0Mgy3xBXFNQ1m5ksLZxBrC+cAY6TOFtbXNUbTpAElzVQgMMiwwCgO
   beA8DIDEGju1gFXiEBoFkqUMR1pDgj8gUA/evEsaIkLtG3ZyST/QvV2O1
   hbaMXONv57L+9h8QKEofvJnz/l7RZ1pw+tXs9VEnMy3qL1KA8yLINKLN5
   6l6aGEZ+WHCfsa4R1cjvDE3WpSixKYOr3qFs+XqFeZuWjj1TKErtvny5o
   jqMSHA3tdedrC9FEJU+i7KairsVGgfE1+qtQHAb7MbVvI/K7Mqz/aB+Qd
   CTYOInzxENKktnRUGGWu41zRFptvipXyIshZoB7WQ0qpDDuwXCTeI9SUF
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="338136254"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="338136254"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 16:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="562081366"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2022 16:57:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvpGb-00026s-Gn;
	Mon, 30 May 2022 23:57:45 +0000
Date: Tue, 31 May 2022 07:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 7a3415daeb6893aa9f39b6edb0510e0ded979bd1
Message-ID: <629559bf.CGJjYDkl1aqnNYym%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_165751_100329_84EC1E89 
X-CRM114-Status: UNSURE (   6.32  )
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
branch HEAD: 7a3415daeb6893aa9f39b6edb0510e0ded979bd1  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 92
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
arm                           u8500_defconfig
arc                            hsdk_defconfig
sh                     magicpanelr2_defconfig
m68k                       m5475evb_defconfig
sh                           se7721_defconfig
mips                     loongson1b_defconfig
arm                            lart_defconfig
s390                       zfcpdump_defconfig
powerpc64                           defconfig
ia64                                defconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a002-20220530
i386                 randconfig-a003-20220530
i386                 randconfig-a004-20220530
i386                 randconfig-a001-20220530
i386                 randconfig-a005-20220530
i386                 randconfig-a006-20220530
x86_64               randconfig-a003-20220530
x86_64               randconfig-a006-20220530
x86_64               randconfig-a004-20220530
x86_64               randconfig-a001-20220530
x86_64               randconfig-a002-20220530
x86_64               randconfig-a005-20220530
arc                  randconfig-r043-20220530
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a011-20220530
x86_64               randconfig-a013-20220530
x86_64               randconfig-a012-20220530
x86_64               randconfig-a014-20220530
x86_64               randconfig-a015-20220530
x86_64               randconfig-a016-20220530
i386                 randconfig-a012-20220530
i386                 randconfig-a011-20220530
i386                 randconfig-a014-20220530
i386                 randconfig-a016-20220530
i386                 randconfig-a013-20220530
i386                 randconfig-a015-20220530
s390                 randconfig-r044-20220530
hexagon              randconfig-r041-20220530
hexagon              randconfig-r045-20220530
riscv                randconfig-r042-20220530

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
