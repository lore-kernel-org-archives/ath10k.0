Return-Path: <SRS0=bnw0=P7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACB8C433EF
	for <ath10k@archiver.kernel.org>; Fri, 12 Nov 2021 01:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E3C611AD
	for <ath10k@archiver.kernel.org>; Fri, 12 Nov 2021 01:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60E3C611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0R0mtcNg1loOntXiMXlO3i2ezWIC5c8J2Glsh030GFo=; b=Cwp0JpZSUNBkI5
	XoLnCjwxzYONTSeBV3tHV+gxm4tvDL4JBp2R4BM8KPwYimtXp1peAjGmKrs620XHODvFpUAe+Rhfc
	XVQ0IAENCsY4M+85S469rtKEjh1bcl4C1TicZQeOvPgWiuHFbAWunTuk5j0Z9Xxk9PyRGyk6ErPmK
	RcpCKyDahoe73bwfQHpuIYzfJvSR+jkn0/5WxEsr4Wea7cHKMkkwmaWcIJmagRpVKhl88vK6rTGVN
	60Efkg0pLgqSdJ3YiY7fOnawriuLdACNvtOvpse4b2sC/X5fpDee8Jr4mJ/n6Zmb6abMEuD4LIiEw
	mpjhWIMytH5sLLuutvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlL7w-0099Kb-0z; Fri, 12 Nov 2021 01:13:12 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlL7r-0099Jr-0m
 for ath10k@lists.infradead.org; Fri, 12 Nov 2021 01:13:08 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="232894324"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="232894324"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 17:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="583664784"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2021 17:13:04 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mlL7n-000HNX-IV; Fri, 12 Nov 2021 01:13:03 +0000
Date: Fri, 12 Nov 2021 09:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 81d0eff44fcfd842e1f8b96605c68347f7c9ea95
Message-ID: <618dbf65.tHKvIg6NEP22ZBqp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_171307_146567_50A839CE 
X-CRM114-Status: UNSURE (   6.32  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 81d0eff44fcfd842e1f8b96605c68347f7c9ea95  ath11k: fix fw crash due to peer get authorized before key install

elapsed time: 2018m

configs tested: 53
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
nds32                             allnoconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
