Return-Path: <SRS0=uCW8=PA=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20988C433EF
	for <ath10k@archiver.kernel.org>; Tue, 12 Oct 2021 03:56:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D464660F38
	for <ath10k@archiver.kernel.org>; Tue, 12 Oct 2021 03:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D464660F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DkO/gaYFk7qQEviS/77jLQPBjCfIBDJnDoIYse74QhI=; b=DDqwUAVZBnz7cZ
	RwsY107EFOJp1HRp+1h/Toaooph8Tj1sS5gF/UfXBsLkR7lLLlFrieL4G/vhfEOousPL7eYA4rgd5
	FtX0WXnIuZ9oQo2sfR/xeaj8LIJHkxW2YjfZqXQ2GpCuvXgAUqHxhlJx59yRXKl8To2sYCAXIgV+/
	iHlggCf/oiNGTS/daOajQZU/DDb3U4qfT/CZhISqWR2OSm0AaPVEw7AcGIBcK93JBm5mIZCEj3Ise
	0oQbtFnd5Ru6DLfykS5ouWOy18FqEmkUaB/kcOs78G3Snezvm6rVtSWX5ty9bV/3pwSk/HTilwQZH
	KXC3wZvXVqM2Vfh+qOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma8sm-00BNeb-JG; Tue, 12 Oct 2021 03:55:16 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma8sk-00BNeC-5F
 for ath10k@lists.infradead.org; Tue, 12 Oct 2021 03:55:15 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="224452204"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="224452204"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 20:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="441048171"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 11 Oct 2021 20:55:11 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ma8sg-00033k-Fe; Tue, 12 Oct 2021 03:55:10 +0000
Date: Tue, 12 Oct 2021 11:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 8823d5e6172c519d5301ff6a07cec6690ff4265a
Message-ID: <61650707.RYn1s0oN24YvdyiH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_205514_255424_17CDDA6E 
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
branch HEAD: 8823d5e6172c519d5301ff6a07cec6690ff4265a  Merge branch 'ath-next' into ath-qca

elapsed time: 725m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20211011
powerpc                      obs600_defconfig
powerpc                    gamecube_defconfig
mips                       bmips_be_defconfig
sh                           se7619_defconfig
arm                            mps2_defconfig
mips                        maltaup_defconfig
parisc                generic-32bit_defconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
mips                           ip22_defconfig
powerpc                      tqm8xx_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
um                                  defconfig
m68k                        m5407c3_defconfig
arm                         assabet_defconfig
xtensa                           alldefconfig
arm                        neponset_defconfig
sh                         ecovec24_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
arc                  randconfig-r043-20211011
s390                 randconfig-r044-20211011
riscv                randconfig-r042-20211011
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211011
mips                 randconfig-c004-20211011
i386                 randconfig-c001-20211011
s390                 randconfig-c005-20211011
x86_64               randconfig-c007-20211011
powerpc              randconfig-c003-20211011
riscv                randconfig-c006-20211011
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
