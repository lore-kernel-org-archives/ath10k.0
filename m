Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2159AC43334
	for <ath10k@archiver.kernel.org>; Fri,  8 Jul 2022 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=09DEyW6QnQrP6qhSWS0ljxa/TbL/D6dDLkNDfu/FkFk=; b=lesoeGJd6U4xWR
	oNpCpMhscBKd6y2Z8Fi5lcWmROY+2sl+pcW8mNJPdmhI1/hQKtQ6xaSw72acYdhJhP1VgcCiGpnZ1
	XCbCR/yJIqGSb6v/b0sDlksDHcTsHbE2N2dMMhdvo3T3mLFzS/NlukaWrNSUsxWav/sADGf2Y6a/s
	4tW9WarEOnwIQrF7SgNF6gDe2zvf1/vJbUF+GGhN+Beu/gZJmJuN2vdO3tYxEHCUNhczoo/V+oF+M
	A3Ozlq5XGLUb+Jjh93bGpVK55sNbYmxKsz8R0Aob7VMl2BkN3mhhs3jVqyFLkBlqYq2gXalfLDAdw
	C2t55qyTcc5JEuB5NIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kFC-002txE-Cc; Fri, 08 Jul 2022 09:25:50 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kF3-002ts0-Nd
	for ath10k@lists.infradead.org; Fri, 08 Jul 2022 09:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657272341; x=1688808341;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AtcJrfLQWkzwYp3zFteLfEIttROSqXXzpgd4t75gw/w=;
  b=et+v0aaoVeyalV6bV5fkQ12hxOicaPjGsTOPbxSwHvdK/uBUhO0d/HOF
   I4fonEJunUysmDhTZ7FUkqyiJZsVyIvBYzLX+cevN0lP3Un24MpDzUH2L
   viPYsBsfuE+dn193k1LpU/Jd2ABg1jAmoNm2DUESiD5pe4ngM6TePD7OG
   ssQ6a1pPF0J3nsFcTyCq/uHVCPAAhpXCBn+zIaNzWJ0rymHmmbe50DdaD
   wyUkyqjq5SQKOLYL9RMaI91AquMO0Vpb6h/FZ67m59wwhUisOad5jYhFV
   ONqivwAwTT65qOkZR/Os57UIcae0zH7Wi6hnZRXoEF38RbjnzGYjPZtyy
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348225367"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="348225367"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 02:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="736281032"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2022 02:25:39 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9kF0-000NGQ-T5;
	Fri, 08 Jul 2022 09:25:38 +0000
Date: Fri, 08 Jul 2022 17:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 75f39ae0c7c98cf5f650e97c0382de7d7d1b111c
Message-ID: <62c7f7d6.5t+yTyIAEBDsCE50%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_022541_966964_348EF382 
X-CRM114-Status: UNSURE (   5.45  )
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
branch HEAD: 75f39ae0c7c98cf5f650e97c0382de7d7d1b111c  wil6210: debugfs: replace in wil_link_stats_write() in wil_link_stats_write()

elapsed time: 952m

configs tested: 50
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a001
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220707
riscv                randconfig-r042-20220707
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
