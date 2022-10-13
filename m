Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E387C433FE
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 04:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6iv8elZ02EwwRhGkJddmSkNn+r0WM2nc6sXyX2/9oio=; b=Iy2v53YIO0xMwz
	BspGXe/Y0V2Xk78MYv3zgSri0jpD9wTLNhWXlqg4NzgcLJ8ogirrSaDhKHB+bPHVk2PLaBRe3or5E
	xhZlJGaOaSzl/W6qDfgUVNKaVJ9s2b1J+9rmozszQPyaiogJcYD2r90RIJY0RNo4rRCV6EXeAktPt
	zY9rZwKW7/sOaG067sNyFisqNGE/AAQo1d66SbhFpmQA1zCGag2pRr0JciYFci6n4lLaAZbAZJ2wd
	/bUNjt3s5PZFh7CMEfluu6k7ThnIL3SJSA0sGGKgnENCHrWzHggQ7NEqRE6+ujFaL/Hk/hjKmx9ly
	uXvAy8R58HdIe+Ps3rHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiprU-00AanI-DH; Thu, 13 Oct 2022 04:30:24 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiprR-00AamH-Ss
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 04:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665635421; x=1697171421;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VE32u3nAFD7efcCX8hV0Sbrve5U8CibC50wnLM21bPA=;
  b=EpSaCntWhoCZByEy5r8l8Znt0u5QxAxGR+1rwvUnpw8obtVufyFTRxcA
   gUWKx+sjIIj4oyIBj07Xb4EpmzGQipja+hw6M8+0Dk/Aoc1e5KvDI7C+b
   1CBlOKWGEMAR4OSS7TKfzlW7fsBiFs790qYSFbePexytieTb+TUgS1HVP
   eFaGWhMOgimQ7DZ3GCkK3JMIeWjB1i/ynleiF0z2KeZDPLhnQy+hpq3ID
   7KZ0kyLnBB3dJlWNxEIgIiRU+2ffENTyCCSS0WwPzxAgbv/p7sVSaD9Hq
   XD+CPSRvLGPf6XVsGuN0yHorXh6FMQoL2qGI1hOPtNHlx4hZVJp85bhir
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="302588107"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="302588107"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 21:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="658027579"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="658027579"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2022 21:30:09 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oiprE-0004ax-1O;
	Thu, 13 Oct 2022 04:30:08 +0000
Date: Thu, 13 Oct 2022 12:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 8cd96cdd40eb1da7a678c26f8611bcc7545dbbd5
Message-ID: <63479431.tMzQcNErSg+o6s1v%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_213021_984903_7B7E7A7E 
X-CRM114-Status: UNSURE (   5.53  )
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
branch HEAD: 8cd96cdd40eb1da7a678c26f8611bcc7545dbbd5  wifi: ath10k: Delay the unmapping of the buffer

elapsed time: 821m

configs tested: 108
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                                 defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                           allyesconfig
riscv                randconfig-r042-20221012
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
i386                          randconfig-a001
alpha                               defconfig
i386                          randconfig-a003
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a015
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221012
i386                          randconfig-a014
s390                                defconfig
s390                 randconfig-r044-20221012
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
i386                          randconfig-a012
i386                                defconfig
i386                          randconfig-a016
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
sh                               allmodconfig
i386                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allmodconfig
arc                        nsimosci_defconfig
sh                            hp6xx_defconfig
powerpc                      cm5200_defconfig
arm                        mini2440_defconfig
powerpc                     stx_gp3_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
powerpc                 linkstation_defconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
sh                ecovec24-romimage_defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
arc                     nsimosci_hs_defconfig
arm                         nhk8815_defconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
loongarch                 loongson3_defconfig
xtensa                           allyesconfig
mips                 decstation_r4k_defconfig
xtensa                    xip_kc705_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
mips                        vocore2_defconfig
powerpc                      ppc40x_defconfig
sh                            shmin_defconfig
sh                        apsh4ad0a_defconfig
powerpc                       maple_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
nios2                               defconfig
ia64                             allmodconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221012
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a002
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a004
hexagon              randconfig-r041-20221012
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-k001
powerpc                     tqm5200_defconfig
powerpc                          allmodconfig
powerpc                     mpc5200_defconfig
arm                           omap1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
