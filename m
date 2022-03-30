Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86E5C433F5
	for <ath10k@archiver.kernel.org>; Wed, 30 Mar 2022 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qkmzGkhgTPNKjtSdV+TopiGYxYjOKgOugI9nLSYL2oE=; b=Acve7MKULscbRZ
	it1FeaDi3n3HY/Z6MTPmC0VEMxyB7eQWCLAuzVpraSOb6fcb5ErD+Dlny2BVNhbxLkI8RYrxsSxsD
	qBajIdpbWl5TqIU7pIqgc8P2KKhs6qQsCBCJaxxGvCyhsDkIQC0bPxXWIGqJ8WQjuixk7qREpzE29
	PkgwBgWPKXsNTnboYBVp+/Pz+BKE3VVT/MsuEBwtRJk+U5qZSzzE97MVKozkmMiaKEMUo/tIMe4ju
	jChxUeC/TbcI+srS+ICNxKbIrCVgYd/R+E/cP0LEo+n/Ed2szvXuNuWQduhXCSWI1wVYfGvvRLfLG
	txH2Il2tzE74KC0zG2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZg9h-00HXlw-Br; Wed, 30 Mar 2022 21:47:05 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZg9e-00HXlS-Nv
 for ath10k@lists.infradead.org; Wed, 30 Mar 2022 21:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648676822; x=1680212822;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=gkVyer1YmYMSdqU/c+xtLiLPSM2JTFBW4hQxyOP7TkY=;
 b=Ae+S5nOB0de6e/uFlHsSkKIYhZ9uUFYlqBQU4vvd+Wu9r6TBJqwbmY39
 t7HOzsu1tRJP9EcpkwaHj29OSbVXdIvXOmiOGt3nPgHcBoFxVsJnLoul6
 l+MFB7V2x2nR5EGu9pIZuVJBQlE61QLw8gYaVoQGToEkDFJ8J/LTbvwvf
 05E+o5rEhfvU94d3+ikt8DCrEQf+13gtGIY6BjmhprdYLyoOs7lUINKWa
 f3Ju6vun60iFdBdiInzde6a2YNc7qbRU2Aa7usJKrykrDtlMZNcFaoPe+
 FeRADpYOG0Ley+4dTMTw7PAG9AdlmzGPgTUaBjqr7q8O9JSjUldLqEiXV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="239582510"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="239582510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 14:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="519953020"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 30 Mar 2022 14:47:00 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZg9b-0000XH-Vn;
 Wed, 30 Mar 2022 21:46:59 +0000
Date: Thu, 31 Mar 2022 05:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 748b34786d1c96e758862d8e8577106ccde6515a
Message-ID: <6244cf93.WxKexzIZ3lCKqzEr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_144702_835127_6662A4D0 
X-CRM114-Status: UNSURE (   5.78  )
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
branch HEAD: 748b34786d1c96e758862d8e8577106ccde6515a  Add localversion-wireless-testing-ath

elapsed time: 738m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220330
sh                          landisk_defconfig
sh                        edosk7760_defconfig
powerpc                     rainier_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
powerpc                    klondike_defconfig
sparc                       sparc64_defconfig
sh                          rsk7201_defconfig
m68k                       m5208evb_defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                          iss_defconfig
arm                           tegra_defconfig
mips                  maltasmvp_eva_defconfig
ia64                        generic_defconfig
sh                           se7619_defconfig
powerpc64                        alldefconfig
arm                         cm_x300_defconfig
sh                             espt_defconfig
powerpc                  storcenter_defconfig
sh                        apsh4ad0a_defconfig
mips                        bcm47xx_defconfig
arm                          gemini_defconfig
powerpc                     sequoia_defconfig
arm                        cerfcube_defconfig
sh                         ecovec24_defconfig
arm                        shmobile_defconfig
arm                      integrator_defconfig
sh                          urquell_defconfig
sh                          kfr2r09_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
ia64                      gensparse_defconfig
riscv                            allmodconfig
m68k                          hp300_defconfig
arm                         axm55xx_defconfig
sh                ecovec24-romimage_defconfig
arm                     eseries_pxa_defconfig
powerpc                       holly_defconfig
mips                         cobalt_defconfig
arm                         nhk8815_defconfig
arm                  randconfig-c002-20220330
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20220330
s390                 randconfig-r044-20220330
arc                  randconfig-r043-20220330
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220330
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220330
riscv                randconfig-c006-20220330
i386                          randconfig-c001
arm                  randconfig-c002-20220330
powerpc                      obs600_defconfig
hexagon                          alldefconfig
arm                         s5pv210_defconfig
arm                     am200epdkit_defconfig
mips                        workpad_defconfig
powerpc                     powernv_defconfig
arm                         lpc32xx_defconfig
mips                         tb0287_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220330
hexagon              randconfig-r041-20220330

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
