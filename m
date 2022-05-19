Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F06C433F5
	for <ath10k@archiver.kernel.org>; Thu, 19 May 2022 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d9/ST4afkAlrxO/MIqHoGW14Ecowdv+5gl2MRnSQn4g=; b=TbIw/vvTJm/WVf
	2nD5bVzHRozGIRdDM/1N4dkjw/dH6q6uTyE30Oe30JZ7aZQp2tT6wuY3gVCkPSJM2eTN9Lc1ogEkE
	M8yfiqaImA90C9tdL3o7m+wSZK2xD4ljK8DHSLFCIrrEixXBP2M+yRYDpF4VjAHknQwy8PGL6X7/I
	qjgCMiVlLqeEBxPRYbTvPdhqRi3r32AMgpE8qD5FPCC3jjA4NJLyMD0rw2CHgJSeyu5xfMR7rZbcS
	hF8cmVcCH33A5bJ122pgHP40HdpzfFSFux0RqMbmi32tZ5T2rSO2KnVb1fkwjvHvZqqCGfFmVXxVg
	JKhrCeJvuim/a8HuE5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrnK7-009KlX-UW; Thu, 19 May 2022 21:04:43 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrnK4-009Kkf-LZ
 for ath10k@lists.infradead.org; Thu, 19 May 2022 21:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652994280; x=1684530280;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vmFedhwleAxEM/dK5sTrU4fbLM1HeahNxbRaYcWSD9E=;
 b=blO0GKCRrnVw3f+wJsCvrizhTdt8wEWRiRFgEhibW9vGFTM5YEPGG8LI
 hPEfWk/ETDTD8XBd/D6eeM0K2Ek86yeF+gbYljQZTFbtbZHFyy89BAPTd
 uLHXu+eU14YcBWnrrfhjOsnTK075DTa4blFzqoClK7ThQZJN4TkwU0CGX
 sGdZoDKvkwBPazwh4l3zmHcDYkYX+ixYchZARL9LPSidVBir5rW81U05j
 Kz/g8eAy+cp/gN8O+z+tP85WzX0+CSfQRXVPb9P9j8hDoc+zA8Ag7isIu
 IrP/ejBEiNVgusM7jZuZP5+6oOknkMigsU6MmSOPohliHZEeKMyOmTRpq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="297687350"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="297687350"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 14:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="546314380"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 19 May 2022 14:04:36 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrnJz-0003wb-Av;
 Thu, 19 May 2022 21:04:35 +0000
Date: Fri, 20 May 2022 05:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 f3c6a545568b4256914b86322df1b9ce9c2c7d18
Message-ID: <6286b0b8.BcelYT822ORGkGxH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_140440_812224_3930F9C6 
X-CRM114-Status: UNSURE (   6.60  )
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
branch HEAD: f3c6a545568b4256914b86322df1b9ce9c2c7d18  ath10k: reset pointer after memory free to avoid potential use-after-free

elapsed time: 2245m

configs tested: 58
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
sh                             shx3_defconfig
ia64                             alldefconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc                   microwatt_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
