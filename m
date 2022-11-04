Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD1DC433FE
	for <ath10k@archiver.kernel.org>; Fri,  4 Nov 2022 23:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ixi42CED8UO8RtNUTbCmrXxXfo0Un2PvjdCcBlL8Sjs=; b=KHwmqEjwSbMY9Y
	lNL25Vk4P7K7OMQPUUlktMye3v+EBcAOcbrKN1ns4vE4yRBCNCr+1QpVUMs9TiIrHFLBRM6euZPtD
	U7ARt1P3quZS6xXEhhoFh7Rg7nikYbQ0aDiJRMnoe+g2bGta52GxQ/fyLhmIMF1xDVi6VhiPWAKYr
	torp3nelnvJvQLd4RoL6cPtekFA22nyB8qMURhdbWQ1bJ7DwrMBJXCBe8SiIS6pAto8IrJq1xB1P6
	oHj7alVgfd+BY2yGk2/YIUNOaHT5Hjcecyg2MqAEfRhrTpNxuOz3VeR5cqr2JBSo6zTQQXS/L82JC
	paVN0c+2sZ8bOFnUYKdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5fA-005Rs6-Qy; Fri, 04 Nov 2022 22:59:48 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5f8-005Rr3-Ji
	for ath10k@lists.infradead.org; Fri, 04 Nov 2022 22:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667602786; x=1699138786;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nZaOb6lxmz7A+r18AZF712pj7zrGRoC5Poz8VRouv1U=;
  b=Vha8LVxdNBhLwjAbqs/N42q/rC+ez8g+ZBRwR8LLnPpTI5KeTDZbR17n
   WS6sNgL9TsL8SRpXMygXCIqHFWROjNtgS6EmmL7mshdRHi+Lb7JN8UD+G
   +RuUEObD385Pld5LmLM4OSVLK8O2eQ5AXFMZjkiLxQ3gtnjter98CwqOY
   jAnkDP6ziMLp6Gmfo0VtxMjCfBhIPB2ADBmbuflorjvaNozTYDK3a8V5L
   uhul+TnVpXptIZ0F8tb8OlKP3DFPNJWuYVuffagOhLNetXy8sftNuWOJ+
   IXbNxho/qo2bZaoRlM0YYkV+xOOG79tIuWoTPYIL/7z1mgJ7aneNnTRhH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="297562815"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="297562815"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 15:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="964510615"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; 
   d="scan'208";a="964510615"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2022 15:59:44 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1or5f5-000HPh-1l;
	Fri, 04 Nov 2022 22:59:43 +0000
Date: Sat, 05 Nov 2022 06:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 438a149ccccd36d26f237daf810a926333f2a26a
Message-ID: <63659923.YLQ2IB+B0mj60OaO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_155946_725678_3272DCE3 
X-CRM114-Status: UNSURE (   5.68  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 438a149ccccd36d26f237daf810a926333f2a26a  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 78
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
arc                              allyesconfig
x86_64                        randconfig-a004
alpha                            allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
powerpc                          allmodconfig
arm                                 defconfig
i386                          randconfig-a005
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
x86_64                        randconfig-a013
m68k                             allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a006
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                          rhel-8.3-func
sh                               allmodconfig
arc                  randconfig-r043-20221104
riscv                randconfig-r042-20221104
s390                 randconfig-r044-20221104
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                               rhel-8.3
i386                             allyesconfig
x86_64                           allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
m68k                       m5208evb_defconfig
sh                   sh7724_generic_defconfig
powerpc                   currituck_defconfig
powerpc                      ppc40x_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 linkstation_defconfig
arm                         cm_x300_defconfig
powerpc                     taishan_defconfig
powerpc                      ppc6xx_defconfig
mips                     loongson1b_defconfig
arm                           viper_defconfig
arm                       multi_v4t_defconfig
powerpc                      pasemi_defconfig
i386                          randconfig-c001

clang tested configs:
i386                          randconfig-a002
x86_64                        randconfig-a014
x86_64                        randconfig-a005
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221104
hexagon              randconfig-r045-20221104
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
powerpc                   bluestone_defconfig
mips                        qi_lb60_defconfig
x86_64                        randconfig-k001
mips                        bcm63xx_defconfig
arm                        spear3xx_defconfig
mips                           ip28_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
