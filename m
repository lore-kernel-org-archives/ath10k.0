Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7D2C4332F
	for <ath10k@archiver.kernel.org>; Fri, 21 Oct 2022 00:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H4vWDlZBDttggtzcraLkNlGOW2IJpIb53DPRipUGSHQ=; b=SPBIMtluuvBGRe
	6yB0na8m+dmBGWAejtN/g43AvxvPLkVxltW2etQiydO5skkkjoqb7nZSmBpgAUT0+FGa1RSA9lpfQ
	fWs9+rr1MK/ciA+/tGNoL3r0jiVeIm1nVxbRuD9YArG0OqgZjaJQZpme42gadR8mxEnnlfrx/mrbx
	56C8AnLW403UrtELA5ozWNPn/ojeNB3eXPBpOa+tkw6aaJSUcdz7QmMHuSIaMA8FyXsaEfP3h/zbB
	Y6Jb6taUcpq6n3SYFXp6YW/zXGpAHHqychcsmZhfTbDqT3bvmJ+yalnckjKg4v2i7Hoe7QR2U2F3B
	gEM1V42reHc46bcp9EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olg38-0035ot-LD; Fri, 21 Oct 2022 00:38:10 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olg35-0035gz-Sq
	for ath10k@lists.infradead.org; Fri, 21 Oct 2022 00:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666312687; x=1697848687;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HWEs/w8N/P63yWGZGoYZreWC5BdQpbdcLvz8c+dUD7g=;
  b=VUxIXyFeWsV7fH0H3Zf5DndjhIxMTs4+DBxnWcNQyfQri9PQAUzVPMzt
   r3RJk19hsnQ0CT0fBofIb5FRLtsm5rBRNGKDwungd1rNp5vCnaU9+5Rf8
   dFpnHbVT+8lrl5P42ijbXecxBadC6uSuDDIRym9cg0KowJQlHF6ZmQTvN
   hIpI3eVQ0bvuFqtNe1oeS6K64QGIFy7370vO17czf1xKUH8L/fN7Ln26M
   0gFzI3IWgIrcBQWKtTVDhV0QNWG5Z7BYP2ZqfhodORR+Ifq6Y36dUQzwC
   d20PJl2u+2tSMzpyiKIzsl7MgaqlCbfzDTzt5gJkMp4VbtTe8jRlH/rBv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="304489501"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="304489501"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 17:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772711710"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="772711710"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2022 17:38:02 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1olg2z-0001tn-36;
	Fri, 21 Oct 2022 00:38:01 +0000
Date: Fri, 21 Oct 2022 08:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 116733763737b2631bbd4a109279101c610f6587
Message-ID: <6351e9c6.VoTbjB63qP6IUE92%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_173807_974018_2B376B3C 
X-CRM114-Status: UNSURE (   6.89  )
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
branch HEAD: 116733763737b2631bbd4a109279101c610f6587  Merge branch 'ath-next' into ath-qca

elapsed time: 2536m

configs tested: 88
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
arm                                 defconfig
x86_64                        randconfig-a013
alpha                               defconfig
x86_64                        randconfig-a011
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a015
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a002
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
x86_64                         rhel-8.3-kunit
i386                                defconfig
arc                  randconfig-r043-20221018
riscv                randconfig-r042-20221018
arm                              allyesconfig
s390                 randconfig-r044-20221018
i386                          randconfig-a012
x86_64                        randconfig-a004
i386                          randconfig-a016
mips                             allyesconfig
arm64                            allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a014
powerpc                          allmodconfig
x86_64                               rhel-8.3
sh                               allmodconfig
i386                             allyesconfig
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arc                  randconfig-r043-20221019
arc                  randconfig-r043-20221020
s390                 randconfig-r044-20221020
riscv                randconfig-r042-20221020
powerpc                 mpc834x_itx_defconfig
mips                           gcw0_defconfig
arm                           stm32_defconfig
openrisc                            defconfig
arm                       aspeed_g5_defconfig
openrisc                  or1klitex_defconfig
sh                        sh7763rdp_defconfig
arc                               allnoconfig
sh                            titan_defconfig
m68k                          amiga_defconfig
sh                           se7619_defconfig
arc                        nsimosci_defconfig
sparc                       sparc32_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221018
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221018
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
s390                 randconfig-r044-20221019
hexagon              randconfig-r045-20221019
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221019
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
