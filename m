Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF8AC04A68
	for <ath10k@archiver.kernel.org>; Thu, 28 Jul 2022 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1M48I3oIy0O55ckCJQT3dkSWXJR7QStmRHStu9N+vmc=; b=Lj2avDNLW4tUZj
	orDx+2Wod6OVwoftiyQgiidntBxYIgEjQzsPxPG+gt84i0JacnOZd12knJE9TTN+qaFiG1h8jlYfm
	IiHrxw+bYQvQ+qzRjwOjPRhe+lVRvPVaUJbjTcBMO09DVihz0XLWFAzxouoViveue5EYZgYwkhRjf
	prj6Ob6qKO5w8xLPJpZKT8AqCIbhyZkCdwETBNps2bNvW8C/JJMdDyXZDC7B92M/xQ5tzhbnQZ+Xl
	ZLRY1rD1ZoS46sNvzfzG2X7OQzbDhJ3ptBHaZT7YWL0VSzwKnmmBOckKaaf1Gza1gFitVeY3JO5kF
	hv6OzreKiRCUoGtxAoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5W0-00AYn1-QY; Thu, 28 Jul 2022 15:33:32 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5Vy-00AYkE-1u
	for ath10k@lists.infradead.org; Thu, 28 Jul 2022 15:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659022410; x=1690558410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M4UJcAx5G5Um62yQtbcHqnkYu+CsWt9ada4nkKVfyKA=;
  b=abm9gSJPgofVytCJ+DGNGvJtTi5lhABh2W/wB1uhGPreavIJj50QXLNk
   xnxoumULzscsi05Q/yybRe0GuzX2VNLcFEQu7bJ3h9TD+wlWPDj3G1MNn
   w9zfTn1CsnCFua9BH94DAE0soI9QoPnSiTs+Cs4JedoJbukV5ErS6/1li
   EEVUYUTLvqA0yBo1rJ9TxUQv8b/xfob+BCF858jG+M2kmgrFyq/y9w24T
   9f7Imtyv6TReXmzQxGlnbcU9PQjZ29tep7csIiiQ+qsK/k/w7oydkr5RZ
   UgDPixtXGe/6h40UpTgW/hovvbelxmc9fHjaF/ZlCdV9DegpYvW060CCG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="275423090"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="275423090"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 08:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="551357667"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jul 2022 08:33:25 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oH5Vt-000AHu-06;
	Thu, 28 Jul 2022 15:33:25 +0000
Date: Thu, 28 Jul 2022 23:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 d578e0af3a003736f6c440188b156483d451b329
Message-ID: <62e2ac0f.fPeQ6r7VPfOAAJTe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_083330_167653_D1087EA9 
X-CRM114-Status: UNSURE (   6.64  )
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
branch HEAD: d578e0af3a003736f6c440188b156483d451b329  wifi: wil6210: debugfs: fix uninitialized variable use in `wil_write_file_wmi()`

elapsed time: 1718m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                        randconfig-a002
i386                                defconfig
arc                  randconfig-r043-20220727
i386                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
s390                 randconfig-r044-20220728
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig

clang tested configs:
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220727
hexagon              randconfig-r045-20220727
riscv                randconfig-r042-20220727
s390                 randconfig-r044-20220727
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
