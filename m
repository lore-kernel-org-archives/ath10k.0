Return-Path: <SRS0=iK1b=OH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D2AC433EF
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 23:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F8F601FF
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 23:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26F8F601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pQEkyjvcgI45idZSHaNymBegVeE43yccjOieRJwqDGo=; b=SsDWCoEAZaONyb
	vTEHCtD1zXDDZFhhkdsr2WMtyBE9DmyVmhoqTfgT785B60ezVR+9DyglJurN0vP1IvDVlQYxZ1+vw
	bZ6bfFZrIvb/1AzznZsOAxBWhBHvjv3er2As30geULwXN2JWdQU8kEUyrSJmJNTlyCBBYXeoTbpKj
	hSmUEtQz8Uki/hf1cfE998NUOutireo916jMqYnn/ODG/xiA3hZeSFupRCNrGDsDrErNNaVZ8sGvM
	qqNgVVKDQhguNpDCaBIwPj2kQzWoyI6iLNpUu+4yBWQQgEAEvRiQohBSq1JEwaJXHFfQ+zCEB2axG
	pp7WxUawaTskZ/eRfGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRNCZ-00F7kj-13; Fri, 17 Sep 2021 23:23:27 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRNCW-00F7kM-41
 for ath10k@lists.infradead.org; Fri, 17 Sep 2021 23:23:25 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="202389390"
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="202389390"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 16:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="517276647"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 17 Sep 2021 16:23:19 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mRNCQ-0004TV-No; Fri, 17 Sep 2021 23:23:18 +0000
Date: Sat, 18 Sep 2021 07:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 d61726e2eb7799e3d4c0b5324f5e853d66649bc9
Message-ID: <61452329.7rKuny+eDzhwrlF9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_162324_248222_62FB614D 
X-CRM114-Status: UNSURE (   5.74  )
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
branch HEAD: d61726e2eb7799e3d4c0b5324f5e853d66649bc9  ath10k: sdio: Add missing BH locking around napi_schdule()

elapsed time: 1761m

configs tested: 125
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210916
powerpc                      chrp32_defconfig
arm                         bcm2835_defconfig
arm                         at91_dt_defconfig
s390                             allyesconfig
sh                           se7780_defconfig
mips                     loongson2k_defconfig
arm                      tct_hammer_defconfig
h8300                            alldefconfig
arc                 nsimosci_hs_smp_defconfig
arm                          badge4_defconfig
mips                  decstation_64_defconfig
mips                            e55_defconfig
sh                           se7206_defconfig
sh                             sh03_defconfig
powerpc                      katmai_defconfig
arc                           tb10x_defconfig
ia64                             alldefconfig
arm                     davinci_all_defconfig
openrisc                  or1klitex_defconfig
arm                           viper_defconfig
mips                  cavium_octeon_defconfig
nios2                         3c120_defconfig
arm                             rpc_defconfig
arm                        realview_defconfig
arm                            hisi_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear3xx_defconfig
sh                          kfr2r09_defconfig
x86_64                              defconfig
powerpc                   motionpro_defconfig
arm                         s3c6400_defconfig
powerpc                     sequoia_defconfig
s390                             alldefconfig
powerpc                     tqm8540_defconfig
powerpc                     tqm8560_defconfig
xtensa                  cadence_csp_defconfig
x86_64               randconfig-c001-20210916
arm                  randconfig-c002-20210916
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc                              defconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20210916
x86_64               randconfig-a013-20210916
x86_64               randconfig-a012-20210916
x86_64               randconfig-a011-20210916
x86_64               randconfig-a014-20210916
x86_64               randconfig-a015-20210916
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
riscv                randconfig-r042-20210916
s390                 randconfig-r044-20210916
arc                  randconfig-r043-20210916
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
riscv                randconfig-c006-20210917
x86_64               randconfig-c007-20210917
mips                 randconfig-c004-20210917
powerpc              randconfig-c003-20210917
arm                  randconfig-c002-20210917
i386                 randconfig-c001-20210917
s390                 randconfig-c005-20210917
x86_64               randconfig-a002-20210916
x86_64               randconfig-a003-20210916
x86_64               randconfig-a006-20210916
x86_64               randconfig-a004-20210916
x86_64               randconfig-a005-20210916
x86_64               randconfig-a001-20210916
i386                 randconfig-a004-20210916
i386                 randconfig-a005-20210916
i386                 randconfig-a006-20210916
i386                 randconfig-a002-20210916
i386                 randconfig-a003-20210916
i386                 randconfig-a001-20210916
hexagon              randconfig-r045-20210916
hexagon              randconfig-r041-20210916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
