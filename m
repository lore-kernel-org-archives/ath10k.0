Return-Path: <SRS0=NYaa=LG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1920EC48BE5
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 23:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9916E60FDB
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 23:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9916E60FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rfdUfR0HpWYzdAYXGHDpjPtycuGPjQXKEoSVyrC8oKo=; b=tqgg1yqLCXJt4O
	aftbddU10YgQY3NnXhA1f7mEG+keXbcpcAOFf+kqkXsxAKMTlCgivBe8TNW9wnrtuRayWY8LP/L9R
	pdN7zWvgufNJLeGv9UlwurRANoLb5ddJiskDYGSXaeP+BbXUsSjMPUAo5Mwy3TqI0QIKRgjY4v0j6
	Y+0pUjRnfk4VbFpJB8EtEpIk9Xb8uGqq0qU9lNenVzOwWNqC5imuXzVLd8iIRq/qxtLP1UHNfYhLO
	HEGGF1qglEFD+xOsKm1iyyHmiudeTPMrdm4qrgfHEd8QaAs4oheuw/zTiQrt8TFzQj3swkLRcxIk1
	yZCScmLs51uOcZkmeodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsCzQ-009IPj-34; Sat, 12 Jun 2021 23:24:32 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsCzM-009IOQ-LO
 for ath10k@lists.infradead.org; Sat, 12 Jun 2021 23:24:30 +0000
IronPort-SDR: dSE5bBZjg0vzEJ/BQnPynpM7NY/jDUvYM3ydFzOM0Ia/x7Jhvagae/S3IhHlphYa7HlwVMVGzH
 P6DWW+CEXsMw==
X-IronPort-AV: E=McAfee;i="6200,9189,10013"; a="203854770"
X-IronPort-AV: E=Sophos;i="5.83,270,1616482800"; d="scan'208";a="203854770"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2021 16:24:27 -0700
IronPort-SDR: 2ri2t28K2/vzFMJtcPIZbCXcv4ygwwLEwRUX7u3B82kadhDtkVjYXVkDuEwGIuVUHsYFbPzTJT
 TAWvkxIvkdGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,270,1616482800"; d="scan'208";a="449488353"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 12 Jun 2021 16:24:26 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lsCzK-00016z-Qn; Sat, 12 Jun 2021 23:24:26 +0000
Date: Sun, 13 Jun 2021 07:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master] BUILD SUCCESS 74db3d51a6c4c4f85190468af89c069a96dd27e2
Message-ID: <60c54205.J2gpoWQ/rgfOnNGW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_162428_747619_8F62D732 
X-CRM114-Status: UNSURE (   4.24  )
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
branch HEAD: 74db3d51a6c4c4f85190468af89c069a96dd27e2  Add localversion-wireless-testing-ath

elapsed time: 722m

configs tested: 97
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7264_defconfig
mips                         bigsur_defconfig
sh                              ul2_defconfig
arm                          pxa910_defconfig
sh                          lboxre2_defconfig
powerpc                     sequoia_defconfig
powerpc                      acadia_defconfig
arm                      jornada720_defconfig
xtensa                generic_kc705_defconfig
arm                        shmobile_defconfig
arm                       imx_v6_v7_defconfig
ia64                          tiger_defconfig
mips                         tb0226_defconfig
arm                           sunxi_defconfig
arm                  colibri_pxa300_defconfig
m68k                       m5249evb_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
arm                            mps2_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210612
i386                 randconfig-a006-20210612
i386                 randconfig-a001-20210612
i386                 randconfig-a004-20210612
i386                 randconfig-a005-20210612
i386                 randconfig-a003-20210612
x86_64               randconfig-a015-20210612
x86_64               randconfig-a011-20210612
x86_64               randconfig-a014-20210612
x86_64               randconfig-a012-20210612
x86_64               randconfig-a013-20210612
x86_64               randconfig-a016-20210612
i386                 randconfig-a015-20210612
i386                 randconfig-a013-20210612
i386                 randconfig-a016-20210612
i386                 randconfig-a014-20210612
i386                 randconfig-a012-20210612
i386                 randconfig-a011-20210612
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210612
x86_64               randconfig-a004-20210612
x86_64               randconfig-a001-20210612
x86_64               randconfig-a003-20210612
x86_64               randconfig-a006-20210612
x86_64               randconfig-a005-20210612

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
