Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5CFC54EE9
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 19:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ge/JIPlT0c2cPyzyPMj3ZclP/uF39m3foNp/iaI/H+E=; b=H4WoegThCYkJsw
	Bq8Fl/a3KzR7DSHr4TdSBPkmycWg4/oDhudNxN2fEjvOcVZhTi7whGVBPwdUOzq6vr/RbLad2NL9a
	0XfjI00nqVOkZ3LIEKixFfUIBujLEcTqbYZf2XGiRNNk0qTMN2L3FqlPmJUSa3hrxPpN27clm+MaY
	Lpxkt412jCV2oZwYh2mF8bsW8cHbUB+LoEtl4DnH2m7MIInI+cOkN6GwdYP7NVmlikat0O9hZM2Am
	YZYrnqKATQKLuTj4hmjT4oLkOeMoDaVTiitCllkvNnDAb4r+BUgxCaZsJyHr3BtpahRYBebB856F9
	IdQmnHJEwvaBXXO29KgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obS5t-00HagK-FZ; Thu, 22 Sep 2022 19:42:45 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obS5o-00HafA-Tm
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 19:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663875760; x=1695411760;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T5M4hXqgKzimKf+4NMwuCe8zqIZFwPd4YVku4tvd48w=;
  b=Uv8LPIWGx3brJgWdlS+wiOs4AS7QEB1hFGncw6Z7uM+fmk+4ShpTWWDI
   s8RVm2XOg1aATJok7cUhKAiiIQfbvKfnnY/HRiLBtCjcyxI6j9UWFmWdc
   2XwSFobUYBRbE2owVeUWJ5YNN297vlqXrBCDvMhUwSRQkes8SXBqqDDaH
   E0WycayVvwe0LmN+anWMwGVzqXnXqs11H7ZShmYmbQ3mklV5U1Hb/fIub
   aIOtKxFQS18RRUZ2JJKLURjyhI6dd3Km/FHTHqmnbhb1FuqrTneU6YfDG
   vDW7Ju8Cg7zKUj6EHsiuBs475ACUfE4EC/287XBhCaWMFK7kHnP81qSlP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283500512"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="283500512"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 12:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="948745700"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2022 12:42:37 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obS5l-0004uB-14;
	Thu, 22 Sep 2022 19:42:37 +0000
Date: Fri, 23 Sep 2022 03:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 176239a9a2e3c519923d7bd8bb205838d48c7a3c
Message-ID: <632cba8b.lIYxmX7fre8/WziE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_124241_025595_C3A196DF 
X-CRM114-Status: UNSURE (   5.98  )
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
branch HEAD: 176239a9a2e3c519923d7bd8bb205838d48c7a3c  wifi: ath11k: retrieve MAC address from system firmware if provided

elapsed time: 720m

configs tested: 84
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
s390                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
m68k                             allmodconfig
arm                                 defconfig
x86_64                        randconfig-a002
sh                               allmodconfig
x86_64                              defconfig
arc                              allyesconfig
mips                             allyesconfig
arc                  randconfig-r043-20220922
x86_64                               rhel-8.3
i386                          randconfig-a001
x86_64                        randconfig-a006
alpha                            allyesconfig
i386                          randconfig-a003
i386                          randconfig-a014
x86_64                          rhel-8.3-func
x86_64                        randconfig-a013
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
i386                          randconfig-a012
x86_64                        randconfig-a011
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sparc                               defconfig
loongarch                        alldefconfig
m68k                        stmark2_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
sparc                       sparc32_defconfig
sh                           se7721_defconfig
m68k                          atari_defconfig
mips                             allmodconfig
xtensa                       common_defconfig
i386                          randconfig-c001
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220922
x86_64                        randconfig-a005
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
x86_64                        randconfig-a001
i386                          randconfig-a013
s390                 randconfig-r044-20220922
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
i386                          randconfig-a006
powerpc                      ppc64e_defconfig
arm                          ep93xx_defconfig
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
