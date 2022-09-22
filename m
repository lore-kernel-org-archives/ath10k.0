Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DBDECAAD8
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UQmJbGx1IFbTyeySUt5WyhOPYTkAbGFcXQocg468EcM=; b=0OzrNHvQz8R7/U
	ETVQ0kutdUw2yvvnAqOybC5WJGc5NkomdAc38woUNSbSF/8bNbvyIXvwRvUD+2Ic++ambjXrOCJT9
	72r3jQGClVjwoj80zEfat02/m+eMiOGZTGNFM6AyWpKjkiVANcdudhPRTpQH1MZG5eflXZeq6iUoI
	/n/JsyiS6a36gutcC5y/8unOfuV3z+f7eglx/ymb/foEbPlCkvltrflQD5phQ0F8LAb3Hb+rfLygT
	QUFxZ3O43JbMl8IU8hr85EHpr/lhDmgoAHEKzo1D7J0yvAXPqwihsV0iObk7VezYbUTDL6E5YUpIu
	fJ2JXrVmdigkkQ8sCt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obS5r-00HagB-Vz; Thu, 22 Sep 2022 19:42:44 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obS5o-00HafB-Tn
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 19:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663875760; x=1695411760;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z4Jj/mttypGmPHqOYqyT3OrvkUdrGQeYEGDeb0cpLJE=;
  b=FHRQ4IxK2Vz3ewdxKm2bVOdwKlVTckm2QF0EqhdF8JiS+iyEJqr7KGhK
   4X3TKn5dCy00nIFhtfRSAWkW2zMWK93+77E1jes5tra0gK+awN0jiL3be
   wUQA0vNfLjrFs3seuuVgZhhrJ+qjPHmk1hUWm5G6aOlbTpDekGGwwKEaC
   8k/MfAYK5EFTT7IB6iaEV5odUFSY3LjngpP/CJDK9nb/tZeHmKgr0ArDS
   jkYLOaefxnsdqvcGhx0jg5/uRA33a9RSJxGPJr5ZJ7mPahDOXa4Tlh8dR
   k2kxD36bQDAlL6svrs2ioSjsk2bCZKwgX8u7nGsTWdtBU5L0DTbb7jn+K
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301851270"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="301851270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 12:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="653123254"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2022 12:42:38 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obS5l-0004uG-1D;
	Thu, 22 Sep 2022 19:42:37 +0000
Date: Fri, 23 Sep 2022 03:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 67552c0328709b82bbfc4b52f1e83354c2d21561
Message-ID: <632cba8e.F1kUNmB0sWdCqRIv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_124241_027641_7210302E 
X-CRM114-Status: UNSURE (   5.95  )
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
branch HEAD: 67552c0328709b82bbfc4b52f1e83354c2d21561  Add localversion-wireless-testing-ath

elapsed time: 720m

configs tested: 66
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
arc                  randconfig-r043-20220921
x86_64                              defconfig
riscv                randconfig-r042-20220921
i386                                defconfig
s390                 randconfig-r044-20220921
arm                                 defconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
powerpc                           allnoconfig
i386                          randconfig-a003
i386                          randconfig-a014
powerpc                          allmodconfig
i386                          randconfig-a005
i386                          randconfig-a012
mips                             allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a004
sh                               allmodconfig
x86_64                        randconfig-a015
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
arc                              allyesconfig
i386                          randconfig-a016
x86_64                        randconfig-a002
arm64                            allyesconfig
x86_64                        randconfig-a011
alpha                            allyesconfig
arm                              allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a003
hexagon              randconfig-r041-20220922
hexagon              randconfig-r045-20220922
riscv                randconfig-r042-20220922
s390                 randconfig-r044-20220922

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
