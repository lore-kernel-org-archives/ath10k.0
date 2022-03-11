Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A16C433EF
	for <ath10k@archiver.kernel.org>; Fri, 11 Mar 2022 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QttfRzEIqsy2rvTQ4xbeE4tB4YOl7RXNYGsBJDi3t1c=; b=TAipBNG6JgbWap
	SCEMWTpKLI7mBKMzv41qRLCEOTyAmberie2Ew9Aw4nQ3SpQg7DBtA3TCprXfgZBrlSEmL73i1yLZU
	orcy98as4RMvXHqAa4nbW/6BQo0BWREA844sHWnY3M5AA4hH0FqYl2hmM1Zo0fU2OFooGFQ/Ctg3G
	j12BBuenjQn52jDYtRLSLBw/0p9NPM38qrVg0o2hr2YPhvvwMIwABKcP+jMKWl85tcc9NPtgmrVTm
	8VGG3KDClDEMmRtHmLLkwzaJRs8oTAu13etGyKQng3iIoU73/KQpDtpvAOWg2sQDznYRV2wa3BtHA
	l3lNadQ4UnS6baLo+BYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSZhc-00FN4l-0A; Fri, 11 Mar 2022 07:28:44 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSZhY-00FN3Q-Ky
 for ath10k@lists.infradead.org; Fri, 11 Mar 2022 07:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646983720; x=1678519720;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=bv9JcfnC1yIyhb7QEtLTC0QrJ5WmQ9H4caXiul5RNIU=;
 b=G5kq8/ezcn7X5xMhfVvwFzPlbtQS3J52+AerrbigyCP2WgyKN8N7BGGP
 OxEzQ+Y69o26N03b5EonXVOIG2oH8qotfImkl8gbcYd+ooy35Hhe1cqVO
 WRYQZMyVdbSpVzBYitBSQ4hdILe923MDv8bng4fElGfPTtiluoVpXmIXD
 eapGSRVgkt5c4B4F2FpKWkAG2kFfKPCXwk7DUZcsKXc+Zvd5/kjpoS6Yz
 MzwOcWvos+OtJ9XZIt4N5z9p0Mm8+N06lgp5mmD0xgppe98wxK1wYdBny
 9cFnHAfU9ZsasJNg3yHA0D3BXsoa/YXHM4bQB5wFodV+9PpelCSGwpx9A w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="242967699"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="242967699"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 23:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="644848454"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 10 Mar 2022 23:28:35 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSZhS-00062W-J2; Fri, 11 Mar 2022 07:28:34 +0000
Date: Fri, 11 Mar 2022 15:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 83fe43abdacf78e9fbc7cd19e74768a5434edcce
Message-ID: <622afa1d.hOEYofwuWWMfa33K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_232840_773966_F28E3C4A 
X-CRM114-Status: UNSURE (   5.68  )
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
branch HEAD: 83fe43abdacf78e9fbc7cd19e74768a5434edcce  carl9170: devres ar->survey_info

elapsed time: 740m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
nios2                         3c120_defconfig
sparc                            allyesconfig
arm                            lart_defconfig
sh                            titan_defconfig
sh                            shmin_defconfig
m68k                          multi_defconfig
xtensa                         virt_defconfig
sh                          rsk7203_defconfig
m68k                       m5208evb_defconfig
ia64                        generic_defconfig
sh                            hp6xx_defconfig
arm                          badge4_defconfig
sh                           se7721_defconfig
openrisc                  or1klitex_defconfig
sh                          sdk7780_defconfig
arm                             rpc_defconfig
arm                      jornada720_defconfig
arc                            hsdk_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8548_defconfig
arm                         s3c6400_defconfig
arm                        keystone_defconfig
arm                  randconfig-c002-20220310
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220310
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                       lemote2f_defconfig
s390                             alldefconfig
powerpc                     tqm8540_defconfig
powerpc                       ebony_defconfig
x86_64                           allyesconfig
arm                    vt8500_v6_v7_defconfig
hexagon                          alldefconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220310
s390                 randconfig-r044-20220310
hexagon              randconfig-r045-20220310
riscv                randconfig-r042-20220310

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
