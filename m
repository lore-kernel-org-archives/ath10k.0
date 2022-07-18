Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468BBC433EF
	for <ath10k@archiver.kernel.org>; Mon, 18 Jul 2022 22:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ZndoIqMVLflDSyO8gLznDoFzu+gETMYwUU4t3OWRBY=; b=K6bOv4bDLVEbDA
	cE67uBJ37+cJC7jPZYD+g8dQum7l+T29KQ04ZoMwJZBBZ6SNcxO23h99uXrAdA5k1VD0RsdNIQpJo
	o7sQ5bfU9LD1gYWkXlv7WlYUsYWtTH+cF0fBUHjJqxV5WD/rsLB4EXAqBECenj/Ce3uAaUWEuY2v/
	D09lYpDGsnDkpkC7RpugtqDanorjuzTu1vJlexyLjBMaa6CZq3bvoyNc7i5pml1cpIzNOQNr4wwKn
	i2qmkZdTgFgZ/ymf8F2KHb0LcTS6jFJvpej3DnnLxNGwldyqwWVAI1p6SkaiWWSXhA+7fVUItcE1W
	VpFdMJW6wLDimPtWbnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDZCb-002968-1A; Mon, 18 Jul 2022 22:26:57 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDZCY-00294r-1C
	for ath10k@lists.infradead.org; Mon, 18 Jul 2022 22:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658183214; x=1689719214;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ycCQ8R7LbB2+IvOuT9RqIEtOfvWaTWXhHeQc2wb7PqU=;
  b=JOXeRUZqH1VJdHu3t/xGHbeku5LG25wVlP2UCSWNDe05e5FEFW7P4n0R
   NqNUP5qHY/wEiXfaqzBOAvmc11S4kuI0oP+2giyXA2L0RyylVCCTsJTYx
   1FrsKiaYOxYgS39jhHsvS6IBXsrG7EF2Semb2bJGqaNEtFSCuyC/T1Bv2
   66PUhtNdDT19/2rD50SWJU0UE8cR2DfBCPREZjC3LILbS0O8FzQFJrsRj
   qSR284mGKPxpdKNlyFwcWnTKwT65KPCEVVlRy0W49Vu8Nk7z9nXB0Mndd
   hLlLq6R0lkO3dPHyAeLHir7Dr9G9rf3/Ocw0oOLSI24tE29CrXKZkpwxN
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="348023803"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="348023803"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 15:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="924524106"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2022 15:26:43 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDZCM-0004oI-LF;
	Mon, 18 Jul 2022 22:26:42 +0000
Date: Tue, 19 Jul 2022 06:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 086f67ba21ede199307e78476353bda9ffef982c
Message-ID: <62d5ddf9.QJBtlXppCV/tJBBz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_152654_166637_0414E450 
X-CRM114-Status: UNSURE (   4.96  )
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
branch HEAD: 086f67ba21ede199307e78476353bda9ffef982c  Revert "ath11k: add support for hardware rfkill for QCA6390"

elapsed time: 729m

configs tested: 103
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
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
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
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
arc                  randconfig-r043-20220717
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
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
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                 randconfig-a004-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a003-20220718
i386                          randconfig-a002
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
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
