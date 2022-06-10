Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661D4C43334
	for <ath10k@archiver.kernel.org>; Fri, 10 Jun 2022 08:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xFMsfqwcMo4YOsRbx8AxdweieetnWUlxo6uWA+i3mfw=; b=E2rzZh0KPmB7VE
	xkOaz2SZq8sQJz80eFNTXvU5lnv2tGDRZuD/l0NWXEsrs+fq2aBlreSZnUDNYMuyHU/EsjXdCj7sr
	BOMA7J3HkqE5Xz5JPWfyDSMx6U9VlvmyWpkbwx69ocGs/evtHXZ1LLsvmbQK0PMOJ/A43KXSboq5B
	repJKsXta3rMRKXzAFGGg2/UV+LOdpdKa01ZHIl2QnPiiOVx7WJS32WwQzrx8qOQBXZIiORzHxImF
	JoYVIzij3G8c7KF9ApZtwWH5MfZQCIZ19l3qsJ8iVpEXMCh68pJ5wPX6aViNBghq8uBGMJE3aE8gw
	nPpQwJ5/8wuLDb/3Zytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZtH-006jpo-QZ; Fri, 10 Jun 2022 08:21:11 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZtF-006jog-Av
	for ath10k@lists.infradead.org; Fri, 10 Jun 2022 08:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654849269; x=1686385269;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NrofQJf3YtHtAMsI4OZ28j/JkNBmesTBapb5OgWq33o=;
  b=OO7dypSy8ZwVcih7NBu9DpmfGWvMFLed2ISgKZoL8pGsJNxS8PI40BLX
   IrRuWQX1VeoWWxtygIOEG3fHmvyZRqYNuGPEfNk4inGWkU50g6R96QUNM
   m9RV7c9ytly71mInVRVxoZrhA/0lg9JtWflfPXwrtuX7XdtiL8sIxitMZ
   3oJoZ9H8xUkBm2RG6Ar1rikuq9WmW+3nk3BY7GmcUC7WU5a4GFMfRJlnu
   UFVTMjFLKnfFmD8ot2K46uAFsXtcAmAMDaJLq8HB885B3auynAvSmXEoF
   3VwPCus7ugf1J32tQaZIyL68iiUMmfs/KyeYPoY+7FRgFG9I1cSS6QyHX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278697856"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="278697856"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 01:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="616389112"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jun 2022 01:21:06 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzZtC-000Gq7-3U;
	Fri, 10 Jun 2022 08:21:06 +0000
Date: Fri, 10 Jun 2022 16:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f109ecc75f0a4d5d9bffac220968edb2c91df35a
Message-ID: <62a2fee1.YyR98akdHC0fMUpB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_012109_476529_5E63187A 
X-CRM114-Status: UNSURE (   5.66  )
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
branch HEAD: f109ecc75f0a4d5d9bffac220968edb2c91df35a  Merge branch 'ath-next' into ath-qca

elapsed time: 2871m

configs tested: 76
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                        clps711x_defconfig
m68k                        mvme147_defconfig
arm                          simpad_defconfig
arc                         haps_hs_defconfig
parisc64                         alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220609
s390                 randconfig-r044-20220609
riscv                randconfig-r042-20220609
hexagon              randconfig-r041-20220609

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
