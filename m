Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045AFECAAA1
	for <ath10k@archiver.kernel.org>; Tue,  6 Sep 2022 06:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IMiBrsvi8N7BNRWIm+Fvdbnc8cuDrsLF0pIwwBM0kPA=; b=4dmf5TQF2wAvV6
	eAurBzO1bSo2FLKQ+f3XuQioEp3ux3UKV8pBO1EMACzq9eCT4rdz0ZhqdomUUnxcA076o7FPbPMRA
	81RbsKRJb8ekzS+KpQA/QxhOGZLogvqxw5B0FHSEC4uL3zyDZA5tktO5h4CqtZQhr2iS8uSDMhnse
	0jPm/60JZza3D+5JmC7o7mwvLC5p7ZET4e7xdX+H2Qrn1cRmFPsnHHZ2a3rZZXct0AJlMjDKknJ2p
	Q0o4v+hoXxx3/LHbUj3UmSJV4CRMxw7ajfVzTtzs1llzmm4PT0lLoHXzutkv0ILUlBwL75yqdKVWo
	lF8aHduoDJYxzyk4bVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVRnF-00AI24-UA; Tue, 06 Sep 2022 06:10:41 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVRnC-00AHxV-Fg
	for ath10k@lists.infradead.org; Tue, 06 Sep 2022 06:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662444638; x=1693980638;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zr58wkdK7NJCPJCvhdyO9anmXGKhRd12WioYo+mUrYk=;
  b=gq6K+N3xtwaRec1bSlhrCKCFryaXhZ9sHicw9pgbGQqccTeYUB5bdNVo
   +xFyu4ZBJodN6oiOpYIA6C1V5ReuA9A8PWj25AHNlj28qt5d4DJgRI1iZ
   e/caEJYyG80jZ94iPWMaDm+KyjfCugzKMzM5CBYTdxI6AdueH7yczc2LE
   k2k67nUwsHu9t+suIQiF1EcuroVzZc55e03VQFvk8rYDO5T9oD1xR6csR
   GdGeJVFqwlkbB0d5YicqWa19hpEoobuwXhZRwNWY128PhrUs46CXtIuog
   3VLwY+tzrGCRJC4KxGQdovMHbKs1cutHLCwzyaAeaXbyS7TRASOGKsL0e
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="296514342"
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="296514342"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 23:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="564973977"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2022 23:10:14 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVRmk-0004rh-2E;
	Tue, 06 Sep 2022 06:10:10 +0000
Date: Tue, 06 Sep 2022 14:09:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 2ddc20e6d93fa689e75f4fde7d010ef58467782f
Message-ID: <6316e411.JkwUxzdZne091GTW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_231038_601522_450B50A7 
X-CRM114-Status: UNSURE (   5.36  )
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
branch HEAD: 2ddc20e6d93fa689e75f4fde7d010ef58467782f  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 725m

configs tested: 130
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
sh                               allmodconfig
m68k                             allmodconfig
x86_64                              defconfig
arc                  randconfig-r043-20220905
i386                 randconfig-a003-20220905
i386                 randconfig-a005-20220905
i386                 randconfig-a006-20220905
i386                 randconfig-a001-20220905
i386                 randconfig-a002-20220905
i386                 randconfig-a004-20220905
x86_64                           allyesconfig
x86_64                               rhel-8.3
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
x86_64               randconfig-a001-20220905
x86_64               randconfig-a006-20220905
x86_64               randconfig-a004-20220905
x86_64               randconfig-a003-20220905
x86_64               randconfig-a002-20220905
x86_64               randconfig-a005-20220905
m68k                             allyesconfig
arm                                 defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                                defconfig
x86_64                          rhel-8.3-func
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
um                               alldefconfig
parisc                generic-32bit_defconfig
loongarch                 loongson3_defconfig
arm                            lart_defconfig
sh                           se7721_defconfig
mips                  decstation_64_defconfig
arc                            hsdk_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                               defconfig
arm                            hisi_defconfig
sh                            titan_defconfig
powerpc                       maple_defconfig
arm                             pxa_defconfig
loongarch                        alldefconfig
powerpc                  storcenter_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                        m5407c3_defconfig
powerpc                     sequoia_defconfig
mips                            ar7_defconfig
xtensa                          iss_defconfig
i386                 randconfig-c001-20220905
sparc                            allyesconfig
sh                             shx3_defconfig
mips                           ip32_defconfig
sh                          sdk7780_defconfig
openrisc                            defconfig
arm                          pxa910_defconfig
ia64                         bigsur_defconfig
powerpc                         ps3_defconfig
sh                          r7780mp_defconfig
openrisc                 simple_smp_defconfig
sh                         ap325rxa_defconfig
s390                          debug_defconfig
arm                         vf610m4_defconfig
sh                             sh03_defconfig
powerpc                      pcm030_defconfig
sh                           se7780_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                      integrator_defconfig
arm                        spear6xx_defconfig
arm                          iop32x_defconfig
sh                         microdev_defconfig
ia64                             allmodconfig
powerpc                      ppc40x_defconfig
microblaze                          defconfig
m68k                          sun3x_defconfig
sh                          rsk7201_defconfig
arm                  randconfig-c002-20220905
x86_64               randconfig-c001-20220905
m68k                          atari_defconfig
mips                           gcw0_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r045-20220905
riscv                randconfig-r042-20220905
hexagon              randconfig-r041-20220905
s390                 randconfig-r044-20220905
x86_64               randconfig-a014-20220905
x86_64               randconfig-a011-20220905
x86_64               randconfig-a016-20220905
x86_64               randconfig-a012-20220905
x86_64               randconfig-a015-20220905
x86_64               randconfig-a013-20220905
arm                          moxart_defconfig
arm                         palmz72_defconfig
arm                        spear3xx_defconfig
powerpc                       ebony_defconfig
i386                 randconfig-a013-20220905
i386                 randconfig-a012-20220905
i386                 randconfig-a011-20220905
i386                 randconfig-a014-20220905
i386                 randconfig-a015-20220905
i386                 randconfig-a016-20220905
x86_64               randconfig-k001-20220905
arm                       cns3420vb_defconfig
mips                       lemote2f_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                          malta_defconfig
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
powerpc                   bluestone_defconfig
mips                      bmips_stb_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
