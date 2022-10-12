Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C773CC4332F
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 18:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sqqomt0kVL/KZn8o9jdJwqYL3b+o5Fh9RlppVDew0vs=; b=3V/RXN+TltxfcP
	iYQs8WzGLaVaPXY+908TTlLDSFlwd5iOwwz47eelIZ/nnhvfSWdeGQm81WrbzWymFlKzSGE3wTt4o
	lZC3RAuafnZ6N1W5KHwublz0fEpoYLo8ChhwzSW1JLGh7j2HDj6/eXPDdah8fZMKpJ/BYRBuqyuTU
	TdWOFbcYLuXemCed7TGbB14yJ3YY47XhLm1NnYyslX5CZsniJOf8eQpnj9qwcAdGQZ7eC+PsrNpNH
	CfcWd5x1W9Kro6gxkw4UakjgHBDKkusVDAGyqaMIYLjN5YCcXG+bphWcz8cWOp8uRqyxeZyUXBcgn
	HxzHCfStGxvPd6dpa5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigps-0092ZJ-8k; Wed, 12 Oct 2022 18:52:08 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigpo-0092UD-5p
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 18:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665600724; x=1697136724;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UtEjrrCiPKIggRo5PihEwbBIixvLoUQ4hO0eyufuaDU=;
  b=ULVX8Pa7T9iP3yj2j3pyTRL7Pxd6z4Jlq0p3IT1FRzViXIJ2O7eKOg9J
   PMieAL7OT7J+4AOU+ZhSEakNoyGpgrsY34XQ4g4+WW5VkTKXNuLJE9YvU
   CGC0Q7yynXkUIXVnP4T9XhtTEo32AjZK0g0sx5VoCwRiJlBsiHlfBSTvi
   bDZJ6nSZv++FNKF9aeXLw0DL38PDj0Whuufyv5pQdpOLMKqNSrZ0LRZxo
   v/hzkYaqKGkVpFeBXtF1NjU0rstevOA9RSWeINca1I7TwOlh2Nlj+KzUw
   YlQek1BbMYse4+SS1+so4LnaJ5DxQTUPHrZ/qd7gPNOPsoz/o/4M8S+/a
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="366882157"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="366882157"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 11:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="752234351"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="752234351"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2022 11:51:42 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oigpR-00045j-14;
	Wed, 12 Oct 2022 18:51:41 +0000
Date: Thu, 13 Oct 2022 02:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 3f9b09ccf7d5f23066b02881a737bee42def9d1a
Message-ID: <63470c9e.pHubHVUAgsnlv7HA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_115204_286762_BB9F4215 
X-CRM114-Status: UNSURE (   4.14  )
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
branch HEAD: 3f9b09ccf7d5f23066b02881a737bee42def9d1a  wifi: ath11k: Send PME message during wakeup from D3cold

elapsed time: 724m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                                 defconfig
x86_64                        randconfig-a006
alpha                               defconfig
i386                                defconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20221012
riscv                randconfig-r042-20221012
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
s390                 randconfig-r044-20221012
powerpc                          allmodconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
s390                                defconfig
s390                             allmodconfig
i386                          randconfig-a014
i386                             allyesconfig
s390                             allyesconfig
x86_64                              defconfig
i386                          randconfig-a012
m68k                             allmodconfig
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
arc                              allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a005
m68k                             allyesconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
arc                              alldefconfig
sh                            shmin_defconfig
sh                         apsh4a3a_defconfig
openrisc                            defconfig
arm                        keystone_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc834x_mds_defconfig
mips                       bmips_be_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                        clps711x_defconfig
powerpc                      arches_defconfig
mips                     loongson1b_defconfig
mips                          rb532_defconfig
xtensa                           allyesconfig
sh                           se7750_defconfig
powerpc                     rainier_defconfig
powerpc                    amigaone_defconfig
mips                           ci20_defconfig
m68k                                defconfig
riscv                    nommu_k210_defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                               defconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
sh                          landisk_defconfig
sh                         ecovec24_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
riscv                             allnoconfig
powerpc                 mpc8560_ads_defconfig
mips                      maltaaprp_defconfig
x86_64                        randconfig-k001
powerpc                      katmai_defconfig
mips                     cu1830-neo_defconfig
powerpc                      obs600_defconfig
mips                           mtx1_defconfig
powerpc                        icon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
