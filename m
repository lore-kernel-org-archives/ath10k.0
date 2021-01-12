Return-Path: <SRS0=zfzF=GP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7922EC433E0
	for <ath10k@archiver.kernel.org>; Tue, 12 Jan 2021 23:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 130EC2312F
	for <ath10k@archiver.kernel.org>; Tue, 12 Jan 2021 23:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 130EC2312F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b05XENgh6CaiRpJPvoIbqy8bwS9WvjhtElDcnWLwSlg=; b=mnMY2zUhmAhZeSeJnq6kXds6rv
	b1maeibHZ3yH+++mW9yiWqR6WWFgmKxbkBTgKLJoGy4tJLykzd0yPV4iPMKmVlx8MHYOZILHbS9Qk
	MXNd+aHCN7wX9KOM4TJzsMRHxLQB20O6oceXHuHCTr2Wsj4K0c59WehxPrUQ/gR7LgqVEhvpihlQW
	dI1yzD2HdHFWbp7x2eC6xivA9dQFU9vsPSb5/zsmkLzLi/l2dHAT+pHlGb8hsYOdSi1/36IMa2/xt
	hh8Z4LMT0ug5mMBH4ny7ri2asDdTkYZrcVx/1TYUWutVzrzYrBJEjZXgUOYOcUjmLOjFfWXn78BKk
	KsMm0Mfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzT2d-0001wc-6H; Tue, 12 Jan 2021 23:25:35 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzT2a-0001vF-8F
 for ath10k@lists.infradead.org; Tue, 12 Jan 2021 23:25:33 +0000
IronPort-SDR: 5g2yxdmnuCB0SbAP/y2QKpjmt+OGUe9j+Z7KuL4NC4u6sxCQfv28Icqu14yV18YnxZRVUevlV7
 GK9faO3IjBBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="157898629"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="157898629"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 15:25:30 -0800
IronPort-SDR: gVCyM3XMI6ReY03F/QxhF/TMABEpRv13Zhp6psO95sPG1G1D7Z9gpi2HiC1XXgmfqxQ95rSu+7
 ZN+LBjCFbV5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="397526606"
Received: from lkp-server01.sh.intel.com (HELO 974c6bfa98f0) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2021 15:25:29 -0800
Received: from kbuild by 974c6bfa98f0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kzT2X-00001E-4x; Tue, 12 Jan 2021 23:25:29 +0000
Date: Wed, 13 Jan 2021 07:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 4923686b30510b7c1795258da6f67db7f074a2b1
Message-ID: <5ffe2fc7.ey2L6LDc6L/CNQam%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_182532_559981_81DE9774 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  pending
branch HEAD: 4923686b30510b7c1795258da6f67db7f074a2b1  wcn36xx: Remove unnecessary memset

elapsed time: 726m

configs tested: 164
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
powerpc                     akebono_defconfig
powerpc                  mpc866_ads_defconfig
mips                         db1xxx_defconfig
mips                           rs90_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                  cadence_csp_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                   motionpro_defconfig
c6x                        evmc6678_defconfig
m68k                       m5275evb_defconfig
h8300                               defconfig
arm                         shannon_defconfig
sparc64                             defconfig
arm                            xcep_defconfig
arm                            hisi_defconfig
powerpc                     tqm8548_defconfig
mips                           jazz_defconfig
powerpc                      cm5200_defconfig
arm                          iop32x_defconfig
arm                         cm_x300_defconfig
m68k                       m5475evb_defconfig
ia64                          tiger_defconfig
mips                      loongson3_defconfig
arm                          collie_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                     cu1000-neo_defconfig
xtensa                          iss_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     kmeter1_defconfig
arm                      integrator_defconfig
m68k                          amiga_defconfig
mips                        qi_lb60_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc836x_mds_defconfig
sh                           se7780_defconfig
sh                          sdk7786_defconfig
arm                         mv78xx0_defconfig
arm                          tango4_defconfig
powerpc                       ebony_defconfig
arm                            lart_defconfig
arm                         lubbock_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
ia64                      gensparse_defconfig
arm                          moxart_defconfig
powerpc                      arches_defconfig
arm                             rpc_defconfig
arc                        nsimosci_defconfig
m68k                          multi_defconfig
arm                           corgi_defconfig
sh                          r7785rp_defconfig
powerpc                       eiger_defconfig
m68k                            mac_defconfig
arm                       spear13xx_defconfig
sh                                  defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
mips                        maltaup_defconfig
sh                        dreamcast_defconfig
sh                      rts7751r2d1_defconfig
arm                           h3600_defconfig
m68k                         amcore_defconfig
sh                            shmin_defconfig
c6x                        evmc6472_defconfig
sh                              ul2_defconfig
powerpc                    socrates_defconfig
um                           x86_64_defconfig
arm                         palmz72_defconfig
arm                         assabet_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7722_defconfig
powerpc                 mpc834x_itx_defconfig
csky                             alldefconfig
arm                           omap1_defconfig
mips                         cobalt_defconfig
sh                           se7206_defconfig
powerpc                  storcenter_defconfig
sparc64                          alldefconfig
xtensa                  nommu_kc705_defconfig
arm                          prima2_defconfig
arm                           stm32_defconfig
arc                           tb10x_defconfig
arc                              alldefconfig
mips                 decstation_r4k_defconfig
arm                         hackkit_defconfig
m68k                          atari_defconfig
arm                              zx_defconfig
powerpc                          g5_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
x86_64               randconfig-a015-20210112
x86_64               randconfig-a012-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
i386                 randconfig-a012-20210112
i386                 randconfig-a011-20210112
i386                 randconfig-a016-20210112
i386                 randconfig-a013-20210112
i386                 randconfig-a015-20210112
i386                 randconfig-a014-20210112
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210112
x86_64               randconfig-a004-20210112
x86_64               randconfig-a001-20210112
x86_64               randconfig-a005-20210112
x86_64               randconfig-a003-20210112
x86_64               randconfig-a002-20210112

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
