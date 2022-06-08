Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA0C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 03:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jSwBDVpc5JtyXEshH5uS4HUbWBuvxpXzNEN26GTg+bI=; b=BHwkueidc65X/o
	eM+naa1cM5PzT10rD6pV61oKGjccduQf+tpix1FXkojK052gA5EBncmM5YLb7PlV6c/3fPt7M41+L
	eztIlN13xGTkwkqbTJUjJAuHtxxNutmxUZNJVl0I8jO4ayUiQfM92txzPpNiHzadpiItJvhAl3Y3C
	jo/dWlTaKLMdnHWBpmB+SDDeMElDHQJr6tOBRO9dGHAhjAK5ba1cC9nqhGrwPhLY6lUN6EUtQvwLy
	PUTmcFEqPzBsFf3oTJLdZlFxfMQk1IiZ/A1PTtOTrQrSWSVmu8LV8AnG0rqQ3nIKlYgeTcPI+mUBv
	iGfUEMJwBXY5VJFnWN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nymIJ-00AsXQ-ES; Wed, 08 Jun 2022 03:23:43 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nymIF-00AsWq-MT
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 03:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654658619; x=1686194619;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dBwm0BQOjGcloV9Q356cuHxzwR5ux644C2JsxzeetGQ=;
  b=fSMnxcyYb9er040NovCKT1TPpwrV7N8z1rItpMl8y2qLkztN4qNkr1gM
   hOHS+iBKOYtwBrItKc+m02D8Qe5dwCZTLH4evwttJLQc8FM4RVXQFUxKY
   dLF6sB/NjOAllhxYuQsBFZGl0GgKSLbbBkygxGeIaqjHfFZkRv0557doe
   /EInrqJy073eWPSFD6oEo7mq0q4xyrn+yEQbUrGavSsAHbtl8Z9k7tGwV
   0i6KlPoayx9PvwuXkQVuWe0hZ4Ua9/rcdtpClQO9Y2IahMp/jurk4q+CT
   MbQQj6/QwUUQCJGzpp7q5r8O27xuE3AgEWPychP8E1wofeBOIzdhUNHUO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="265519914"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="265519914"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 20:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; 
   d="scan'208";a="579873132"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Jun 2022 20:23:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nymHr-000EDY-L9;
	Wed, 08 Jun 2022 03:23:15 +0000
Date: Wed, 08 Jun 2022 11:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 c588bfcfe7a631c4788110c0899ec33cb82e4fd1
Message-ID: <62a01608.NcpGRNiCUgycOL2e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_202339_831332_730BD2B8 
X-CRM114-Status: UNSURE (   6.68  )
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
branch HEAD: c588bfcfe7a631c4788110c0899ec33cb82e4fd1  ath11k: update debugfs support for mupltiple radios in PCI bus

elapsed time: 2189m

configs tested: 86
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
m68k                         amcore_defconfig
arm                          pxa3xx_defconfig
sh                   rts7751r2dplus_defconfig
sh                         ap325rxa_defconfig
arc                     haps_hs_smp_defconfig
xtensa                generic_kc705_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220605
riscv                             allnoconfig
s390                                defconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                             allmodconfig
riscv                          rv32_defconfig
parisc                              defconfig
parisc64                            defconfig
riscv                    nommu_k210_defconfig
parisc                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
s390                             allyesconfig
sparc                               defconfig
powerpc                          allyesconfig
i386                             allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sparc                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
um                             i386_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
h8300                            allyesconfig
m68k                             allyesconfig
xtensa                           allyesconfig
m68k                             allmodconfig
csky                                defconfig
arc                                 defconfig
mips                             allyesconfig
nios2                            allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
mips                             allmodconfig
sh                               allmodconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a010
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a008
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a007
i386                          randconfig-a005
i386                          randconfig-a009
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220606
riscv                randconfig-c006-20220606
s390                 randconfig-c005-20220606
i386                 randconfig-c001-20220606
mips                 randconfig-c004-20220606
x86_64               randconfig-c007-20220606
arm                  randconfig-c002-20220606

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
