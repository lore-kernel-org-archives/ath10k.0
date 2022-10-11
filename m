Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79348C433F5
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 01:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpN1MdWlUdV0sI4K/KD6UkEsL38yfu5+k0sW14W/3UU=; b=t47b26c5p45Im5
	Vlkmf6qlbuBL7xXM6XhDjOKrPeSFnebElrQr+ECIB2iLx30zFsN5Z2qeUi4+hQIBx4nf+6YWeFUxN
	cKLWIwbhNh0Smxy3qMKUwTUmlg78IdMsjRGoxLJM4QXxylR96GtgnOmLpJ1wI0kVKmtmkUiV86Log
	alz1UmI/7s6byZCr2sLBvj9I7Ehz9Y+EvF4N0BYTyapzOxAkbdE5s2oPKCv7sy0mXHz0RaiSF3D3L
	HhrFt2Mp5HS2QziZxbfSTKBidM78kWTyif2gn2/kH41p0jzV3XdbTjLJFskQrTmn91ZLIZoUCEi48
	VTcVNtHOzfo03Mcfke1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi48S-002vNa-JO; Tue, 11 Oct 2022 01:32:44 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi48Q-002vMx-9I
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 01:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665451962; x=1696987962;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KB3G/DmUjg4Ct7Y+38jDhmzzSVMbjV33lz6En57eTfk=;
  b=V4zuVdMs2nuxtb2ien4Gg2clcK5PckTOgAOU3RBo+2d38n6PIzMjjnVb
   s/MNe5PFjndJa626QJNoNdoBxNukjkgomAlzRXc/4G0PLs9ZbuvHRVaIu
   ZRN36JxiUdmJz8OQfC4f6/ZpCbeUaNJlt//PpueFj7zfjSRzHZQCSMGL9
   OjuzCIIHIpZeCj/yAHnkIfln9qE6UrpHz2eWI4JUnVbwGf5UqGiWWMj48
   vpSJdoY3V5jH0NLVHygIRfWH5j3qcurFuCJ1EIkue5OAXXpA7W2OZEWIx
   A7D6ZB8MNjFf0WTUIOjI0UGej3jyOQjkYUQooNSOFpr9g53B42n9uVkJH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="284761117"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="284761117"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 18:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="955146694"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="955146694"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 18:32:37 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oi48K-0002Li-2W;
	Tue, 11 Oct 2022 01:32:36 +0000
Date: Tue, 11 Oct 2022 09:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 ec83370e3da6d58c00366bf1673eb585ad8da23d
Message-ID: <6344c794.n3fFiz84WqvbQuWk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_183242_368704_B788C729 
X-CRM114-Status: UNSURE (   3.73  )
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
branch HEAD: ec83370e3da6d58c00366bf1673eb585ad8da23d  Merge branch 'ath-next' into ath-qca

elapsed time: 939m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                              defconfig
m68k                             allmodconfig
s390                                defconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221010
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
riscv                randconfig-r042-20221010
s390                 randconfig-r044-20221010
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
i386                                defconfig
arm                                 defconfig
powerpc                           allnoconfig
i386                 randconfig-a012-20221010
i386                 randconfig-a011-20221010
i386                 randconfig-a013-20221010
i386                 randconfig-a015-20221010
i386                             allyesconfig
arm64                            allyesconfig
i386                 randconfig-a014-20221010
i386                 randconfig-a016-20221010
arm                              allyesconfig
x86_64               randconfig-a011-20221010
x86_64               randconfig-a016-20221010
x86_64               randconfig-a014-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a013-20221010
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig

clang tested configs:
hexagon              randconfig-r045-20221010
hexagon              randconfig-r041-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a005-20221010
i386                 randconfig-a004-20221010
x86_64               randconfig-a002-20221010
i386                 randconfig-a006-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a005-20221010

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
