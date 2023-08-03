Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129C3C001DF
	for <ath10k@archiver.kernel.org>; Thu,  3 Aug 2023 08:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fx62JPvb8XtQOur1fBB3jsPW1xUzIQ8fE8x2MY33T2o=; b=Q190VYlD/4Cj+M
	gRClIi8i7yt2IPeoUQuleCjMx3Edr+hz6uF3cbC3iCqY/C9Cz5FUiORTTlMTe6Ox2zySG22EFGX8u
	ZpML1ZgLyLv/gkR0B4ETHZtr3n3Hfc3uTEhir6//xDUbHQGW1zc/UdKK5M7ibfBYkXnWtqPw0P73f
	vTEQlPNNCpTFuh+AsJNjih1iCw7itNrumpU1TPNEt0J1/XFBurDvetpB6LxIQQ2QvcHGW4UCLNQo8
	DQrXQmHqUBotQaacpfxeMORePsxllRSGRhW5V42aBus05+Kn2cQimGQh/hrWkZUyIaqStVrM8jPYd
	GihvrV4SHqMrd8XL4K1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTNP-006yWr-2e;
	Thu, 03 Aug 2023 08:08:07 +0000
Received: from [192.55.52.93] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTNN-006yWP-13
	for ath10k@lists.infradead.org;
	Thu, 03 Aug 2023 08:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691050085; x=1722586085;
  h=date:from:to:cc:subject:message-id;
  bh=8bFVhwWEHGZlPlr0LBKhdLwmF01PT2gJH5lKE4vRVtI=;
  b=EXlLee5PlWhOebGlZWs3pgMkK6wLtQWwcTls242Ux46WVmy13Z7B+Y37
   /VPulsoNVPD7A6M/Ca10beMs89EdynK5KQwI+16HEBQoMb611mppOBuZ3
   bWpfJSFVG53AlsqbL414nbCpjpjjU44DYy9JFN/PnfOiTu2H4VIl6PlJY
   SLF3DsZGYxqGgiD0NiBUf70m+0Hq6D1lOEw5EayGNxkOY48VJoYx235mZ
   dTWTOpWb406t8K1bYGgmF9szYZQ1u6iY7VVR2Ti5H1VxFxNwlf6EJ5Uvy
   OgwBT44yLh8Fy0WPPjpaWk3/ienkIOxoLTiBC1qMif1iMcAEbj+iCD31g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367259623"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="367259623"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="975973946"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="975973946"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 01:08:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRTNI-0001t9-2R;
	Thu, 03 Aug 2023 08:08:00 +0000
Date: Thu, 03 Aug 2023 16:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 a0256a9416806892d5a7dc9345c51c12b0c63f55
Message-ID: <202308031647.bbTeSXC8-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_010805_378428_80473AE4 
X-CRM114-Status: UNSURE (   4.90  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: a0256a9416806892d5a7dc9345c51c12b0c63f55  Merge branch 'ath-next' into ath-qca

elapsed time: 880m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230731   gcc  
alpha                randconfig-r023-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230731   gcc  
arc                  randconfig-r026-20230731   gcc  
arc                  randconfig-r043-20230802   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                          pxa168_defconfig   clang
arm                  randconfig-r024-20230731   gcc  
arm                  randconfig-r033-20230731   clang
arm                  randconfig-r046-20230802   clang
arm                        realview_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230731   clang
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230802   clang
hexagon              randconfig-r045-20230802   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230802   clang
i386                 randconfig-i002-20230802   clang
i386                 randconfig-i003-20230802   clang
i386                 randconfig-i004-20230802   clang
i386                 randconfig-i005-20230802   clang
i386                 randconfig-i006-20230802   clang
i386                 randconfig-i011-20230802   gcc  
i386                 randconfig-i012-20230802   gcc  
i386                 randconfig-i013-20230802   gcc  
i386                 randconfig-i014-20230802   gcc  
i386                 randconfig-i015-20230802   gcc  
i386                 randconfig-i016-20230802   gcc  
i386                 randconfig-r004-20230731   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230731   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230731   gcc  
microblaze           randconfig-r025-20230731   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                 randconfig-r022-20230731   gcc  
mips                 randconfig-r036-20230731   clang
mips                           xway_defconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r005-20230731   gcc  
openrisc             randconfig-r014-20230731   gcc  
openrisc             randconfig-r032-20230731   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc              randconfig-r035-20230731   gcc  
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230731   clang
riscv                randconfig-r042-20230802   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r031-20230731   gcc  
s390                 randconfig-r044-20230802   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r001-20230731   gcc  
sparc64              randconfig-r015-20230731   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r034-20230731   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
