Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CDEC433FE
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 02:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SGSe4JL7lKnuZ3QI55akB/E+pS76Wyq+nJVkI82V5jQ=; b=sR86VlE2RJCM6S
	6zA0iaOlNu6FWBJldndtMURFzl200IHWaeeKPI8Oyh/39PQarnoEwQgY0ShyjD/ndRcnF6Tji3Pvj
	Txx/cSdQ08VkP+ZyUt5OPaYfcZweYIvm12Eh/6wdRdIm1+D6CI4ryv3UMPiLiMIwev9kIfJ4cUAx1
	dlvLDv2/3K4FbV0TdRft48Ec3xksctp0djrWI/cbQMqRKb7+MZjBgA4dJfLm6AvcHcyI8vnpmnVLR
	BU+NKXO3WG2HwB9H/npy9CcMiSf3W6ztZO5Mxtb4TQBEn6RKdr9AjplsfyzUHMtcJuNXTOFae9Bxp
	LB8yJRx5cuG9YlJLdOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiRCX-006VEY-Ea; Wed, 12 Oct 2022 02:10:29 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiRCV-006VC6-A0
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 02:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665540627; x=1697076627;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ioT1Hsmn0VvD3iH82/5zp9eQ83rX1B3J5w8ViiY7pkI=;
  b=R4XmqKXBn5vG+9SQSs0/Miwwlr7XN7rmmYsLslLgBQ/nGJuG7xoULaro
   lCR6lPhpYgWXiUnOb9KWSoCCg4MkBeZI5b4NWE2QqavXsGmPzxxzU+vbS
   u+34r2dKu4QXhdeHe8oDH+e7VKHyJfCsSouGJouoICK7qZtrFoPnOiJzt
   zwO7XkMwxhcdbArWxPLrfZl1HjLjDPtn6y/eQcJ/fMVuJzlxIywGYoHvM
   U6yYxs0yvz/FVANzkgOJRIgLuhuMKQ6Y6S5EyMdahNy+9xVgNCWgybhro
   VwS2Roc8H+7CqNYkHmFZlpZbvqG4RAbxukTwNo0RGM+sRnOG+gfYMJrm3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="368841854"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; 
   d="scan'208";a="368841854"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 19:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="577660764"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; 
   d="scan'208";a="577660764"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Oct 2022 19:10:10 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oiRCD-0003Mc-2Q;
	Wed, 12 Oct 2022 02:10:09 +0000
Date: Wed, 12 Oct 2022 10:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 f2f15d0adf34bcee9a609ecb8b0bb29352c98c2c
Message-ID: <634621e1.GViOaU9IW6UaXKwp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_191027_480110_30A84AE3 
X-CRM114-Status: UNSURE (   5.26  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: f2f15d0adf34bcee9a609ecb8b0bb29352c98c2c  wifi: ath12k: fix uninitialized function return value

elapsed time: 720m

configs tested: 115
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                              allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
x86_64               randconfig-a014-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a011-20221010
x86_64               randconfig-a013-20221010
x86_64               randconfig-a016-20221010
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                 randconfig-c001-20221010
arc                  randconfig-r043-20221010
s390                 randconfig-r044-20221010
riscv                randconfig-r042-20221010
i386                 randconfig-a013-20221010
i386                 randconfig-a015-20221010
i386                 randconfig-a016-20221010
i386                 randconfig-a011-20221010
i386                 randconfig-a014-20221010
i386                 randconfig-a012-20221010
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                        mini2440_defconfig
powerpc                     rainier_defconfig
ia64                        generic_defconfig
nios2                         3c120_defconfig
powerpc                     taishan_defconfig
arm                         lpc18xx_defconfig
parisc                generic-64bit_defconfig
arc                         haps_hs_defconfig
xtensa                           alldefconfig
arm                            zeus_defconfig
arm                           sama5_defconfig
openrisc                       virt_defconfig
sh                           se7722_defconfig
nios2                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                           se7750_defconfig
arm                         axm55xx_defconfig
arm                        shmobile_defconfig
m68k                          amiga_defconfig
sh                           se7619_defconfig
s390                          debug_defconfig
arm                          gemini_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
ia64                          tiger_defconfig
sparc64                             defconfig
sh                          sdk7786_defconfig
csky                             alldefconfig
xtensa                  audio_kc705_defconfig
arm                      integrator_defconfig
powerpc                     tqm8541_defconfig
arc                      axs103_smp_defconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20221012
arm                      footbridge_defconfig
ia64                      gensparse_defconfig
sh                 kfr2r09-romimage_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a004-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a005-20221010
i386                 randconfig-a005-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
x86_64                        randconfig-k001
riscv                    nommu_virt_defconfig
arm                         orion5x_defconfig
powerpc                     kmeter1_defconfig
arm                         s3c2410_defconfig
arm                          ep93xx_defconfig
riscv                             allnoconfig
arm                         hackkit_defconfig
arm                         bcm2835_defconfig
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
