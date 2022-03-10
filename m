Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86C9C4332F
	for <ath10k@archiver.kernel.org>; Thu, 10 Mar 2022 05:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ub9HklkgYcrUgGAlvss4uQ24DK5CAetz4X5no1+2qCw=; b=1gLlgdGLXrnPum
	9EXcw0lI0AolXB8iE1J8cZ2yVZnEGqrQ7O5smriBd4RfE90GO3RfyxQq8DLXdRe4ufVCnGKZ2eWr7
	ajB060AYJf36oq0yPjomjSwpgg1K4BmQ7Upxv5eC2GepJ8xu5dh9h0hhd+go9zS/V8PLNjUNTSLoc
	ONGWlbE7DtdHtFUijt9QGeKwWsyNgtN+47eB8vHPrLrW+EkxdsMbogyu2qTkCuXxwT5+4LxWD9emZ
	cTePai5VmdzOdBbHKJ0Ueh8IntoycbBvCEa5wsM75Qx4N5tMmx9xy6jwyjL61VFyOQpSSKBvt88Nr
	+43x8DUPizwwdpV2Pnig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSBMD-00BUkw-GW; Thu, 10 Mar 2022 05:29:01 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSBMA-00BUjy-Dx
 for ath10k@lists.infradead.org; Thu, 10 Mar 2022 05:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646890138; x=1678426138;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=nnYL/HmyLeT4FvkfBSe0Oh4hQU/UqU/MVwwJ8PntG2o=;
 b=GWNEfwbLsg/yESnYNFcZK5CGfUgsBi0BL9m4QhaYihtwQTBiLr0ByVRs
 AusIFHI5+OLVyK5OJHaaH7fqCEz096qyW80l++V93rXCHsBOYceo6RVU2
 MjLzzCSNRFzd8x0MWejOCKIAWgdsiNhEfboD6HXyg1Ko3uJ+6q+UTlDjr
 64AOPV0JTbpE3pXDtEVDmZZOtT3dgZ86dW9khkoINs1wdrOIi8qP/PNKB
 kFOFSDwH5Ny7SzN1k+W/E8UymMoD6kXRwbx2mPf/nhFYkNQqjHwSCsI20
 AMFB6zSoOinS9LNPsex041pS8FAjMLmBHhKPYkHZKl1XdPRtBmIdrJk3B g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237332744"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="237332744"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 21:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="538310572"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2022 21:28:56 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSBM7-0004Oa-IP; Thu, 10 Mar 2022 05:28:55 +0000
Date: Thu, 10 Mar 2022 13:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 ef9a9431c9c04a2ddd3227db1aa135f850cd9fc0
Message-ID: <62298c52.GLtGmmdQkterx61+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_212858_552243_3FB7DDFB 
X-CRM114-Status: UNSURE (   6.12  )
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
branch HEAD: ef9a9431c9c04a2ddd3227db1aa135f850cd9fc0  Add localversion-wireless-testing-ath

elapsed time: 777m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    klondike_defconfig
arm                       aspeed_g5_defconfig
sh                               allmodconfig
sh                        apsh4ad0a_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
powerpc                      chrp32_defconfig
sh                         ap325rxa_defconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
sh                            hp6xx_defconfig
openrisc                         alldefconfig
sh                             espt_defconfig
powerpc                     rainier_defconfig
powerpc                     sequoia_defconfig
arm                        mini2440_defconfig
arm                  randconfig-c002-20220309
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
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220309
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  colibri_pxa270_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        omega2p_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220309
hexagon              randconfig-r041-20220309
riscv                randconfig-r042-20220309
s390                 randconfig-r044-20220309

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
