Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3590C433FE
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o1E0xCukYVX5rkSwFlM0H9oei+f9AJmxrGkNBCA+yNg=; b=yRTS7/SadMkRqv
	jC5Nz0lezFMuUXx6Txgy554jMmVojxL5EOPDm/OvYwD44DJwsVUWZiiJ/g3HXXbT4RYbGBw5qKzkk
	CulhUIA1h7U6xXUnC+19a/pPYbKlScynHxDAQnYE9JEHV1XX1qOMI7YYA8Dwza4ME58tkVnqvzdC9
	cT7mdQ/o55VI3vYO+2BOAebkgSSLhgsozBRDlI2HV3E7lOK1HA8iIVdX5l7+BuIrHWqJn/OrZNdKA
	2Rk3XGtG2/RJBMYLjn14uqnR+wPTRiin6gRfi0p4Xiw33SfA0bbGBV+jQ3izIDGziW32pEQ1p69k5
	3FTpWkbt5qaNdRx1ackA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihle-009Cul-IB; Wed, 12 Oct 2022 19:51:50 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihlb-009CuB-Qj
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 19:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665604307; x=1697140307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W4ZrJEi9yellI8KZchesK4+EpJmgv6DMHlI6TcdlLPE=;
  b=bGH0LUfXMiICnwkxpuP1G2wrgVK2tSDRHnQuOZoz9nVGKtBReZJycvR4
   VzbjjxOUoou8wSuL753UijklC+TxBnCvALFo08xe4SBE4ig+KoLUuuhHq
   1cxOMjwobvtuwYA3rlUrT+/oWDxcLX1mjNJ6FliLevWrGPsK3drqAajg6
   VJhmCWAXnWWSyme738sx13U0JN76aEJLAfjeHXaySGfGLMJL4OZPMhZ0x
   Dp4qUQWv8rQvP28cHul/iUTDNLeVmDTWn4NjjTC+H0mJHSjf7IJQSqhP4
   cOXGtaRTG7YXBbJ25CCkBoLjvftUE4QWSMu8JDUNB/cqS0S2RzxNwMXYV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="288162789"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="288162789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 12:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="657898862"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="657898862"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2022 12:51:44 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oihlX-00047n-1M;
	Wed, 12 Oct 2022 19:51:43 +0000
Date: Thu, 13 Oct 2022 03:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 651018217c35e66b5e6bf421f3f3a1f30e2f5986
Message-ID: <63471ac7.fbb30Bj+yUqssM7g%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_125147_969689_0226C48A 
X-CRM114-Status: UNSURE (   5.44  )
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
branch HEAD: 651018217c35e66b5e6bf421f3f3a1f30e2f5986  Merge branch 'ath-next' into ath-qca

elapsed time: 784m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
s390                                defconfig
alpha                            allyesconfig
m68k                             allyesconfig
riscv                randconfig-r042-20221012
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
x86_64                              defconfig
x86_64                        randconfig-a013
ia64                            zx1_defconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
sh                           se7750_defconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
x86_64                               rhel-8.3
arc                  randconfig-r043-20221012
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a011
s390                             allyesconfig
arc                            hsdk_defconfig
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                             allyesconfig
i386                          randconfig-a003
sparc64                             defconfig
s390                 randconfig-r044-20221012
powerpc                     stx_gp3_defconfig
i386                          randconfig-a014
i386                          randconfig-a005
x86_64                        randconfig-a006
arm                                 defconfig
powerpc                     rainier_defconfig
i386                          randconfig-a012
i386                          randconfig-a016
ia64                             allmodconfig
xtensa                           allyesconfig
arc                      axs103_smp_defconfig
sh                          polaris_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm64                            allyesconfig
parisc                           allyesconfig
mips                             allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
powerpc                      obs600_defconfig
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a002
arm                        spear3xx_defconfig
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a014
powerpc                       ebony_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
