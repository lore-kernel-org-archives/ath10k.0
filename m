Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E4CC433F5
	for <ath10k@archiver.kernel.org>; Mon, 23 May 2022 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vKuqM+3kOGMNHxRalk/rMlrgPI7f6yZXp64mIC/kNXQ=; b=y8ZZKUNPMtYz1K
	lQeN1ZJsKShIYZ+Gc+wAznSikKE2SigolhqJYZT4wydOBFV73scDgqWCh3SO3/TdPesrQdrl6DjcW
	rpqNOKAdDPTZWGMwdV/R0tatG2KeFIrc2z1cWGTNRtQfyPBRt0VGr7w6QPo/ECp8v53iNxdv9asHb
	5Y/kcNqbpCZH9hVXp3r5YaDzRK1YAgoLpXThRenyK35hPoeeQfWsNiAKQGKVH0LG6lIkFnRFy0VlH
	kMDkt3Q6jCg749NUCc2LXvGlKJjFfHb5rFSu12WZTZY0DeAWoVsCfQRnMEGIsfGkyei4oxMSPICw7
	MBnckNvo6Zb3O+kS/e8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4RI-002sMU-IG; Mon, 23 May 2022 09:33:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2vV-002CKb-NF
 for ath10k@bombadil.infradead.org; Mon, 23 May 2022 07:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=bEh4nQp0buieioUNMtrcCyR07y6aK+Ka1vld1vIhAx0=; b=ZS+cew2a/ovz06edQYIXVL3bbM
 m4WXQj9HnRbmb0kfWfmSWxhaZPDqiwM06Sf3erdRIagAy5+ymVsWvcXSe4oGPMTJTkVJq4Dvl/HLm
 etQayNqJSmoernN8BRJarfRajsRuNyBxT5ko6ddMRiK5P0IOTP761dAnMtkuHVT0vZOcjyl5oS+y8
 fFshzNOIGKK/ZzeGL+7SfjK2WotrlVtVibqOXxFK4xiGFs//hLX6RWEqXmWCRBTQrmM18AiCNTb+o
 2Lgw+AKvvbgOkZLqBwlenGYChwcPyBGcbwuGVwyRUerBSKObMKX2RVkynnseDqST4bfSUIdltcmFl
 b5rPW2Ng==;
Received: from mga07.intel.com ([134.134.136.100])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nswMD-000iC2-BA
 for ath10k@lists.infradead.org; Mon, 23 May 2022 00:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653267337; x=1684803337;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=VoM7/EEOyslI545qAywcFk+SfRhvQy8+8DKfWi1Gz/A=;
 b=b13AHqo8xf4OvUPNocKlz5vA2qTJ8hqDlj1ct2doAgjS86wm/tLdyb7h
 hjSRg+/HGr989xC+60Xo1Jznh0bZJoedzvhFLLyv34rJ8rgKGhY7jCwyY
 v/4PqxL1L0EEyQxkZ4XQXiPjBYwUQ2ZppMjHIPx5qDadhoaVgNsG51GSa
 8BLxK9ZLeiF8uHq+gM0xO4iNHpTVdHK43wlzimzMrtBGTkWhG3GgHEHzX
 qWwAzEN3ykoCRUk4c6TfGiWCvfl/hIH8bk3qUGUKIwfscXcqVry6axK2G
 pyBxM7p2b5fjLRCf1wBv0m6l+KXNUiCFn/uKLzUJ4O28giWkVq2D/n1cG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="336122420"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="336122420"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 17:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="525659398"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 22 May 2022 17:54:26 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nswL3-0000lM-Qx;
 Mon, 23 May 2022 00:54:25 +0000
Date: Mon, 23 May 2022 08:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 1da6a71f6a4ed40d9bf56e69642952c6c6639416
Message-ID: <628adb1d.wJ/9T+p59W9MK5zP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015538_599945_CD44F7D6 
X-CRM114-Status: UNSURE (   5.26  )
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
branch HEAD: 1da6a71f6a4ed40d9bf56e69642952c6c6639416  Merge branch 'ath-next' into ath-qca

elapsed time: 725m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm                         assabet_defconfig
powerpc                     sequoia_defconfig
xtensa                generic_kc705_defconfig
arm                            hisi_defconfig
arc                        vdk_hs38_defconfig
sh                            shmin_defconfig
parisc                              defconfig
mips                      fuloong2e_defconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
mips                 decstation_r4k_defconfig
s390                       zfcpdump_defconfig
powerpc64                           defconfig
arm                       omap2plus_defconfig
csky                             alldefconfig
um                             i386_defconfig
m68k                         apollo_defconfig
arm                        trizeps4_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
powerpc                       eiger_defconfig
sh                   rts7751r2dplus_defconfig
arm                      jornada720_defconfig
arc                          axs103_defconfig
powerpc                   motionpro_defconfig
arm                           sama5_defconfig
mips                     decstation_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
m68k                                defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
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
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                 mpc832x_rdb_defconfig
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                           omap1_defconfig
arm                            mmp2_defconfig
s390                             alldefconfig
powerpc                    ge_imp3a_defconfig
arm                         mv78xx0_defconfig
mips                          rm200_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
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
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220522
hexagon              randconfig-r045-20220522

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
