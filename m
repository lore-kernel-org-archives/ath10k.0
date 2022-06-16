Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224C7C43334
	for <ath10k@archiver.kernel.org>; Thu, 16 Jun 2022 01:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y2YocCfN5VJ9RMr/V9xKty4mnxRxCjZu4UjvINXJNRA=; b=doI18BTb2dYBw7
	ROfFIwyYmazky25pkMp8fwyXVzE48VgwTNvUX0hFQnSPP2H2RzhQQ71PMw2F2DVhFuXCTETcKPs/1
	cu/kXZvD5xsmLh3kOJCore8dO/doglFb7+bJwbc/98LW0lWSeWlW63XuMzrNGp46OLbuzZRyqw2uC
	942OOb9xPb3XCUbwQEeoN/QqXIux+mmKG0LrSlj2stgoJVQfoMKqI2GHaAnGlZTzIDUSOMjh48Gxw
	HEp/6spHo3kpAJTvD29NnzDSDbWAFBYc7u8GWJ4NL4EElMttcKzIIYsK6fJPO3ATxsXT4ZpXzLf9V
	n2KQeXNzThH5YWu1fMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eOJ-00HPVS-Gg; Thu, 16 Jun 2022 01:33:47 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1eOG-00HPU4-FG
	for ath10k@lists.infradead.org; Thu, 16 Jun 2022 01:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655343224; x=1686879224;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tE6dDG+cfZqsh/hIUoh1UYIyypnvSAEu1e98quqgSmI=;
  b=ddLbF+3Fyj8KIyecFdAxp4sUYFi43rVrD/ktIIQX3KYyqvp3X8mY2yGJ
   WN+mdFCKLg14cXvTiyptz8pzr0VSIN6yxphqbyxF/6QjFN6WV4ntos+jI
   eVDV0BK/PZnP0YiviGg8addkru3OA+7rBR5J/2QWXj4fPoCsHZZ+Txffe
   TJZ0n45JU+I7gH3hstAFsjC+pEOAv4EFdneroUiaKg8SWZwGt+6EPy1MT
   5pK3t6x1kqryUFbJi4aDt2yBmMHc4t2qwZmLbYLww4eYGgZLM3XthefZP
   s88NfkYZ2Ldh0lTQW1rBHk2JWoMs9/2eoVdPqhmHniEOUA+P63ixb+OgK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="365493685"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="365493685"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 18:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="831344437"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2022 18:33:36 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1eO8-000NoT-17;
	Thu, 16 Jun 2022 01:33:36 +0000
Date: Thu, 16 Jun 2022 09:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 544de3e488ef5ce191b86d0778d592143c48d063
Message-ID: <62aa8852.W2A63B/CTPvg8LOP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_183344_597044_B215A9EF 
X-CRM114-Status: UNSURE (   4.14  )
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
branch HEAD: 544de3e488ef5ce191b86d0778d592143c48d063  wcn36xx: Fix typo in comment

elapsed time: 723m

configs tested: 53
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
