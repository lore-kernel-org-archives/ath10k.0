Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA40C433EF
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 00:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vUbz2hi1/ryJ5CZrLctT0Kgrj6RV2ltSshi3zVmBgY0=; b=L2vC3Ck48ynwBP
	7FH3cT6D5StBTv4gmuq05DMq3s/ky8EJsGdC8l5meyf/J1PV5+sC0r9qWRqc/FeU/SGDMqQ31sYPK
	tRAYlpwYAnZel7RvJ/oAd2sTahQi39C9YHPpak6l85oU8kAp4UycEPjuwlem+isyYaA+KZh1zMUkg
	O5pSy30gO3OUNgZVLaRzOmbcgSuOAVUoKXH/eZTMx0nzUe1joBN/3DmyPudk6Vmoz52qi8/jyd3km
	j4yog6dIIlOLu9WBvaONsbc9weJDFPJM1BOcd0quh9TDW44qVzOhXweFgX/BCo8za7c4Tjq5PromY
	4eu/TYv+45EZzupXOCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naS4r-007ffj-6N; Sat, 02 Apr 2022 00:57:17 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naS4n-007fem-F7
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 00:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648861033; x=1680397033;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=YD9D81FwgCjCCiy7PQqqFQon0x7Ik/DAy5kRLy1sSLk=;
 b=LuCB3O84U7HgUooItiTc8R//C4kdnZ0c7tj9n3AkIBEKWNa4aFV6M7D8
 W4Fbc1xuTRiukvpmjwzT/eNAOwCtf6SzrPVnCzOf/91zOl7DNpVoJLjl5
 8clYvXf87PnJCRVGrDmT3NcO6JHXDjOE3N28IJ5gWwQ/OOWw6s89KH2nn
 gUGY6suuhsA1bWe8xeux8hYMhXQwwI3YLpOkhHNbKJx9HW+Y4k2FNyrcp
 3tv7/aRwdIhB40DP41rVSqsfq43x/zOj9OtLfSCTqV3qRipTTY9DB//x5
 sDt+Hxe6jvCAUAKKhyIeooL5U7HwwT4sI7bVEPxwOKoiw9F24sKzHVkSr A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="257841304"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="257841304"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 17:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="504354781"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 01 Apr 2022 17:57:08 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naS4h-0001dt-Oa;
 Sat, 02 Apr 2022 00:57:07 +0000
Date: Sat, 02 Apr 2022 08:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD REGRESSION
 9e086cb9d76218bb96b508fe3e5cd4ebb3c71ed4
Message-ID: <62479f35.gB1kbONtg9Y2lPO4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_175713_572900_C55C8C99 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 9e086cb9d76218bb96b508fe3e5cd4ebb3c71ed4  Merge branch 'ath-next' into ath-qca

Unverified Error/Warning (likely false positive, please contact us if interested):

util.c:(.text+0x4bac): undefined reference to `ieee80211_sta_restart'
util.c:(.text+0x70ec): undefined reference to `ieee80211_sta_restart'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- csky-buildonly-randconfig-r002-20220331
|   `-- util.c:(.text):undefined-reference-to-ieee80211_sta_restart
`-- openrisc-randconfig-r034-20220331
    `-- util.c:(.text):undefined-reference-to-ieee80211_sta_restart

elapsed time: 742m

configs tested: 106
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
sh                           sh2007_defconfig
sparc                            alldefconfig
mips                            ar7_defconfig
sh                          landisk_defconfig
arm                            mps2_defconfig
mips                         mpc30x_defconfig
openrisc                  or1klitex_defconfig
arm64                            alldefconfig
sh                          sdk7786_defconfig
sh                   rts7751r2dplus_defconfig
arm                  randconfig-c002-20220331
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
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
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220331
x86_64                        randconfig-c007
s390                 randconfig-c005-20220331
arm                  randconfig-c002-20220331
riscv                randconfig-c006-20220331
mips                 randconfig-c004-20220331
i386                          randconfig-c001
mips                        omega2p_defconfig
powerpc                   lite5200b_defconfig
arm                  colibri_pxa300_defconfig
arm                          pxa168_defconfig
powerpc                   microwatt_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220331
hexagon              randconfig-r041-20220331
riscv                randconfig-r042-20220331
s390                 randconfig-r044-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
