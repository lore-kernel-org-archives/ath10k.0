Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B799EC4332F
	for <ath10k@archiver.kernel.org>; Sat, 26 Nov 2022 09:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q3WysZAg4qoE8uxtkwA4gi0pZL5cw34u4Gw//9uNVFw=; b=Mnd1K8ndTP4Nv+
	QyjuIxi5U7UTlPftHizj1fv+tHaCmAPWpk+bfb1f0FQU5ptPp3bXppticUBCwAszb+ZIiqVj5xLOj
	1lMPgyL0FXcTxf133BRQEP33J6kdCsKsHemmCaFQRVPuF8/KdhnrZf9Ew5GVMYJ/cwemxbnOO4WlW
	1Opi67R2iHn5hN+v1xN4bmgLZaHAitxDl8pwcaEMkZLd9YzwLaZdMDM4weoje9LrZDukRUC/+DTZJ
	g50MVAEcLUoxu6VVlBA9EiKbVon7ytbig4OAg3BU0S+hw8fvTASeb8c9B+eD1nPCZpdgGkVJcekQM
	UWbvwb9y15wrzXBoWKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyrco-005Kb0-Ng; Sat, 26 Nov 2022 09:37:30 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyrch-005KZM-Gp
	for ath10k@lists.infradead.org; Sat, 26 Nov 2022 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669455443; x=1700991443;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UcA83u+cRMOrkSdxCKykpjysFg11qarZ15e8BYS0PYY=;
  b=Ku+zZhRuIpqEeiVKPIyTKTGQ+8lQa2doQPh99Sj1HP4tTo9QlOMW8b2J
   QIbHw7SWnt5GJ3cL83n3uiLxQaBB2bapK8OsLc/3J0tFe+16HVIv/Y8aS
   uFutuHg77XP6LoSSYr8pPtqR3HMwdBW0D/fGSlKB1Vyalp5A0NcpGIHSh
   Y5dF9jDswmdXbeIHssU88bBl4CVIYKEDlf/D+bE0cC7qNppoCOzvT+U/U
   PKpwzy39Q+J/rKrVF+S07hK4eIDvBLFcdrBgw+pG7wqHgx+G+p2AHx050
   aCjGN5Wf02T2gD7VmwKp+NqrZH1Gzz9LEDIT+KNks5hNreBa5bvLbnXLt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="378840752"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="378840752"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 01:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="642897042"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="642897042"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Nov 2022 01:37:19 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyrcc-0006AR-33;
	Sat, 26 Nov 2022 09:37:18 +0000
Date: Sat, 26 Nov 2022 17:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 7570940ffc4d26133e42cdffa9039a2172e14838
Message-ID: <6381de24.E71/b5dgXxUpqc00%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_013723_649368_948EA676 
X-CRM114-Status: UNSURE (   5.54  )
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
branch HEAD: 7570940ffc4d26133e42cdffa9039a2172e14838  Merge branch 'pending' into master-pending

elapsed time: 1306m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20221124
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                               rhel-8.3
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                                defconfig
i386                             allyesconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
arm                           tegra_defconfig
sparc                            alldefconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
s390                 randconfig-r044-20221126
hexagon              randconfig-r041-20221126
riscv                randconfig-r042-20221126
hexagon              randconfig-r045-20221126
powerpc                     mpc512x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
