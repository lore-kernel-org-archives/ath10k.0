Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBECC433FE
	for <ath10k@archiver.kernel.org>; Sat, 29 Oct 2022 04:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ny1Cqu3tl7opDtCYuWUEqUla6AuC7oj5BuQ76IgNP8Y=; b=IXj1GwFNW5umGE
	7A9yVV/Jws6rauYZD1/p+PZXfLgI15sfgL4w+2EEHdoHjghn+WOo9PhqzV3JCgtXtKrMNdjJOmuon
	JCHKM1Avg3BuIZ1h1CLdgOFpYZ0hFRoS6vCSQfjZr+wWxCN9CiWGZ61Yep/7ip2t1uR70OECbhaK1
	+3Ab1w7g9tFQO2wUx+XDcPiJqf5IQDydbp5xAvtjniW7vaGkNd7CJEloS7/vVYRclMU64X/5S1tQc
	GbNf8Eg9b2jt97ycnwx0I4TlxTfYZaOLugVenHKsWbCQKT4F4ckFRVy8guKmWeUP0GBtxvfBIjKo3
	kPRgDVepawgTx8pe1HsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodqo-004dn8-IE; Sat, 29 Oct 2022 04:53:42 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oodqm-004dmo-Pj
	for ath10k@lists.infradead.org; Sat, 29 Oct 2022 04:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667019220; x=1698555220;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KcAZPMp+31ksKaubvfbi3lusYD7bBJFQ6flE3U53TB0=;
  b=OW10X5i4dyA6iUs4Q62i8ZgBd0fHFxSHeqRq1aZsw2auWENstbh5hb8B
   NNXJiWn+AYxcuE6vuifPir+NO71rI+sRDNj/jl1ltICz09kyD4y4jyYfF
   0gKX4De9izcfDVKPQxTmHu1lGx3C6bttf3lSz7hPsc9HFC0l9mbKPgm5x
   WZgpx/fPDRcLNL05dNsv8yzq4/keVnBmoONcYsvubraoUxfbt5wcLQiD6
   n2idt3xgX29g2bhDoH1X9eiPk7MnpP9vMiuhT7erv7K7jyo3IOXedGryW
   uVEsbrCIhsujBQgtdaCBY2UjY14Ee5X1WFeamObv7X7BBAI0dMBk1eKAb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372849095"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="372849095"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 21:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="722282409"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="722282409"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2022 21:52:03 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oodpD-000Abk-05;
	Sat, 29 Oct 2022 04:52:03 +0000
Date: Sat, 29 Oct 2022 12:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 cbba17b126445349674c2f7ab41f2882957505a1
Message-ID: <635cb157.vbffIa25UGEs/P38%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_215340_904573_55D23E4D 
X-CRM114-Status: UNSURE (   5.07  )
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
branch HEAD: cbba17b126445349674c2f7ab41f2882957505a1  Revert "rtc: cmos: Fix event handler registration ordering issue"

elapsed time: 721m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                              defconfig
s390                             allyesconfig
i386                                defconfig
m68k                             allmodconfig
powerpc                           allnoconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
x86_64                           allyesconfig
arc                              allyesconfig
ia64                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
arc                  randconfig-r043-20221028
m68k                             allyesconfig
riscv                randconfig-r042-20221028
x86_64                        randconfig-a013
s390                 randconfig-r044-20221028
i386                          randconfig-a005
sh                               allmodconfig
x86_64                        randconfig-a011
mips                             allyesconfig
i386                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a006
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
i386                          randconfig-a014
arm64                            allyesconfig
i386                          randconfig-a012
arm                              allyesconfig
i386                          randconfig-a016

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
