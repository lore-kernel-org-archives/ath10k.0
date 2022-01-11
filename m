Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9610C433F5
	for <ath10k@archiver.kernel.org>; Tue, 11 Jan 2022 05:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fXvW8bS/ziT8+FRC0gLo1gHvApl6eANUKjxntWnLcc0=; b=VLMouhhllPWTlU
	HPDtRQu5NoDubvCnZ40fyTD1dnoDTuNEU3kWx6OEfl+wel9dny3iz6D5krO80XAyUWDVM+l0Yg1Ub
	RYAZQEsU1Pxm9/d9Y6oIxOfSONq5gF2l1HjMLiWwhT5KcPqgRKQRAWjnlLzaygFI6kcutEECK3h7n
	6ZBOgAIldXiKUQtD47NWNu2LrQdOEHaw9bung3lvLVxGiQRjZtu0/n1yJNMiCa5CxvvJ37//wYsV/
	N76cHfWgPG5Aiy4v5MY85bAR9mPBSpCp5Ky6ysc1C74Y9BdoXBj9oHtY8QYFOuhVCwOXpc20KYX1w
	ciIcD1EkVdMXmuILsQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n79nm-00EmnL-8J; Tue, 11 Jan 2022 05:34:34 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n79ni-00EmmL-EN
 for ath10k@lists.infradead.org; Tue, 11 Jan 2022 05:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641879270; x=1673415270;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=SMxOV77jmhbxaroMM/jsm6f7w/c5wcioF3BFSTvIUm0=;
 b=dsb3OUlW2imRI2kWQVoNW6J96ZeUME+4XITRIRUUtF+9+X1GRZYHO8h3
 90ut9abU8NEWUCzzVC2a6thi6atVtgxVrTNwHtfmSBD91BYfmQfoDcLEQ
 WOXJ1ZpetnuwbmceN/wFdjWIj3ji/SuBDt+4zAlSHci6K7InZzVD0Omfg
 0/XQupYghN95CMMsIaUecydAzoAfS0f8Jpc6yVv+P62pg5Ui+QDMgs+pH
 JDsFKz75ek7/K7dAc02vOxXkWcnTrCzGNTNHn7sxyUNlUkcb7UNmok6d1
 CIK59FjwZx7WS8cYDzxUyJU9iRnYqmVc9ogLEJedR3TLNEA7U4ZXvvaRv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="242219228"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="242219228"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 21:34:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="592587682"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2022 21:34:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n79ne-0004Q9-Dp; Tue, 11 Jan 2022 05:34:26 +0000
Date: Tue, 11 Jan 2022 13:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 7e536b331e85d034819c546d72a70e91d950d754
Message-ID: <61dd16ac.cFbH1TKZkhKuDQbW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_213430_524909_75CA84AC 
X-CRM114-Status: UNSURE (   6.48  )
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
branch HEAD: 7e536b331e85d034819c546d72a70e91d950d754  ath11k: Refactor the fallback routine when peer create fails

elapsed time: 734m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
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
