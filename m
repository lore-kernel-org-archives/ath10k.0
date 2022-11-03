Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D7C433FE
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 05:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Fz5cAXstl9nU1BHVr+0RWr94tKsj4aEQOm6rkkR5V4=; b=UhThzrgAVWLh8j
	8Q8tePyR5ucoB2YEYma6JX03vdu/2KguR3B8VpqSBxInF+0rea7wprqFkhT1q/NCfDOGZxKk3b8zp
	r2ZH30v4+r3b2++txCsbG5J0U3Dtyenag3HsmuKN4sSx6iwezRWfyJPN1EnzMAoZqs1YPyjlsoU0U
	s5PIoRR5G6DvFOR9xMYU+o7rOkKJIY70TQvNWkGwwLvWAYWM3S07SBbxKbpfgjeeMK82E7tv4pido
	bD3zayrXjwNhjPmrznRSHnkWlq2IUEH3RSWC+7ZRMQxA8tLgIUv3qsu3eBuQ/pmgmsnb0OZ4p76R1
	G9sUiDXMO2qECXS1fQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqSbT-00G7PQ-Cc; Thu, 03 Nov 2022 05:17:23 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqSbQ-00G7O5-D0
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 05:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667452640; x=1698988640;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OIVY1wkKvMQpa2w5cShTIRrhs/lIZdUJaI53t+aAl9U=;
  b=hXrWgGLJmnbKktSTa029TZGMYyOCjb9QPT2tnmFmnfS8Dz7aUho8sNDI
   IBdqD4zV29bnqRa/GLxX5sJtqNTSkt3VLabAJlYFluURTov5/Yfd0MSEp
   CPJcE05+Hjp45RruOiQhNSW436RuyobO2JBKXGnDN1EPUIhA7H9oPhkrD
   Yc+aHeeRVsmpMn0q5Hvq0GLPaLgtRetN8B8X7LdlRSpAuo4hL3PgoDj3A
   ZZJHn+cOLwP3/gB0aWpjyMQ6A1HScLTTNGLE9K+L0CRcCCIWX++hSG6qn
   Jg1NQjWmOXwlmeW5ADPnoM6RvWbvcGeDE6RjzUs+QYc4HNA9opbZWHpE/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="292909404"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="292909404"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 22:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="612507004"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="612507004"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 22:17:14 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqSbK-000FWm-06;
	Thu, 03 Nov 2022 05:17:14 +0000
Date: Thu, 03 Nov 2022 13:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 dd1c2322694522f674c874f5fa02ac5ae39135dd
Message-ID: <63634ec0.VusBj8XYRN9ySRDG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_221720_515851_3801ADEC 
X-CRM114-Status: UNSURE (   5.50  )
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
branch HEAD: dd1c2322694522f674c874f5fa02ac5ae39135dd  wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type

elapsed time: 725m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
m68k                             allyesconfig
alpha                               defconfig
m68k                             allmodconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221103
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                       m5208evb_defconfig
powerpc                         wii_defconfig
m68k                       m5275evb_defconfig
m68k                         apollo_defconfig
mips                     decstation_defconfig
sparc                       sparc32_defconfig
m68k                          multi_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                        multi_v7_defconfig
arm                         s3c6400_defconfig
sh                        apsh4ad0a_defconfig
arm                           tegra_defconfig
sh                          rsk7203_defconfig
i386                          randconfig-c001
sh                        edosk7760_defconfig
arm                       aspeed_g5_defconfig
um                                  defconfig
parisc64                            defconfig
powerpc                   motionpro_defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                               alldefconfig
sh                                  defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
parisc                           allyesconfig
arm                            pleb_defconfig
arm                  randconfig-c002-20221102
x86_64                        randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
arm                       cns3420vb_defconfig
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
riscv                randconfig-r042-20221103
s390                 randconfig-r044-20221103
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221102
hexagon              randconfig-r045-20221102
mips                     loongson1c_defconfig
mips                           mtx1_defconfig
powerpc               mpc834x_itxgp_defconfig
riscv                    nommu_virt_defconfig
mips                       rbtx49xx_defconfig
arm                         socfpga_defconfig
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
