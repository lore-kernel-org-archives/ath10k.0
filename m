Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF9FC00140
	for <ath10k@archiver.kernel.org>; Tue, 26 Jul 2022 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wpqusHxWYFmVbtgZIS7Ygv/TU7GOKJnftxp0Vd3arq8=; b=CVIoK6ng6SeAP4
	VFKk3COWDR6vSiGbo+7c09tpzjXNP3gPg95V0YC3TLH+El0T/hRX/9oyZXWOlj+TRuH9/yP5n0mOH
	lcUFbud7iaLrDsKGVTnhMcBPqITVUPrCRWmFOk1Ri4/e1AroExxfEIto+hWl8I+dkVPUylYqRNN32
	WphvYqrKiUxd5iQYf4CpZRp8uWbar05gMBdmHVB6BrA1Dif+g88AOHXB8WRZ819FbkYaxaSwHAK/k
	uSXUomzC/cZEb3o1a+6uz3DSbGJa5UQ6X6dj4MWDciRyE0JP/zj4g+w8RsJwGUriTh84BTmjRfNuh
	fNyCMqKFq/ZAPNMa+NOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGR7F-003DvG-Ud; Tue, 26 Jul 2022 20:25:17 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGR7C-003Dqk-55
	for ath10k@lists.infradead.org; Tue, 26 Jul 2022 20:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658867114; x=1690403114;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=goWP33AR5NJqEihcGfunIDTGbHGZVdZ8tAvchGO6Ym4=;
  b=kBhejO5m8cUGD4LySsuGdqPdQQC2GVhIUevDhHPJOcfk99LdCYc/T2fk
   S061S5ECeReobEjizlcnp/WJ8hqtiYmpJsCa1X7MU9GIIDLTjvDhqvMQ9
   gsfsEtEIbXzasht1aLaKRe2DK0hMZia9OqvdD6UtRtLhXADOnUdYEDy0i
   NjQgfA2njWLd7s5ivw0k68HB0WijUDc/q6+VUgjbRNJGegQMq1QfvaZxp
   zWv8f31rt9PnSea6bJEUqZTzP9xVdVnMVHwoaLVFQE9SMW4Ozmvm6gDjM
   VH8cHvSvyT87VkZA78zfgIW01gIuGdGmb6t6a08dxdHpTCUAGJ2k2ZsPA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="271087521"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="271087521"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 13:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="927486735"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2022 13:25:09 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGR76-0007hP-2P;
	Tue, 26 Jul 2022 20:25:08 +0000
Date: Wed, 27 Jul 2022 04:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 5211cc0fb21e2fa6bdb81a7152237c2d93e51580
Message-ID: <62e04d7f.VEBZe3xCc3W67Axl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_132514_310207_EC6FF625 
X-CRM114-Status: UNSURE (   6.18  )
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
branch HEAD: 5211cc0fb21e2fa6bdb81a7152237c2d93e51580  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 724m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc              randconfig-c003-20220724
i386                          randconfig-c001
sh                   sh7724_generic_defconfig
arm                         s3c6400_defconfig
m68k                       m5249evb_defconfig
arm                       multi_v4t_defconfig
m68k                          multi_defconfig
xtensa                          iss_defconfig
arc                      axs103_smp_defconfig
m68k                            mac_defconfig
sh                            shmin_defconfig
powerpc                       eiger_defconfig
parisc                generic-32bit_defconfig
mips                         rt305x_defconfig
powerpc                      makalu_defconfig
loongarch                 loongson3_defconfig
alpha                               defconfig
loongarch                           defconfig
m68k                        m5272c3_defconfig
ia64                      gensparse_defconfig
alpha                            alldefconfig
arc                     nsimosci_hs_defconfig
xtensa                         virt_defconfig
arm                           h5000_defconfig
arm                           sama5_defconfig
arm                         vf610m4_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                             ezx_defconfig
mips                             allmodconfig
powerpc                     ep8248e_defconfig
sh                        sh7763rdp_defconfig
mips                     loongson1b_defconfig
powerpc                         ps3_defconfig
arm                        keystone_defconfig
sh                          rsk7264_defconfig
powerpc                     rainier_defconfig
m68k                           virt_defconfig
arm                     eseries_pxa_defconfig
powerpc                  storcenter_defconfig
sh                           se7705_defconfig
sh                             espt_defconfig
m68k                                defconfig
mips                           gcw0_defconfig
mips                         tb0226_defconfig
sh                     sh7710voipgw_defconfig
m68k                       m5275evb_defconfig
arm                        shmobile_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                    adder875_defconfig
arm                           sunxi_defconfig
arm                       aspeed_g5_defconfig
sh                          sdk7780_defconfig
arm                         nhk8815_defconfig
nios2                            allyesconfig
arc                          axs103_defconfig
nios2                               defconfig
m68k                          atari_defconfig
mips                 decstation_r4k_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8555_defconfig
mips                      fuloong2e_defconfig
arm                        oxnas_v6_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
sparc                               defconfig
m68k                         amcore_defconfig
nios2                         10m50_defconfig
loongarch                         allnoconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220724
riscv                randconfig-r042-20220724
arc                  randconfig-r043-20220724
arc                  randconfig-r043-20220726
s390                 randconfig-r044-20220726
riscv                randconfig-r042-20220726
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                      walnut_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          moxart_defconfig
arm                         shannon_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                      tct_hammer_defconfig
x86_64                           allyesconfig
arm                  colibri_pxa300_defconfig
powerpc                     powernv_defconfig
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220726
hexagon              randconfig-r041-20220726

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
