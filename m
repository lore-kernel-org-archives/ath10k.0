Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AA4C19F2D
	for <ath10k@archiver.kernel.org>; Tue,  9 Aug 2022 18:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gefD2/F+NIHye7+aPCGcXnu/Zufb/5Kxpijgw8KCfC4=; b=l40WiZseDaIm8g
	/MVa0pGphrbdY2iMFzcYcAqTCQ9XOz9lk8DpKKeOsVkqnZBpC1wNELid+TJY+Ywvob/so+mA2KxU7
	y1Rr1kbN+/sJ0WTSrBHWr0jYC7PA0s9MWbhTx2jA0g8oSMaXPKFeuaNYYZ3rX9abZyUFShT0ShJgJ
	/ywGKpcAv95W/5YcbqM0nui1O3U8V6mJHu7SbNUjLk/gTtVsKoetpbuBR97CRCQ/kHC1De1+G901x
	Ub7T08QLPYi6fIEgf9NzLOkUeMU+RjUXjgwOMcccFHHy036kjD6SkIKpUYpM2UeauINvg82WEFjr7
	/YvxAi+iwZDs668cf4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLUDv-005c6Y-6y; Tue, 09 Aug 2022 18:45:03 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLUDs-005c3Z-Hm
	for ath10k@lists.infradead.org; Tue, 09 Aug 2022 18:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660070700; x=1691606700;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ajus/KcUz4uOvfDtpeRkNcDstR0/mh91egdugiPiFsg=;
  b=L1SV56hdOhSNQ94fkgxSs6PspIyw7SWuRkOZVIkBnriR2InaS9aF95LP
   M5Tpx1snHDAQ7K3AYDnVha/My6apTZ61UAeLeoM/tBCCWvCoPb28PBpFq
   ZpNWNhfM9N+YNVNqB4ja0fn07JEy8UY8JgyXMzSybqkCOI86963C0n521
   RqRjy79/gCgwsPActgJtSpTqIQuBE1oArrpSOZiDWX/8pI8t8TX8ZzEae
   p17fiOtI0jebDey3CGEkIHnrnL/IL4tCHgiV/2EONz6rtQX9wcXWJIIbZ
   Pa13vWHy5wUfbpFEgrCGYtMSNDeVTW3cXTizZ3YOSRzFZLcRH5Qj2pVEZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="291695468"
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="291695468"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 11:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="580911653"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Aug 2022 11:44:56 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLUDn-000NAP-1X;
	Tue, 09 Aug 2022 18:44:55 +0000
Date: Wed, 10 Aug 2022 02:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 f60b230094cbf88c73808709e4f9c1cf09eb0b01
Message-ID: <62f2ab14.bnw9Ty9HhzdsJYhy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_114500_673721_521DE839 
X-CRM114-Status: UNSURE (   4.97  )
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
branch HEAD: f60b230094cbf88c73808709e4f9c1cf09eb0b01  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 705m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
riscv                randconfig-r042-20220809
arc                  randconfig-r043-20220809
s390                 randconfig-r044-20220809
powerpc                           allnoconfig
i386                 randconfig-a001-20220808
x86_64                              defconfig
x86_64               randconfig-a003-20220808
mips                             allyesconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20220808
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a001-20220808
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a005-20220808
sh                               allmodconfig
i386                 randconfig-a003-20220808
x86_64               randconfig-a002-20220808
arm                                 defconfig
i386                 randconfig-a004-20220808
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a006-20220808
x86_64                           rhel-8.3-syz
i386                 randconfig-a005-20220808
x86_64               randconfig-a006-20220808
x86_64                           allyesconfig
x86_64               randconfig-a004-20220808
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220808
m68k                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
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
ia64                             allmodconfig
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
hexagon              randconfig-r045-20220809
hexagon              randconfig-r041-20220809
i386                 randconfig-a011-20220808
i386                 randconfig-a013-20220808
i386                 randconfig-a012-20220808
i386                 randconfig-a014-20220808
x86_64               randconfig-a013-20220808
i386                 randconfig-a015-20220808
i386                 randconfig-a016-20220808
x86_64               randconfig-a015-20220808
x86_64               randconfig-a016-20220808
x86_64               randconfig-a012-20220808
x86_64               randconfig-a011-20220808
x86_64               randconfig-a014-20220808
hexagon              randconfig-r041-20220808
hexagon              randconfig-r045-20220808
riscv                randconfig-r042-20220808
s390                 randconfig-r044-20220808
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
