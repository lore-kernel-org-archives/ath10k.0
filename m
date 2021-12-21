Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD42C433EF
	for <ath10k@archiver.kernel.org>; Tue, 21 Dec 2021 22:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1gFCUHfDzKUZV9IlJC6XMJcsGIk8v30yUc53/JcxB0=; b=Scz3WAqUXOspRq
	NHEB9Nm+g9wWvkSaATM90Vsaf4ZRX2iwLTvUBIVWSw2f4jz7safGbr8FGllk8M4af7wstMNjfoPq8
	ZziJ+NYS10Q95yqvRUbUfj282W3dAvF9EAe2DRh9in0tlr9iNmAjr+ZpXtpsYx3v1Dy7jw0mzg8xn
	pWEXoHGIQsXMzcaOMGnB2be0RmVOAntYO0eTQfv/twQptA+u5defLeW1e14QhHDwFjc4Cjrl3uOzi
	sUk1OcLZQnv63mus6Us4AlUGp5tqQuYbIJG+7065I8gS4IZ2KoTPkrx5QkxPdHu17/wutuKtg2/Fs
	HaBOvJtwVy0Gh6zqXglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzo6S-008hhf-2P; Tue, 21 Dec 2021 22:59:28 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzo6O-008hhA-6K
 for ath10k@lists.infradead.org; Tue, 21 Dec 2021 22:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640127564; x=1671663564;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vPGvcXR7gEwX6wRmAVZZ8MJMm0YGXCUOumAAoNy+4Dc=;
 b=A+vEAUkCowGWGjUCZxVTWCynsuPCOM7RVfKnzT1dKEa78FkiOujL3NGb
 ruvX+9DGlMa54qWWcCztxhihJIIsafgJLSAnRZVuSBUuycbmLrQbzpI+2
 BmeF6J9yMp+jlJ167MPG7wnA9+7dHFopDa5vc7QTTnTu5Ayy5bLzvEBDI
 4x+oiKF7h2g4rNimXMWcK6VZOGACgCG9TEJ01TTLlqoSHfkwbdhHphMTJ
 7E8ukWpot0MbUdMNYXxjtzSbxdHvEnId7ieSWA2B38VTWKLqxiPthhtLz
 WkOJ6WxH3Ab+gAUSPcRELoNi2NGL8/oMqWlnnAZyOl36yOLCQq/vKKTEV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="264699289"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="264699289"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 14:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="484568515"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 21 Dec 2021 14:59:20 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzo6J-0009dJ-CG; Tue, 21 Dec 2021 22:59:19 +0000
Date: Wed, 22 Dec 2021 06:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 01417e57939faffebfdeb2aef1f4388e95cf9271
Message-ID: <61c25c3a.kXMVga99x0XA7KyI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_145924_278362_B371DDD9 
X-CRM114-Status: UNSURE (   7.32  )
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
branch HEAD: 01417e57939faffebfdeb2aef1f4388e95cf9271  ath11k: add regdb.bin download for regdb offload

elapsed time: 723m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                             espt_defconfig
mips                     loongson1c_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
sh                        edosk7705_defconfig
mips                         rt305x_defconfig
mips                           gcw0_defconfig
mips                       bmips_be_defconfig
powerpc                     skiroot_defconfig
mips                      maltaaprp_defconfig
mips                      bmips_stb_defconfig
um                               alldefconfig
arm                          ixp4xx_defconfig
arm                           omap1_defconfig
openrisc                  or1klitex_defconfig
powerpc                     tqm5200_defconfig
m68k                            q40_defconfig
powerpc                   lite5200b_defconfig
arm                          pcm027_defconfig
powerpc                      katmai_defconfig
arm                         assabet_defconfig
sh                            shmin_defconfig
powerpc                    sam440ep_defconfig
m68k                        m5407c3_defconfig
powerpc                     tqm8548_defconfig
sh                           se7780_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a004-20211220
arc                  randconfig-r043-20211220
arc                  randconfig-r043-20211221
riscv                randconfig-r042-20211221
s390                 randconfig-r044-20211221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a016-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a013-20211220
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
