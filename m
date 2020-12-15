Return-Path: <SRS0=cltn=FT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB8CC4361B
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 20:42:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09850222BB
	for <ath10k@archiver.kernel.org>; Tue, 15 Dec 2020 20:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09850222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DcPlKoE/bMQsPxtJZEczyHKp8ngOSYvT2l+wy/hUW1s=; b=hE9kRzDtt3wFJF6ZCV+QPOn1ly
	7GqdrhqeYpHuRaPp3tm3hnO9FePUXZyc8j3H+XAVlYPO+ZWEJ8UrZ3oVnlHpGWyVDrZLM7bZukiPt
	btMEeCjLD2uV/DQ1zGNhkeoEZLF81ajl/rWQr54kM1S5gkZlg6JiIfNeWYOxsWqKU8+VKV/xIeCai
	H/k0AyyEtwQYhs0I8rH3TpQWfEX89wgGTCNzK5Z5j9x8Ru9cs3RjrSK1+IUKZSjXGFG/4rLPSv7kw
	pexKL69OGtAYCIoieJxU8gxpJ9UEgcno3e5mtq8jGPyYHto3hVJg3Qta6SEUNJfaWcz/YqqiLQrTJ
	Atz3L/Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpH8j-0001Up-C8; Tue, 15 Dec 2020 20:41:45 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpH8g-0001U8-KG
 for ath10k@lists.infradead.org; Tue, 15 Dec 2020 20:41:44 +0000
IronPort-SDR: K8aoBM/zc2RaPv4CC1oSskmcVoGxeLcrzqIB2+mJaqR40bDwvJ6wxcglx6/2SSH4fMQn3BbQ4D
 UBHcDJQwDjKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="171440078"
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="171440078"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 12:41:40 -0800
IronPort-SDR: oUYvSibipMDd0IeqrJ0Qtq/QQ0azX+FrADno3S7iEdMJUDi58TJDGcWVmXdDF6Or6wn7IJLAIf
 0Vx/yy4zRY2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="412142309"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 15 Dec 2020 12:41:38 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kpH8b-0000vc-Ic; Tue, 15 Dec 2020 20:41:37 +0000
Date: Wed, 16 Dec 2020 04:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 2fe769592ef6d4ae14260989dcbdbde4bff01cb6
Message-ID: <5fd91f77.CFnXgm/2MpwilIn1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_154142_831072_2547113B 
X-CRM114-Status: UNSURE (   9.58  )
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
branch HEAD: 2fe769592ef6d4ae14260989dcbdbde4bff01cb6  ath10k: prevent deinitializing NAPI twice

elapsed time: 725m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        shmobile_defconfig
sh                ecovec24-romimage_defconfig
arm                      pxa255-idp_defconfig
sh                         microdev_defconfig
sh                           se7712_defconfig
powerpc                      bamboo_defconfig
m68k                       m5275evb_defconfig
powerpc                  iss476-smp_defconfig
h8300                       h8s-sim_defconfig
powerpc                     powernv_defconfig
arm                         assabet_defconfig
ia64                      gensparse_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc836x_mds_defconfig
nios2                         10m50_defconfig
mips                       bmips_be_defconfig
mips                     cu1830-neo_defconfig
powerpc                       ebony_defconfig
riscv                            alldefconfig
powerpc                     tqm8540_defconfig
powerpc                      tqm8xx_defconfig
sparc64                             defconfig
ia64                            zx1_defconfig
powerpc                     kmeter1_defconfig
powerpc                     mpc5200_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc8540_ads_defconfig
arm                           viper_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
um                             i386_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                            qcom_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                        sh7785lcr_defconfig
xtensa                  cadence_csp_defconfig
powerpc                     asp8347_defconfig
arm                        realview_defconfig
arm                       netwinder_defconfig
powerpc                         ps3_defconfig
powerpc                      obs600_defconfig
sh                   sh7770_generic_defconfig
mips                        nlm_xlp_defconfig
powerpc                     pq2fads_defconfig
powerpc                     tqm5200_defconfig
sh                        sh7763rdp_defconfig
arm                          collie_defconfig
arm                      jornada720_defconfig
sh                           se7722_defconfig
powerpc                      pcm030_defconfig
powerpc                    klondike_defconfig
sh                   secureedge5410_defconfig
powerpc                 mpc834x_mds_defconfig
arm                  colibri_pxa300_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
c6x                                 defconfig
m68k                           sun3_defconfig
arm                     davinci_all_defconfig
powerpc                 linkstation_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
mips                         tb0287_defconfig
powerpc                     sequoia_defconfig
mips                  decstation_64_defconfig
arm                         vf610m4_defconfig
arm                       mainstone_defconfig
c6x                        evmc6678_defconfig
m68k                          atari_defconfig
m68k                        m5272c3_defconfig
arm                        neponset_defconfig
arm                           corgi_defconfig
parisc                           alldefconfig
mips                      pic32mzda_defconfig
mips                           xway_defconfig
arm                         mv78xx0_defconfig
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
x86_64               randconfig-a003-20201215
x86_64               randconfig-a006-20201215
x86_64               randconfig-a002-20201215
x86_64               randconfig-a005-20201215
x86_64               randconfig-a004-20201215
x86_64               randconfig-a001-20201215
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
i386                 randconfig-a001-20201215
i386                 randconfig-a004-20201215
i386                 randconfig-a003-20201215
i386                 randconfig-a002-20201215
i386                 randconfig-a006-20201215
i386                 randconfig-a005-20201215
i386                 randconfig-a014-20201215
i386                 randconfig-a013-20201215
i386                 randconfig-a012-20201215
i386                 randconfig-a011-20201215
i386                 randconfig-a015-20201215
i386                 randconfig-a016-20201215
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214
x86_64               randconfig-a016-20201215
x86_64               randconfig-a012-20201215
x86_64               randconfig-a013-20201215
x86_64               randconfig-a015-20201215
x86_64               randconfig-a014-20201215
x86_64               randconfig-a011-20201215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
