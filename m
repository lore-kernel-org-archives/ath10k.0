Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B6C433EF
	for <ath10k@archiver.kernel.org>; Thu, 16 Jun 2022 03:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cc3ha4uy9ThwzlTdPnA6spIcQjOywJE0ZchDfd72ru0=; b=Ahq3cL53SEWiJ3
	RyAWBtmcfdxZwx+gKeM59ngDlBNFrYrUFTMGPAjEv9zEP0nH+cDQcYFYFVSFrqecZwAOBhaMEacvv
	XAkLrLYJ49HaMfFTril3DKWLATmKUWBnw6HzMUDophSCoJArgNcBtF5eQOCwpyKtX8C5due0oAmSi
	DkxzKt96R4fkq1zmi51Tp/qMNA0gqMrAlr1u+3y50Z7iYvQm8gCgTzifBWv84XvBckTXptlIoBa7v
	bIOxSZ5gyIuhmoOffTBtSGgBRYsr3RqOdPceaBMR0p00efovp1R4ktLy1A/xsgKM/I01dzlrxm/eV
	gaqsWT+IiUz7vc3W40yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1fsK-000DLy-6s; Thu, 16 Jun 2022 03:08:52 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1fsG-000DGP-LC
	for ath10k@lists.infradead.org; Thu, 16 Jun 2022 03:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655348928; x=1686884928;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xPuTAF8OWSbNIlD7YM91BXcsbbcIM5ZkgmvFVRURfHM=;
  b=TNaouT4/hGWd05+sWnU+22pzqELpUlO0/EJyPwWXn4Jn4RwYQqsAHqed
   bYQNUeNwxRuDVlJ0wPR3vu+fBgpYil1DtLhWoWY6Z5OrAcDhuREE12fc9
   simomZeBEo7JZpJY5vtZ5ZOJWKQzCA57Khh4efjqdv4yIbpP2cph+Ft7J
   7bvgg8ebxgAJwRIAmPnVjwqdYCc/rzuCgVk2T8E5BCROTm7MEDukxzXu6
   rl49M8pFXxpwbmTh9yPpQ44vbcS7HUcNLA8un/jMDWBjE+cq4S+QnnRbs
   cfaoguG43XyT4iqkrgWyeU+SVs01YHU/C3W0YEtM9rQtWwY37GSZa0oRr
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="304593609"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="304593609"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 20:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="652969855"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2022 20:08:44 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1fsB-000Nyn-Q5;
	Thu, 16 Jun 2022 03:08:43 +0000
Date: Thu, 16 Jun 2022 11:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD REGRESSION
 f6fc8dfbdd4f8aa245e4d22691f7ae3057a01dbf
Message-ID: <62aa9e8e.pt4Hc743jFXCsW8V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_200848_785779_E2C79543 
X-CRM114-Status: UNSURE (   6.17  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: f6fc8dfbdd4f8aa245e4d22691f7ae3057a01dbf  Merge ath-next into ath12k-bringup

Error/Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath12k/dp_rx.c:2724:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:569:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:406:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/pci.c:678:14: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arc-allyesconfig
    |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32

elapsed time: 726m

configs tested: 53
configs skipped: 3

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
