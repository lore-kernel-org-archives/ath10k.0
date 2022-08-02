Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53C4C00140
	for <ath10k@archiver.kernel.org>; Tue,  2 Aug 2022 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6WDU233Kgzs8lCrlDHv3VfR3zJWqXawRZ5L+IpYiHEk=; b=tOdwZp6oyly3j7
	N1ibawRvRiOpgssXxIOUexRjFxABY4yoKh9vKEm0kz5va3WW5pNVhS+ImIrxFxychyBlkd8HPUYXK
	6Wnrm3W3jZejv85hKyKyq97jPL8nKABK9tgyzMfUN86HELsB3s0fuRdLMEcOD4O5AMLAs74D/ght+
	DYNxmguX+qMJ49jfHTYD0dI/a9B9fhI6HvgOIYvzeACntTImkazfsmqXzgMvNqiUXCUXqiNg5BZM0
	kAnQlOEehxqcy3CQh24oTipCJf00U3KVuftIpqrQfwJ9lTECJq23nAM0x2IaOhVSbcfnlTW/vQ3lr
	YG7zzXG6Ft+cIKSbWpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIxNz-00Goyh-8I; Tue, 02 Aug 2022 19:16:59 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIxNm-00Goux-8P
	for ath10k@lists.infradead.org; Tue, 02 Aug 2022 19:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659467806; x=1691003806;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nvY9/J5Sq42dww+Z12Z5LZPaKhxU+o5v7NPWA1Rr/uc=;
  b=Zmg1HDBvXJr323a6Qzk7yA9I+pC5tsbtGYR2FZI/A5UsRuZtwMFsjTr5
   73r8n1z5VkGYdKbs609cGCMxd0O3iQQSwXXBTl16XPx+5c8Kk2rZRfRj7
   5oZoudCVoerw6FxjZMcgRNfXd0aPBMngZ8yT34xrq1nNEy4k8AH45ElXP
   YiXfkAHIsd8e7QITxdEEGQrxI1Q+9OR0Rz4fQYwmaPb3vTMnDie1I+4Cf
   jL5gHN8W99skNI+m8IHFdmAzJccun2NrvVB/TsRFd9s6wzPDsN4pRtJX8
   Q2ee2QJ/o0m62j1HC6C9g8RmqL/AZDpB9A68soEsNUo3gCBsL6HDv8T8S
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="288256452"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="288256452"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 12:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="930093906"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2022 12:16:30 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIxNV-000GKr-1q;
	Tue, 02 Aug 2022 19:16:29 +0000
Date: Wed, 03 Aug 2022 03:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 7fd96bf23e89815ec8b134fd1127b557973d2987
Message-ID: <62e977d7.me/+9X1yy4Fg6VDQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_121655_373052_4FD85F66 
X-CRM114-Status: UNSURE (   4.93  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 7fd96bf23e89815ec8b134fd1127b557973d2987  wifi: ath11k: Add support to get power save duration for each client

elapsed time: 705m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arm                                 defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220801
i386                 randconfig-a012-20220801
x86_64                               rhel-8.3
i386                             allyesconfig
i386                 randconfig-a013-20220801
x86_64               randconfig-a014-20220801
m68k                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220801
arm                              allyesconfig
x86_64               randconfig-a011-20220801
i386                 randconfig-a014-20220801
sh                               allmodconfig
mips                             allyesconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a012-20220801
arm64                            allyesconfig
s390                 randconfig-r044-20220801
x86_64               randconfig-a013-20220801
riscv                randconfig-r042-20220801
m68k                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a016-20220801
x86_64                          rhel-8.3-func
i386                 randconfig-a011-20220801
x86_64                         rhel-8.3-kunit
i386                 randconfig-a016-20220801
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                 randconfig-a015-20220801
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                   motionpro_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
mips                           xway_defconfig
xtensa                           alldefconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
sh                      rts7751r2d1_defconfig
x86_64               randconfig-k001-20220801
i386                 randconfig-c001-20220801
powerpc                        warp_defconfig
powerpc                       ppc64_defconfig
ia64                             alldefconfig
arm                           tegra_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                        mini2440_defconfig
powerpc                    adder875_defconfig
powerpc                     mpc83xx_defconfig
arm                           imxrt_defconfig
arc                          axs101_defconfig
sparc                            alldefconfig
ia64                                defconfig
loongarch                           defconfig
loongarch                         allnoconfig
powerpc                     taishan_defconfig
sh                        dreamcast_defconfig
arm                         cm_x300_defconfig
mips                    maltaup_xpa_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r045-20220801
x86_64               randconfig-a002-20220801
i386                 randconfig-a001-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a003-20220801
hexagon              randconfig-r041-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a005-20220801
i386                 randconfig-a002-20220801
x86_64               randconfig-a006-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
i386                 randconfig-a003-20220801
hexagon              randconfig-r045-20220802
s390                 randconfig-r044-20220802
hexagon              randconfig-r041-20220802
riscv                randconfig-r042-20220802
powerpc                      katmai_defconfig
arm                              alldefconfig
powerpc                     akebono_defconfig
arm                   milbeaut_m10v_defconfig
arm                      tct_hammer_defconfig
arm                         shannon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
