Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC04C4332F
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 21:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pDIoXNzgLjKxTDbVAS00uDhg1RybdZ5QK2w39MCVSSw=; b=ASiUi9Q4u0vrX5
	grxmkvs3wh4MmgigJ5rVnl1a3KhEqnYlWkCiKrHdov6t8XXOcnA64Dz0UbK6PKEOdfNF8+K3DKYkO
	2BbIxydDi3aIVCpXtoEVOHb6Imm58iF1HPwCikDzTVWWs/RBu4/Y1mkezQvQK722lvhdljuiC4lSz
	y3wHfRldzvAWe0752AQIhLfoLAYRV87pzq4Z1OlLIIc0JZwq6yShLycNlLpgLqyTbOE3guvdxCKSs
	FkE6NioK4GQu37VgfGjOZGcrXmRtp5/d0enYj6/g5hQzHv1aa1O8IZRCOOHUNJiAdshbx9iwK4g7s
	1MkKLHyoZ8bFCAj7mldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5p2-00CzKx-8N; Thu, 13 Oct 2022 21:32:56 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5oy-00CzKH-O9
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 21:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665696772; x=1697232772;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qFy2GHercIZKn0+10BVfHRMbsg2sgbmbFmxanAc+buw=;
  b=EEDDsjv7CN6X+a2AgWXv7+BmIXPrTUu9fGYPVbOHxF6WjkdDXHN6mNBj
   ZAF6BLyj8iffNDc5bB5qwb6Fq33JuvkbyZWSieLHnfk2j4zw7yehurzr8
   FPzZXJDEUzcUZlAa2eE1wA5g66TawIlwK0iKZPDBx0cpYLARVFu83JUCJ
   8+pt2HTqyhEnGC7HfFNIcRi1tqjJqOJjTfNL0XnNclg3mGmnVFaq5OSuo
   EEynsNGCMDLnogESyxvvqV3m4a0LrSJU+q7qTjQ+t0xpIzk7Wwre26RT3
   pERzeSq001B9qNrxd6Um85R7boTOspupP7D0MTHgw4n+0m/wkKLjsFSrd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="302821818"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="302821818"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 14:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="578397253"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="578397253"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2022 14:32:48 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oj5ot-0005bT-2S;
	Thu, 13 Oct 2022 21:32:47 +0000
Date: Fri, 14 Oct 2022 05:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 9692b9e3f5729343c4f8155220eea97d6576d483
Message-ID: <634883dd.H+GbBjJrgujvxY3o%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_143252_837189_C29A4C5E 
X-CRM114-Status: UNSURE (   6.17  )
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
branch HEAD: 9692b9e3f5729343c4f8155220eea97d6576d483  Add localversion-wireless-testing-ath

elapsed time: 881m

configs tested: 117
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                                defconfig
powerpc                           allnoconfig
arm                                 defconfig
x86_64                              defconfig
x86_64                        randconfig-a002
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20221012
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arc                  randconfig-r043-20221012
i386                             allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
s390                 randconfig-r044-20221012
sh                               allmodconfig
mips                             allyesconfig
arm64                            allyesconfig
i386                          randconfig-a003
arm                              allyesconfig
i386                          randconfig-a005
x86_64                           allyesconfig
m68k                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
loongarch                 loongson3_defconfig
i386                          randconfig-c001
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
sh                ecovec24-romimage_defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
arc                     nsimosci_hs_defconfig
arm                         nhk8815_defconfig
powerpc                          allmodconfig
nios2                               defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig
powerpc                      ppc40x_defconfig
sh                            shmin_defconfig
sh                        apsh4ad0a_defconfig
powerpc                       maple_defconfig
powerpc                  iss476-smp_defconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
mips                 decstation_r4k_defconfig
xtensa                    xip_kc705_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                       zfcpdump_defconfig
alpha                            alldefconfig
powerpc                 mpc834x_mds_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221012
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
powerpc                     tqm8548_defconfig
openrisc                         alldefconfig
openrisc                    or1ksim_defconfig

clang tested configs:
x86_64                        randconfig-a001
hexagon              randconfig-r041-20221012
x86_64                        randconfig-a003
hexagon              randconfig-r045-20221012
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
powerpc                     tqm5200_defconfig
arm                           omap1_defconfig
x86_64                        randconfig-k001
arm                        mvebu_v5_defconfig
powerpc                     tqm8540_defconfig
powerpc                     akebono_defconfig
mips                          malta_defconfig
powerpc                    ge_imp3a_defconfig
arm                       aspeed_g4_defconfig
powerpc                      ppc44x_defconfig
mips                        qi_lb60_defconfig
mips                     cu1000-neo_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
