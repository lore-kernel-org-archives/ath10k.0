Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A5BC4332F
	for <ath10k@archiver.kernel.org>; Fri,  4 Nov 2022 01:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PgOkVnEGFMjNYmkz3rQxk75AUR4qLpd+nJv5yj4ZQSU=; b=4exuH0qvYF5/E3
	7svVxcV8CKqEgNn1kxhKCpliGwEH3lFCDXWLvnOvOUcS12dr6sTqKLoKarAw8zAn47N5X/j3ovbyv
	BmMmJ/LWj+3btyi7lDpFX2NrJtdHxmMjRwWCqu2H7GeJkWHdodlntP9UKWrwHekoZHoAItF+cr6rs
	5yy5GJ9Y1FrJpqiChyJcMhcSIDKUfY/pZffAArctF0u59noBm6ZjzPfMOC902iSLdSGm6MqKbXiHV
	Pr51OU0vtKjSGdIUwMRQIUCl8LPcEXPSkJZOcWJMedqSZWavApt4qFSmfpb5FsCWRf4H4ZkOc4oZ5
	5Zl4YSSypiLr1KIusOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqlM0-0027JD-Tb; Fri, 04 Nov 2022 01:18:40 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqlLx-0027Gc-5p
	for ath10k@lists.infradead.org; Fri, 04 Nov 2022 01:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667524717; x=1699060717;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+i/CHfccUwQOp72gDxg7+MXP0etMi7mQbWgH5Znai4s=;
  b=krLOoHFESoykc832wtGJXkl0qplyKZCZgr4JI5vPPI8PnUK3kUN8n50M
   HgC/HXzhBeXbPoQoAZ2zbyzglQ2oJl4YHNTvyVwpEqlNh5Pfw0oXr86sJ
   J6PKuZ4SZpHdEKUtSsOgZEON8yvD0yQ58iYwV6WFeCv3xxujHCQX/SML6
   A54f/NO//qeQMRqN0wG0ViiJ6DAc//7gsGMp/zuYDO5nNcg28Z8Lt2CFy
   WyN/uaynaSlWZTvws9DRUqy82oEjIs7o0zWv45GEmB10xZqcvyYLuFMm6
   ny7Q6iqQtDZO2yztuZjpIsHyFXQ88DtBP7Mzh/h+qUdqOGj6eyvZ3NiyG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="309841733"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="309841733"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 18:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="964161710"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="964161710"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2022 18:18:32 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqlLs-000GUP-06;
	Fri, 04 Nov 2022 01:18:32 +0000
Date: Fri, 04 Nov 2022 09:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 392fb05441765a71064bc96fbfb2b3bacfa70094
Message-ID: <6364685d.PsMs/0Jd29ckgRxz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_181837_303975_54E3DC4B 
X-CRM114-Status: UNSURE (   4.42  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: 392fb05441765a71064bc96fbfb2b3bacfa70094  wifi: ath12k: Fix invalid management rx frame length

elapsed time: 724m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                              allyesconfig
x86_64                              defconfig
i386                          randconfig-a001
alpha                            allyesconfig
x86_64                        randconfig-a006
m68k                             allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a003
i386                                defconfig
x86_64                        randconfig-a015
i386                          randconfig-a005
s390                 randconfig-r044-20221102
x86_64                        randconfig-a013
x86_64                           allyesconfig
arc                  randconfig-r043-20221102
x86_64                        randconfig-a011
riscv                randconfig-r042-20221102
arm                                 defconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                          randconfig-a014
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a016
i386                          randconfig-a012
arc                  randconfig-r043-20221103

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221102
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221102
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
