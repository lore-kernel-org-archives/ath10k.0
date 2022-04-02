Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ABBC433FE
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PHAeeGSlHfG5omVAbpTM1FNsnD6JZmoxOa4M+ke7Owc=; b=QZVcpzGipjaN8e
	avb/ZxqjCZZVLpapUY0JCJ0tAe+VXIRw2C3EIWdVKBM0oKvD0SQ7FwOStZQKgIovP4pn5xPVjETNj
	kejI8kR9OQP8RYjoozKiWuFKIqRmcPheDEWLYiDBQanJRn/JG+UUIN/2d6CNvWbFL18tvHqPOLaYm
	hLXgQtEqz3T6fpadiLewau1bxwDnrn1JFBpwJw1laQ3O50wpm5yKKEOeH1JGFofnyxmvZuVEHMZRS
	LqyC/pGwfND67h4acK6Q11XeZGhJkKqiRtMvRTVi+L1joEDlcq8f4OsigA9ikOj9kdxU95lumkPM/
	9G3wwzGcI9t2gh4OjW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naS4s-007ffs-OB; Sat, 02 Apr 2022 00:57:18 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naS4n-007fel-FD
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 00:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648861033; x=1680397033;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Kc4EzKxHjmpYBH3EXrheLarjbi+dN2F1Y0dD6HELcb0=;
 b=Ksn2NqD6gRWrhc3kNU37/mu2d15OmGe5Z34t/mfFOV0Q3teQvUTG4ISS
 rrHhMYP5SaVYKTPtcxG+7Yc1IuwgHfSiudxa8TVZr4etf4Hu+g6q6jMCo
 oCVn2+TviSAJWFPyMpB5JFLvzFPug8LMENCr1GSBmBZsTD2rVOFsPCaJy
 hMoXO+kuq2aMLCHjKu2gb4isHZBx69u3qXc8WFclnaEsHKll18lzOJh57
 cvLvTaUupZfAKVcrep5wBkLRjLFHLuUWVuY3Q8j0LP1Iu7PeICFwhCPC1
 QYEuTFo2AcD5eo9i+fJjknOHlLMwckR0RsRXw2KeWTBU6/Mt1sh/IUSJi A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="346699658"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="346699658"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 17:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="721067495"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 01 Apr 2022 17:57:08 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naS4h-0001dq-OB;
 Sat, 02 Apr 2022 00:57:07 +0000
Date: Sat, 02 Apr 2022 08:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 9149a94adad204a1301b55bd49ea1c12c179d144
Message-ID: <62479f2d.FTwo3aIml5ns4yoc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_175713_582663_3CAEDA19 
X-CRM114-Status: UNSURE (   4.17  )
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
branch HEAD: 9149a94adad204a1301b55bd49ea1c12c179d144  wcn36xx: Improve readability of wcn36xx_caps_name

elapsed time: 743m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                     pq2fads_defconfig
m68k                            mac_defconfig
openrisc                    or1ksim_defconfig
arc                      axs103_smp_defconfig
mips                    maltaup_xpa_defconfig
powerpc                  iss476-smp_defconfig
mips                         mpc30x_defconfig
openrisc                  or1klitex_defconfig
powerpc                     mpc83xx_defconfig
alpha                               defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20220331
x86_64                        randconfig-c001
ia64                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220331
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                      ppc64e_defconfig
powerpc                      obs600_defconfig
powerpc                   microwatt_defconfig
powerpc                   lite5200b_defconfig
arm                          pxa168_defconfig
arm                  colibri_pxa300_defconfig
arm                             mxs_defconfig
mips                      malta_kvm_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220331
riscv                randconfig-r042-20220331
s390                 randconfig-r044-20220331
hexagon              randconfig-r041-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
