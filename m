Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC03C433EF
	for <ath10k@archiver.kernel.org>; Fri,  8 Jul 2022 05:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U3Og+gyC+vQknbYaPEANMKuomThiccscdnHtTNpaiYM=; b=F5Ea4s7a+7x753
	uHeEWNMXgLiCKjlo8j+X7hSwMc1tYx+X/Rhs3Mg6b+k1gM8q3a4DnJP9Wn6sJMDXYAi05wfJ8EpR/
	RNRTTKLpTQn2y+TdZtOw5Ce0Xo4cFNpTdvZpxjgu6qGUWSdnSiAd11+8A8EIWqNnpeTlFQy2+fJOL
	AZxrdxQiwToSj09VuDCXxB1hJEZ5LbiqUQVxED5uRoUGfgqBI5lyxKCeV03/VuippniUNisZe3l6l
	OjLiXD0Q8hkI2vDxH73SvzpyZWw5AKrxzbhxslbkF/5nXwnZX8soekRweS7VLXZdlHzvjSPMa7CA6
	UIZFgBZfCl2FzbeQjkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9gdO-001q2L-Op; Fri, 08 Jul 2022 05:34:34 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9gdL-001q0o-Pn
	for ath10k@lists.infradead.org; Fri, 08 Jul 2022 05:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657258472; x=1688794472;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iMIM4b1wsmO5AS/1FbT4ChzRmnuYIXsF+DRgFibFLR0=;
  b=Qd9e+L0RS+DsgZdNMmfPTGiZbIElHiQlAvbJ6656MUJ6W6C1AJJJ8SFy
   jVMqhYzGFbSh0Y8ecn1w6jnG2CVLMKgeG8INrc3v2aU6lkwYbR89nUTZn
   eQ/AQuD2DnOFBwDs66hZOtUxnESNJ1Plus+Qsaw8UnHD32kkt6FmpsxiH
   zeMod+fMcYL1MxJ0xHAKI2W2NEde6QVV685NK23Inap0PbQ61XCdR3YFe
   kLo8AePbsm17FW0A5oX/GtbblKLGZGqS0SKrz4udVpntVTtdcWJLUzJVB
   r+XWQzLJC7NxUsm0J9YDHSno0q8ggwDNepY/2LIT9tC/yp8cdYqffjwhf
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345883786"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="345883786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 22:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
   d="scan'208";a="621082397"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jul 2022 22:34:26 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9gdF-000Mxy-Fe;
	Fri, 08 Jul 2022 05:34:25 +0000
Date: Fri, 08 Jul 2022 13:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 e1101ac6f9cb5515d034718944928cbca0b8cff7
Message-ID: <62c7c1a8.FqMUK+buM4Mi+pOQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_223431_963693_5D37CFB3 
X-CRM114-Status: UNSURE (   4.78  )
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
branch HEAD: e1101ac6f9cb5515d034718944928cbca0b8cff7  Merge branch 'pending' into master-pending

elapsed time: 721m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
riscv                randconfig-r042-20220707
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
