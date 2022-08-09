Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6449C19F2D
	for <ath10k@archiver.kernel.org>; Tue,  9 Aug 2022 18:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZUQVHY6bCF5/ygVxAenJYcb2uluqxNSBfSTST86INlE=; b=X+mkUqRCsc6jxt
	M3CFo5s/SIvarMqemfKtS0nD+X3LaXog/PaGbvE2zt7w14tmkh6Qkyhx09QsopLpddmglEzcN0JxL
	wHC+pH38Nx+LzMelnBTEQLz4WENMwpmFCpVvX7f4gJQfVZ1DrSIgbJb5Fg8bv36Z6niWUqT/M9grC
	iYE82KhxcyfcmnUNFd2MgB4YTYDxqckLEk68HFs0Rq72f29P+lXzI9J6eGAkD0r5dGsR8HDb1VvAm
	CwAbntfaB61ubL8PolW9gqkJyV6dHKSn7mObkpn43jKtYTiwgGD4fAXZSLJCKcLpDveWCquneaU1Y
	10PliASOzK0p8PraZOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLUD8-005bgs-LF; Tue, 09 Aug 2022 18:44:14 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLUD5-005beK-4v
	for ath10k@lists.infradead.org; Tue, 09 Aug 2022 18:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660070651; x=1691606651;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ESmK5ZyGAYIWuSc0y8TaukE82uf9hpIBrYjYp+oFXJM=;
  b=OIJVPjJkWk87GV1AjL3cVkS5eY+VvFjDNhpY/vovY9bjzMcvk6y1p5lH
   ScDVCBNzukrUYlkTQabE4icUr27MQjo6VwbtBnEQsovC85WzpbyQOt2rF
   R8DG0wi075bNcA2on76Fvumpae+CWa7MALGvJQlSzRXkgTtt8jJxxPWBu
   MPKK5O4Y2OxWz1eK8F7brLtG5O6ugiOyzCB3643wgQ4lz4TMzUz00uZbC
   +U7cnlhU3QEwUZ3Pea2r0ywx5qkU23CkUhp498Dqnl8BAE+Mj1eLJJEiG
   uI8hcB8e8Oiwlv2wu/9kUL2M5O86AAv81lXCcIL4ZajfUWch/fVE0St58
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="354909264"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="354909264"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 11:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="580911351"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 11:43:56 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLUCp-000NAJ-1T;
	Tue, 09 Aug 2022 18:43:55 +0000
Date: Wed, 10 Aug 2022 02:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 f020d9570a04df0762a2ac5c50cf1d8c511c9164
Message-ID: <62f2aae7.UUFyn+h8k9APkCRh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_114411_265437_843C39C0 
X-CRM114-Status: UNSURE (   4.33  )
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
branch HEAD: f020d9570a04df0762a2ac5c50cf1d8c511c9164  wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()

elapsed time: 704m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
i386                 randconfig-a001-20220808
i386                 randconfig-a002-20220808
i386                 randconfig-a003-20220808
i386                 randconfig-a004-20220808
i386                 randconfig-a005-20220808
i386                 randconfig-a006-20220808
i386                             allyesconfig
x86_64               randconfig-a003-20220808
x86_64               randconfig-a001-20220808
x86_64               randconfig-a002-20220808
x86_64               randconfig-a006-20220808
m68k                             allmodconfig
x86_64                              defconfig
arc                              allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
arc                  randconfig-r043-20220808
x86_64               randconfig-a004-20220808
m68k                             allyesconfig
sh                               allmodconfig
x86_64               randconfig-a005-20220808
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
mips                             allyesconfig
powerpc                           allnoconfig
arm                                 defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                          rsk7203_defconfig
riscv                    nommu_k210_defconfig
powerpc                       holly_defconfig
sparc64                             defconfig
arm                           u8500_defconfig
csky                             alldefconfig
mips                    maltaup_xpa_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                ecovec24-romimage_defconfig
mips                      loongson3_defconfig
loongarch                        alldefconfig
sh                           sh2007_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                 randconfig-c001-20220808
sh                   secureedge5410_defconfig
xtensa                  audio_kc705_defconfig
sh                          rsk7264_defconfig
powerpc                      chrp32_defconfig
arm                         assabet_defconfig

clang tested configs:
x86_64               randconfig-a013-20220808
x86_64               randconfig-a012-20220808
x86_64               randconfig-a011-20220808
x86_64               randconfig-a014-20220808
x86_64               randconfig-a015-20220808
x86_64               randconfig-a016-20220808
hexagon              randconfig-r045-20220808
riscv                randconfig-r042-20220808
hexagon              randconfig-r041-20220808
s390                 randconfig-r044-20220808
i386                 randconfig-a011-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
i386                 randconfig-a016-20220808
i386                 randconfig-a015-20220808
arm                       mainstone_defconfig
arm                   milbeaut_m10v_defconfig
x86_64               randconfig-k001-20220808

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
