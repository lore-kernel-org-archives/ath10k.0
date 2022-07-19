Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250B4C433EF
	for <ath10k@archiver.kernel.org>; Tue, 19 Jul 2022 00:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TtJFB/GNBLzxxO50dE0ReUBsyJbtyqA8zLoNobedNF4=; b=ndkzps+5gI3Kii
	SdXmaWIJm5fo83LzTVQweYN395HnE0u0tpRczD660MSEfmIPGdbnnf2XwmtsgFLGgMrPBrwvWFhj0
	EPiwTV1umM0FFCLP+iRe/u4lV8L82JuwpKw44cuNfoenK+WQwYsCXclOSkct5GZjoGjUEZRIY9zoO
	FS93H8XKPDKuOc3gsAUydeBZIHGDI84oQ/BRJljegJz9tpupCL/M+vLMVxfncYT7jFLDzZvZ9NijI
	M79asOlBYV6AeVUT77vgouFgEjZDxsohljfFJz6Sq/S+SR1lvwnbuYY2xXhSqxMC9EnIrIjxh8lR5
	3ijKXKsjDTXGGet+nLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDbKq-003F4q-Vq; Tue, 19 Jul 2022 00:43:37 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDbKo-003F4X-Aw
	for ath10k@lists.infradead.org; Tue, 19 Jul 2022 00:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658191414; x=1689727414;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YiKkqoz4OR2GJ96hUgJQ2ejLduJpxmcE7uzN3Mv8J2E=;
  b=BtSjvSjbuCqf2rb9JwQhrFUcDpKisUK7j9alam83pctnT/jMt5YIrMAC
   yakdXKa5eVIdPF2T+6h5ZRS+ggtPOyYI65VZq80hxK5XdKfGPQvCfH2G8
   u0/Jvl7MkMkN2Ll85y1Wx83XDcRa+rRhr0pleSVagdCd0EbwH8zeeupuI
   0MLr6LN0xXi9yf4vCFU+82J2mzxAvNeHCG5badY5ADACoond1Ea9oWqf1
   F1Mq/0cHx62vrL5yEUPrrjT1Yt0SZqJQ066r81LmS7rlgiFnWr+C4fna3
   /V4FepIILtNSFafoGf5mQNY39wWX0Kcnf3I8+4mWW9NXrChbKIDbMdBI+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287095940"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="287095940"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 17:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="624953681"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Jul 2022 17:43:28 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDbKh-00053W-Pq;
	Tue, 19 Jul 2022 00:43:27 +0000
Date: Tue, 19 Jul 2022 08:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 bb58c708eb768e8d5681ab01cb7b46830f4851ee
Message-ID: <62d5fe0e.AI0yPHQByuZWL5ki%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_174334_486200_EB3DD67E 
X-CRM114-Status: UNSURE (   5.47  )
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
branch HEAD: bb58c708eb768e8d5681ab01cb7b46830f4851ee  Add localversion-wireless-testing-ath

elapsed time: 867m

configs tested: 106
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220718
m68k                       m5249evb_defconfig
nios2                            allyesconfig
arm                           corgi_defconfig
powerpc                 mpc834x_mds_defconfig
arc                                 defconfig
arm                        spear6xx_defconfig
parisc                generic-32bit_defconfig
sh                   sh7770_generic_defconfig
xtensa                    xip_kc705_defconfig
ia64                      gensparse_defconfig
arm                            pleb_defconfig
arm                             pxa_defconfig
sh                   secureedge5410_defconfig
xtensa                  audio_kc705_defconfig
arm                           tegra_defconfig
nios2                               defconfig
powerpc                 mpc834x_itx_defconfig
sh                           se7619_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
loongarch                           defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64               randconfig-k001-20220718
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
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a013-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a011-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
i386                          randconfig-a014
arc                  randconfig-r043-20220717
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
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
mips                        qi_lb60_defconfig
arm                         bcm2835_defconfig
powerpc                    ge_imp3a_defconfig
arm                       aspeed_g4_defconfig
mips                     loongson1c_defconfig
mips                      bmips_stb_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                 randconfig-a004-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a003-20220718
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r041-20220717
hexagon              randconfig-r045-20220717
riscv                randconfig-r042-20220717
s390                 randconfig-r044-20220717

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
