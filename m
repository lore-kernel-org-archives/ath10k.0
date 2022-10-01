Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF801C433F5
	for <ath10k@archiver.kernel.org>; Sat,  1 Oct 2022 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sX5/XWzotwZYuJgNNIS6DDF9DYgCNKrdVz5X1lq8KVM=; b=Is7zWDklk0Btcg
	b9H5pyRWIniwwe++MrF1Ew6PS0nK9jbjhSOky6qsFcxtmq/inzxzqzY5g+jn4ogONWYWoeuZ/dRlj
	QGQ2zZobqNz9rW8WR87bae6GJrsPYKp1DNOgcRKJuJj/vOt6g1Y3aYc4N+uLJYLWURmysTiQgYiHK
	bXOdFHg1aBhYq48Xnptsl0ZjgPkLYaLNJQsb2zuT8fQwOqNYji29KqszeVgz00CEM7WIQhCVKstg5
	vO7J3nmSxsYaK8XYsaIYD6LTD4Ea5SDVkiG8IbQAOH5u8sBa3qpcGsstwQv/XxsiiSOhl/0MxfmYF
	Gqj5CufHSn3Y1nyQC7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeZqW-00E9u6-4e; Sat, 01 Oct 2022 10:35:48 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeZqT-00E9tI-W0
	for ath10k@lists.infradead.org; Sat, 01 Oct 2022 10:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664620545; x=1696156545;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k5UFLjn3p+24kcBkikrLlGsst780uVDCOET+4ZrfImc=;
  b=JfmoaOhQ7QI1YMR4KhXPxE12Fnm31PWjao2t4UxSw+lawJ737giRC+K5
   JcxNueJtkjtw4nBLLc16W7g2mX9Ac08TlZRWEAHx81kBznvCdX+LxGsVn
   dxMabfXSvJ6OfODg1VIW/nAUyRo0i7sTrsAPfNVmS0YKK7VpWVKSkiUN2
   IDWJbIZKR//Y1xeYa1T5SWJubW/8roeXrYOaPVVG6HW/DNaA4P9IEqBcQ
   QdfZErba95p3X4HDjrCFCMnQcNi99f97FhZOQQaopUyUQu5I7dT22PoEY
   yOwd0qauBjv9ZkMhYeKjYN11+OqTY33sb2u3AHUtWGq0jmsGaMZ3dnfxq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="299969485"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="299969485"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2022 03:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="653834039"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="653834039"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Oct 2022 03:35:38 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oeZq9-00028p-39;
	Sat, 01 Oct 2022 10:35:25 +0000
Date: Sat, 01 Oct 2022 18:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 f74878433d5ade360447da5d92e9c2e535780d80
Message-ID: <633817c0.kpEo6z38xvXmLPCm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_033546_079147_CDB01E7C 
X-CRM114-Status: UNSURE (   6.05  )
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
branch HEAD: f74878433d5ade360447da5d92e9c2e535780d80  wifi: ath11k: fix warning in dma_free_coherent() of memory chunks while recovery

elapsed time: 1653m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
powerpc                           allnoconfig
i386                                defconfig
x86_64                               rhel-8.3
arc                                 defconfig
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
alpha                               defconfig
x86_64                           rhel-8.3-kvm
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64               randconfig-a002-20220926
alpha                            allyesconfig
x86_64               randconfig-a001-20220926
s390                             allyesconfig
x86_64               randconfig-a003-20220926
x86_64                          rhel-8.3-func
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64               randconfig-a004-20220926
i386                          randconfig-a001
i386                          randconfig-a003
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64                        randconfig-a015
i386                          randconfig-a005
arc                  randconfig-r043-20220925
sh                               allmodconfig
riscv                randconfig-r042-20220925
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220926
mips                             allyesconfig
s390                 randconfig-r044-20220925
powerpc                          allmodconfig
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
arm                        shmobile_defconfig
ia64                                defconfig
xtensa                          iss_defconfig
arm                            mps2_defconfig
m68k                       m5249evb_defconfig
riscv                               defconfig
sh                   sh7770_generic_defconfig
mips                           ip32_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
riscv                randconfig-r042-20221001
arc                  randconfig-r043-20221001
s390                 randconfig-r044-20221001
arc                          axs101_defconfig
mips                 decstation_r4k_defconfig
sh                           se7712_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-a003-20220926
i386                 randconfig-a001-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a002-20220926
arm                         lpc18xx_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
sh                         ecovec24_defconfig
arm                           h5000_defconfig
m68k                          atari_defconfig
powerpc                      chrp32_defconfig
sh                        edosk7705_defconfig
arm                       aspeed_g5_defconfig
mips                  maltasmvp_eva_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                randconfig-r042-20220927
arc                  randconfig-r043-20220927
s390                 randconfig-r044-20220927
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc                       ppc64_defconfig
arm                           sunxi_defconfig
powerpc                     rainier_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                        warp_defconfig
arc                      axs103_smp_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a016
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                 randconfig-a011-20220926
x86_64                        randconfig-a014
i386                          randconfig-a006
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
i386                 randconfig-a014-20220926
i386                          randconfig-a004
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-k001
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
riscv                    nommu_virt_defconfig
powerpc                        icon_defconfig
arm                          pxa168_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          moxart_defconfig
arm                         mv78xx0_defconfig
powerpc                          allyesconfig
mips                     loongson1c_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
