Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24087C4332F
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=93tKfzRlEien3dqT+FT8NqBYOQCZqq4Dmfa+k6vEvfY=; b=aoKyCg/imLMvF0
	RPUQpB20kX9hDBChs++Jkt7PhOOCM9tr5YDmXgRuSDFodVF2NdiVz2P0eirmJ/4fwnNsw9pdB4U3i
	uy9/En0gfN9LP27mRSXVciAmLOHgqMaXeAKVZ8bPJsJqQaDxkG2BDkAxctSZK8j0UBXO6ONuFSM22
	6+8aF9iTMDwI5tDz8T2ey0uu4WMcKylXggandl3pzupGdX0ojt+8C6CcElOIK7bCojKAvtvwYKBNO
	EX4QF8vZ5yM8qhSZP5BafCYW4KPll1WDE5RhqOHYnxDP/J3PbXavrEQ/LtP8jOUrAcyZEqtS6vZpn
	O9WoG1c0+NLnEiQr5kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi4GC-002vyE-SD; Tue, 11 Oct 2022 01:40:44 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi4GA-002vxR-Fy
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 01:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665452442; x=1696988442;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AJO+h75fvHHID9s5Xu2As4qigCw300KI8D6f1Sztp6k=;
  b=llM2S3Q47YgcP079DW4ecGdPB3v6cJN6W0IRFQFsidpJtXq+tffe+/qX
   6AUfZ57KIlvjLZEEA/klDQ5cph3f4XNAOZFHMp54krB8hOwhIiMHhmb0q
   g8y9QLm6/w3oTA10msAO5IPuCoYCibFBmlWPdPDF51+tu0fpNBprAsTL5
   0VyTZqlwSWBuT8/jSgk3TNe/wgVBFJ5zBPi/bH057hzLKrK5wWu/eeqlV
   9NgaBoOQiHq5UH5UZzsu5lWNVEZYpf/y6fozzqsaOWjjVPkMoBx0oqBUp
   vNQIWm4s+OESDn8AfepgnjSg2MviK5KXAUs/AvKCjtNF0znAgmpxgB4Cs
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="284762271"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="284762271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 18:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="657156955"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="657156955"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2022 18:40:37 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oi4G5-0002MI-0y;
	Tue, 11 Oct 2022 01:40:37 +0000
Date: Tue, 11 Oct 2022 09:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 3a53010eac430a9f782b45cb04ce3eee36f31844
Message-ID: <6344c95f.q/9q6zV73O8Ycj97%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_184042_584417_E6853297 
X-CRM114-Status: UNSURE (   3.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 3a53010eac430a9f782b45cb04ce3eee36f31844  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221010
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a012-20221010
i386                 randconfig-a011-20221010
i386                 randconfig-a013-20221010
x86_64                           rhel-8.3-kvm
i386                 randconfig-a015-20221010
riscv                randconfig-r042-20221010
x86_64                               rhel-8.3
i386                 randconfig-a014-20221010
x86_64                           rhel-8.3-syz
i386                 randconfig-a016-20221010
i386                             allyesconfig
x86_64               randconfig-a011-20221010
m68k                             allyesconfig
s390                 randconfig-r044-20221010
x86_64               randconfig-a012-20221010
alpha                            allyesconfig
x86_64               randconfig-a016-20221010
x86_64               randconfig-a015-20221010
x86_64                           allyesconfig
x86_64               randconfig-a013-20221010
arc                              allyesconfig
x86_64               randconfig-a014-20221010
m68k                             allmodconfig
ia64                             allmodconfig
arm                                 defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                      integrator_defconfig
sh                           se7750_defconfig
sh                             shx3_defconfig
mips                      maltasmvp_defconfig
sh                               allmodconfig
sh                           se7206_defconfig
sh                        edosk7760_defconfig
i386                 randconfig-c001-20221010
mips                             allyesconfig
powerpc                          allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64               randconfig-k001-20221010
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                      mgcoge_defconfig
parisc64                            defconfig
m68k                        m5407c3_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     pq2fads_defconfig
powerpc                   currituck_defconfig
arm                           h5000_defconfig
powerpc                    sam440ep_defconfig
mips                          rb532_defconfig
ia64                          tiger_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
m68k                        stmark2_defconfig
arm                        trizeps4_defconfig
arm                           stm32_defconfig
arm                            pleb_defconfig
arm                         s3c6400_defconfig
arm                         lubbock_defconfig
m68k                        m5272c3_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221010
i386                 randconfig-a003-20221010
hexagon              randconfig-r041-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a005-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a005-20221010
arm                       imx_v4_v5_defconfig
mips                     cu1000-neo_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
