Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F79C433F5
	for <ath10k@archiver.kernel.org>; Thu, 19 May 2022 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ckvWQxXmY1OTMYZHShwHPYsd+ywd6KTygqL9o5OaGTU=; b=mSy+4ywqbjJBYR
	xQ0vRoNdd30LU5sA2DhwKo2Sh2dA41KOKzN+IWMIIpBMxawt9L9//6WCZT4j0XEVJDFxwAAQSkOOs
	DcgPtm20CJ24rsQNHKTCro4gWyfb9En5NBh59B9F5Gnqa/4gu/0Zayk9izdO+190khta/XOPKqfr1
	OtMxL04wXV314qSGKCAmmzKfIFmortyMP3QICK5YFhfPhZQsEGjq4tjjhdee6u7LGX76UufGa+Z6K
	nJFNOVUALhxO2INgGH8upNsZH6NlYVRPDLPTshRZAo/Nf4QXzPc26MWB2zYt/KTv9QqjXB3jbV8YV
	ZIq8cq1WVi9cCuY1s+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrki3-008qXA-8a; Thu, 19 May 2022 18:17:15 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrki0-008qSe-3A
 for ath10k@lists.infradead.org; Thu, 19 May 2022 18:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652984232; x=1684520232;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=H5n6A5IwxU6OLPZDlA3KkNUTcJ8OWsvtKqiPepx16hM=;
 b=lH5Gpvro+oSdKtqjz1/MHof0rOVX/gc86ZrGvFS9IJzcAycdCM1YNG7I
 HujhmN99grgo11clC5wIXQ3swWJNSS91dZ4j6m8nfD6jVXxKevJa319Xc
 CUW0aTMYSlj5vSF6MkEmniDxTBgqyBxUsCEm6lJGSIbx7HmBQtL2HmKFd
 qSpdHiNagIrVHS+jgObuoPDc6X8DL6CSARF0Ej/dMcRS53EVs7tNhv2lT
 XAPCwbS4Af5Pcp1BKq7DFc7W4AmSNRnThHFgy/cEC2VIiG7GjBxaJk14y
 UNWNi+ULxHambmKQH+7rHXJXuJS2snG1GM+AFHoy6m7kp42xEBoYecc09 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="297621322"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="297621322"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 11:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="715120925"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 19 May 2022 11:16:58 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrkhm-0003q0-28;
 Thu, 19 May 2022 18:16:58 +0000
Date: Fri, 20 May 2022 02:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 873ea484b05a8486b8bfdb114bc5dd12028631f4
Message-ID: <62868964.fnu/FPakbKyWdFE7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_111712_367444_65A39BAD 
X-CRM114-Status: UNSURE (   7.86  )
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
branch HEAD: 873ea484b05a8486b8bfdb114bc5dd12028631f4  Add localversion-wireless-testing-ath

elapsed time: 2079m

configs tested: 80
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
parisc                           alldefconfig
powerpc                 mpc834x_mds_defconfig
mips                            gpr_defconfig
mips                           ci20_defconfig
nios2                         10m50_defconfig
sh                     sh7710voipgw_defconfig
ia64                             alldefconfig
sh                             shx3_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220518
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
s390                 randconfig-c005-20220518
powerpc              randconfig-c003-20220518
x86_64                        randconfig-c007
riscv                randconfig-c006-20220518
mips                 randconfig-c004-20220518
i386                          randconfig-c001
arm                  randconfig-c002-20220518
powerpc                   microwatt_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r045-20220518
hexagon              randconfig-r041-20220518

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
