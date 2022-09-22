Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A54ECAAD8
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z9Hl6QajE7k7fWXvzkEXoOFDaDKem7kOu/ETPM+WGwQ=; b=I7xJPyQJtAfaX8
	xh93cbw32eh0xNu7F3SO59oqivS/JIA+Y8O9ayxFi/nMMWTSmZPXRfsowxUKs3hHgaUtBOVrNafAm
	RhUfSrOrPL0t9uJyhxNy3ggc0y5jd74qWWsSPWh4t+o15OZUqSv0d/2D2ck8/dTvNG7fRJywoOLzX
	zzC0+O62SJmuAslsLjuB98HeZAT4270DIX7uI+IEC9vEjwDFvNFvPPzbv7EprKziCel3x3e7pwgvA
	zJx+U4mhlUPJUB4CXGvZScMUu9VEeAMDoaFkxtKzcizRJl/Z3yeehcn37GvVFaTcGOEcU/IlTOPOG
	dYepncE0hlI4cRJxaeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obT4M-0009eg-Ci; Thu, 22 Sep 2022 20:45:14 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obT3w-0009Wt-FV
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 20:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663879488; x=1695415488;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FxY+tgG3oabIDfb7fTuDrwKdYD1NLv9rOV+f9/npbkQ=;
  b=FiAod9PBfnXnEHnR//QtA0JAbL2PLgC8JlQC+muS98S2R9BxW6kIwHyM
   tjcTq5bWwQj7zrfm01S6CFbsLzFFWLQuhEkHSSfa27Xv7iTUoRQz3lXcu
   uCav/sxxevCEH8jGwbhMtSHn3/pG/vgxFw8l6ABLqFL2q7I20STHnw1Hn
   dlUnd2Om38qchIItLeVY1LUKRKEB0w7OFb2l0Zp0l/mChbWgDlZOEzeyx
   6I317poidcMfO+VtnrXA/WUzF7zpBpn7kq5Qd67+6FoiMZTxfb8emaSg2
   OPx8fD8Nlwrqrn+3cLbdDdroV9i3sZD9N7sC4szX5R3XbzglFTdlZ+lFA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="299149893"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="299149893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 13:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="597601410"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 13:44:41 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obT3o-0004ws-1z;
	Thu, 22 Sep 2022 20:44:40 +0000
Date: Fri, 23 Sep 2022 04:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 d53cb3d8133dd4af58f0ac21778ed3a786840276
Message-ID: <632cc905.zKAcnreITcpt/9t0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_134448_601407_B3FF873A 
X-CRM114-Status: UNSURE (   4.91  )
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
branch HEAD: d53cb3d8133dd4af58f0ac21778ed3a786840276  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
powerpc                           allnoconfig
x86_64                              defconfig
arc                  randconfig-r043-20220921
s390                             allyesconfig
x86_64                               rhel-8.3
riscv                randconfig-r042-20220921
arm                                 defconfig
s390                 randconfig-r044-20220921
x86_64                           allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a002
alpha                            allyesconfig
powerpc                          allmodconfig
arm                              allyesconfig
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                                defconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
powerpc                 mpc837x_mds_defconfig
xtensa                          iss_defconfig
nios2                            alldefconfig
m68k                            mac_defconfig
sh                        edosk7705_defconfig
xtensa                    smp_lx200_defconfig
csky                             alldefconfig
sh                           se7705_defconfig
powerpc                      tqm8xx_defconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a001
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220922
hexagon              randconfig-r045-20220922
riscv                randconfig-r042-20220922
s390                 randconfig-r044-20220922
x86_64                        randconfig-a005
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
