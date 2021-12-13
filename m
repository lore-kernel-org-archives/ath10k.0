Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF1BC433EF
	for <ath10k@archiver.kernel.org>; Mon, 13 Dec 2021 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AURZObzkcO8zVsbO3EHw+pLcpqLXQDxYDZv3NOHYMXM=; b=bfYAgyPmdD8zhz
	tkPY/+0wIPfEawlqm5DKscfl1RrUjwIN0hGVfE4SRNL6X5Lvef7nVrNWgMuV3A0aKVF1YPnDYcluy
	Ga1lsK+MiZpiYTLQeGpr+dZ4oeWDX8lFTYj95xjxjVNA34yBaZhZNAt78zddT4I6uy8YuPEiHbbl0
	F+sFJ6vatqqQ8Iga/Zjp+a1RoDccpS/uuunJOWku5pH4Wgq4KT7kATFztXSCwItt9+LBU8rxRYCbV
	IFp3zAzxpWqtfOvDCEee43IqZ8j9G5klZrsvXly1V72yHsTkJcBQSJ4fmAC5yV/RXVXQBNUzAsJgr
	dzAa2qFCjxowaPKfYl6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwu7B-00BqwC-4N; Mon, 13 Dec 2021 22:48:13 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwu1B-00Borg-8f
 for ath10k@lists.infradead.org; Mon, 13 Dec 2021 22:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639435321; x=1670971321;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NFKB9zEmMCh4xxRWZ0vORuNeRmz0EypDaHjS8LYGJKM=;
 b=Ud78pxW89+BmXwu6pd1E48Jyi1+3vxJ8E/1YK0vilRV09KBlhz1SooVr
 JP1cgCvzhEEM2U1AXMNbCPnn1+K9VxraL1VFLMDDEoA2ta+V0106HLj8t
 A0Nz4xHhItjVCLqWxgmAdu/ZlSsAXrKyqSXO7MSzajiNpaG8Duvpax+67
 aDYmPZEvNhKmrgQCs0J/bBfPWXBKabmI9tMneycYqhgrEnoHTpqFkH/np
 FPt2I654K94/EzQplFdwKQARStS+b+zJiiojMUrWLJLE/PRyZsILbFBR0
 Qr6TDmxjZaHH8Bd1DohwxHCGc+SNYghCPuJoD6liC1Cncl4sTl41aNOL0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325119253"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="325119253"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 14:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="481683906"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 13 Dec 2021 14:41:58 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mwu18-000790-4x; Mon, 13 Dec 2021 22:41:58 +0000
Date: Tue, 14 Dec 2021 06:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 2cae04c35da2d09c44e44f3a83a30bb59d311693
Message-ID: <61b7cc26.Vw2KI5C3vOtsNx+/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_144201_422182_4D87080B 
X-CRM114-Status: UNSURE (   5.55  )
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
branch HEAD: 2cae04c35da2d09c44e44f3a83a30bb59d311693  Merge branch 'ath-next' into ath-qca

elapsed time: 729m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211213
powerpc                      pcm030_defconfig
mips                     loongson1b_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
ia64                      gensparse_defconfig
sh                           se7705_defconfig
mips                         rt305x_defconfig
arm                       mainstone_defconfig
m68k                            mac_defconfig
powerpc                     mpc83xx_defconfig
parisc                generic-64bit_defconfig
arm                          gemini_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
arm                        multi_v5_defconfig
arm                              alldefconfig
sh                         apsh4a3a_defconfig
arm                          iop32x_defconfig
mips                           ip27_defconfig
arm                  randconfig-c002-20211213
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
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
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
i386                 randconfig-a013-20211213
arc                  randconfig-r043-20211213
riscv                randconfig-r042-20211213
s390                 randconfig-r044-20211213
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
riscv                randconfig-c006-20211213
x86_64               randconfig-a002-20211213
x86_64               randconfig-a004-20211213
x86_64               randconfig-a001-20211213
x86_64               randconfig-a005-20211213
x86_64               randconfig-a003-20211213
x86_64               randconfig-a006-20211213
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a004-20211213
i386                 randconfig-a006-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
