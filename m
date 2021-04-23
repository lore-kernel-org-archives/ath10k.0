Return-Path: <SRS0=b4Sx=JU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C960C433ED
	for <ath10k@archiver.kernel.org>; Fri, 23 Apr 2021 03:59:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787C661425
	for <ath10k@archiver.kernel.org>; Fri, 23 Apr 2021 03:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787C661425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BeaSUGLDZzJqznKRzhyvE4tVnzp4oT9yAB9DUfn78O0=; b=WVbbER47xdI128q8hdq/bkI3tA
	i8aGPW5dnVzgsYZrIt0fYBg5Bjls70tZi9rjLSaC3Cv9Asqc2LBdvdemJZaNDbqHd0X9Cw3w1uSnS
	pgcD8HwbqxqJ7II2VM2+p02kcxBjMw29FAGvhzH2EDXohQI60UecszOm+Lt1wv3GPSEdPBnH67tyx
	3G9RUHifictpLr33XCUNAJCYHsqO+5t0OeT7Raj1dQnxB5tR9I44CkCH/y+5E5T7ww0JmZJr3QARU
	cXELWiJdADq8hsg9M1mRvcVAcjPoRKbMAFQh5dacHyXMs/n5Ijwlbh3rN/PalaHWs2yXbJMS/tMBr
	3DTowq9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmwn-000XgD-Jd; Fri, 23 Apr 2021 03:57:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmwO-000XeG-BR
 for ath10k@desiato.infradead.org; Fri, 23 Apr 2021 03:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rvlZrUCeQf+a0xYIXVNprDyOBucCAKiUo9aWwXjWIc0=; b=Htbs2GyGIM/qJJqCQFSvrEA7KI
 MWiucS90cVfbJT0nKmTJYe4pqoY35q0v6YHroJryerugqhigsfKPx0Jumk+4LDUhSNQL976mIduty
 WscBBeIr7o1vkF7bD1RyM/zbRwAFD4etoNQ5ZHXE4D01vJsT8pa38q4w3LkVtzXQJr4g/8rPuq514
 hLDX62gBA84bf3NkjdoCdaohr5BW1AeCmuDu75PHe0njB+15COw83CDOwBlj5ARZt0EODbRZ+lN7T
 UUjy1U/KqOS8hEpYCg3O2iSqUE+VK/lmKImiLF2ANG772L0KeO8WXrLmPbwBDvSZD/bUNq5GmzPki
 4bPJjuGQ==;
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmwL-00E7yb-A8
 for ath10k@lists.infradead.org; Fri, 23 Apr 2021 03:57:14 +0000
IronPort-SDR: TfwZq99ZhHJsCTZ2iN2Wlw4tcOoKR0wbTC8VY7xeEUy8tIQtmKePKbBxPc/AsIhDXlPXPo/akj
 /0WlbXaXa8mQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="259967030"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="259967030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 20:57:09 -0700
IronPort-SDR: xOQP/Lz5D3qQjFLObK7be+9Xs4gmh3w1XxQ4+lbbYaz25NmD5OooLtpzzflKdWvHOjsewTXyPA
 KQK4LCmaQLLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="386276414"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2021 20:57:07 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lZmwE-0004Vq-Qb; Fri, 23 Apr 2021 03:57:06 +0000
Date: Fri, 23 Apr 2021 11:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 efe73ff4aef2625abfaf8e585ce5f971507d32cf
Message-ID: <6082457d.8j7utUPXoIywNXFi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_205713_428380_27E82A99 
X-CRM114-Status: UNSURE (   3.22  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: efe73ff4aef2625abfaf8e585ce5f971507d32cf  Merge branch 'ath-next' into ath-qca

elapsed time: 724m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
powerpc                       ebony_defconfig
powerpc                      cm5200_defconfig
um                             i386_defconfig
arm                      jornada720_defconfig
arm                              alldefconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
powerpc                 linkstation_defconfig
arm                         s5pv210_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
m68k                       m5208evb_defconfig
mips                     decstation_defconfig
arm                           sama5_defconfig
sh                        edosk7760_defconfig
xtensa                           alldefconfig
sh                           se7724_defconfig
arm                          pcm027_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
ia64                            zx1_defconfig
mips                      maltasmvp_defconfig
sh                          kfr2r09_defconfig
sh                        sh7763rdp_defconfig
csky                             alldefconfig
powerpc                     kmeter1_defconfig
powerpc                  iss476-smp_defconfig
arm                     eseries_pxa_defconfig
sh                         microdev_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc64e_defconfig
arm                          badge4_defconfig
powerpc                       maple_defconfig
sh                           se7751_defconfig
m68k                            mac_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      walnut_defconfig
powerpc                     rainier_defconfig
arm                           stm32_defconfig
powerpc                     mpc83xx_defconfig
arm                        trizeps4_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
nios2                         3c120_defconfig
arm                          gemini_defconfig
arm                            dove_defconfig
arm                        neponset_defconfig
um                           x86_64_defconfig
mips                malta_qemu_32r6_defconfig
arm                           u8500_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
i386                 randconfig-a014-20210422
i386                 randconfig-a012-20210422
i386                 randconfig-a011-20210422
i386                 randconfig-a013-20210422
i386                 randconfig-a015-20210422
i386                 randconfig-a016-20210422
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
