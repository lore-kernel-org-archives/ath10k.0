Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73C6C433F5
	for <ath10k@archiver.kernel.org>; Mon, 23 May 2022 10:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d5uQjM1bi904YtpusTFccvtA6YV/p27nY93R9PP+VWs=; b=ZF2PsdPGJC0cAW
	vqhZ2e1lnPlHh3WtKnY/KOEPnURv4RJRdqb5ahK7ruKHAqIbcKCvuOGNpWrZQc4Abr7eFHQnhxWSZ
	U1edliIC8pJY8x3LMt1r+RWSTYJ3MgMEODalnX5ExGGB4KgA10cUfYwDpviDQh2VVLDyM3pl4lKYO
	GOg2hlSsUErEDRCC2c1y+76dv40IpFGivrmhMu/UAYF62F45k8qbz22jlrxefLGDQcJAnUnEfQt0H
	w48Y+EJSdUgPxPP/ZzQq6XES1XCDtbqTuAu7+P3eCEPv1MT/iwG6uuUq7dKCfSDFk7Fe+Oo1TSOzs
	BOu6A9qrRmoN1AvBKQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt552-0039I0-67; Mon, 23 May 2022 10:14:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2vT-002CKb-7h
 for ath10k@bombadil.infradead.org; Mon, 23 May 2022 07:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=VJ4hUcwb2SJ0MqvuQbkxmXZaoX+KvhCY+CtINHjDqT0=; b=o1a2WsOtExTWcCZUOwiWOOkqJA
 w1VrCnuYlkUKZIjwo48QMi7pBZicMVc7cpHdarPeMPRI2mnev0nWKW3CtlvEcitzN3FGwnz0qtZye
 2fskYxm5Raw0ueygiGpNjePPHsuu80ZfTX1aggheYPmfVYo/c24DQLxTZG+vxNNLNmbXEcvhSq2u+
 oBuiZ5zddamyhFiI6iSoXvh1wAinEHV0CMN0iWINn2ts1c0O/imn7pnJlmTeCLED5J64ciwz4tdb+
 pQsvvB2KxxZ/i9BI0uCzuyOpv1pKP19yRd8gNE9OMzhDz1kg14I3Gwv7PE6LTxObf6eDBcRLqvUoI
 y6iFbbnA==;
Received: from mga03.intel.com ([134.134.136.65])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nswMG-000iC1-AT
 for ath10k@lists.infradead.org; Mon, 23 May 2022 00:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653267340; x=1684803340;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=es9e2iM7c6w+LsjvL3zcuhYvYEpzJBw3Rze+jTEyy1w=;
 b=ZnuEkqZR7YUvCL8xBKWrgTEjEjHlko6QWsXHrErMktpmtfewNA9QuFgI
 sa5bmydt3rygcJUX6xTi0qV7rueTfh+uknjkkNV/fSAWYX4F9G4Yyn18x
 Vb142ARrAtbJKmXnWZW2wvuoJeYbGQsxC+RNCEqvgFibMgHybq6L9B8SV
 UqMcTMC6J8q2SeJjkXa/J2yZfkMFXotV1V+GOic2a63MAF/QtTqnM0RUW
 7nfMSryJojzHoOj37iNGjEJt7MMS6LOdueofr2gP/VE+yZ2ak4sqV++sS
 IjCrkwHFhI5Q9SY5jeELPlErZ34Rjugso3nG7GH0ZPWoqC6fRDIfD/3DH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="273053837"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="273053837"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 17:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="558397152"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 22 May 2022 17:54:26 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nswL3-0000lO-RZ;
 Mon, 23 May 2022 00:54:25 +0000
Date: Mon, 23 May 2022 08:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 8a74ea53755f477f7a1efb4d852336fa063be95d
Message-ID: <628adb1c.+lcEMSjs2L6o5LlD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015541_654425_A526542A 
X-CRM114-Status: UNSURE (   5.80  )
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
branch HEAD: 8a74ea53755f477f7a1efb4d852336fa063be95d  Add localversion-wireless-testing-ath

elapsed time: 724m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
ia64                          tiger_defconfig
mips                  decstation_64_defconfig
sh                           se7750_defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
arm                        realview_defconfig
powerpc                     sequoia_defconfig
m68k                         apollo_defconfig
arm                        trizeps4_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
arm                        clps711x_defconfig
arm                          pxa3xx_defconfig
alpha                               defconfig
arc                          axs101_defconfig
mips                     decstation_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
m68k                                defconfig
m68k                          hp300_defconfig
m68k                             alldefconfig
sh                           sh2007_defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
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
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
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

clang tested configs:
powerpc                     mpc5200_defconfig
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                           omap1_defconfig
arm                            mmp2_defconfig
s390                             alldefconfig
powerpc                   lite5200b_defconfig
powerpc                 mpc8560_ads_defconfig
mips                     cu1830-neo_defconfig
arm                         hackkit_defconfig
powerpc                   bluestone_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
