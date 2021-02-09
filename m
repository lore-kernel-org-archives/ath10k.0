Return-Path: <SRS0=gWg/=HL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C90C433DB
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 23:05:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49DCB64E37
	for <ath10k@archiver.kernel.org>; Tue,  9 Feb 2021 23:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49DCB64E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hS66YGtAjXKqQSOzdtjzTQ4eYNqJMy1ElhGuKIfaSew=; b=l5YYfj6SYllo4+iQGUjWxL406c
	to/8pk83l8LVKaABagfYj/3NWrA09KSX0WobZ5U1cecuQwiEy1lpa+0XTzGG3/GTVfXQionFSS1UK
	Tw+WdMjUIIIZ06fVEYqRi3lFO1Uo9OwZIZ2lXD8W6yEhzmBd73NN2XF3y38Tk1hoBSIJ23bpXOitP
	nJIYjVe+4Y4JsW4HNbxQYmAK9lrtsVLRm/lB4Wd1KB9mvTR9k10AD4/Bkd0rtnAuktx17uexmGLEU
	G4OFi3s9u2yF0GxGtyUFZs+aDDGj2GcQ8/GXNeDbb6CniCITuY6w1JpAn9ICkvZpeI/Yq7kUTo9Tv
	w+sQwRVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c4P-00072J-QN; Tue, 09 Feb 2021 23:05:21 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c4O-00071s-3u
 for ath10k@lists.infradead.org; Tue, 09 Feb 2021 23:05:21 +0000
IronPort-SDR: Qkli8ZV1WkNiPNO1y9QgSM+Vm8nWaCiYeKjm8ad9GubUaPrdOyApQ3ZsBIOkFyrWX8Dn2VboOJ
 W4S01PeDEL9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="246041835"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="246041835"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 15:05:18 -0800
IronPort-SDR: 4CfGMt6GFUsucbC0gj3QBP6NORSBiJVdYDs3Zm3ccRPlfKZoQqJQy84WBkzaG1yP633nc9Q7aQ
 vEZ4Udy6cpqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="379302255"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2021 14:59:18 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l9byW-0002NX-NG; Tue, 09 Feb 2021 22:59:16 +0000
Date: Wed, 10 Feb 2021 06:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 50a1991389da2c04296d2ffaf416b5e043fa23d7
Message-ID: <602313bb.sWT4CnOvWyf2muZK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180520_372781_F430A98E 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 50a1991389da2c04296d2ffaf416b5e043fa23d7  Merge branch 'ath-next' into ath-qca

elapsed time: 740m

configs tested: 123
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5208evb_defconfig
sh                        edosk7760_defconfig
sparc                            alldefconfig
arm                         palmz72_defconfig
h8300                    h8300h-sim_defconfig
arm                     davinci_all_defconfig
s390                          debug_defconfig
arm                         hackkit_defconfig
powerpc                    socrates_defconfig
sh                           se7721_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc8540_ads_defconfig
arm                              zx_defconfig
mips                     cu1000-neo_defconfig
csky                             alldefconfig
powerpc                     pseries_defconfig
arm                       spear13xx_defconfig
powerpc                     kmeter1_defconfig
mips                       lemote2f_defconfig
mips                     cu1830-neo_defconfig
arm                        mini2440_defconfig
arm                          ep93xx_defconfig
arm                           sunxi_defconfig
powerpc                      makalu_defconfig
powerpc                     ep8248e_defconfig
sh                          sdk7786_defconfig
m68k                            mac_defconfig
arm                        neponset_defconfig
riscv                    nommu_k210_defconfig
mips                          rm200_defconfig
arm                       aspeed_g5_defconfig
powerpc                      bamboo_defconfig
x86_64                           alldefconfig
powerpc                 mpc85xx_cds_defconfig
arm                            zeus_defconfig
powerpc                     pq2fads_defconfig
mips                            e55_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       m5475evb_defconfig
sh                         microdev_defconfig
powerpc                       ppc64_defconfig
arm                          badge4_defconfig
h8300                     edosk2674_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc40x_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
