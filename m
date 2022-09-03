Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD4DC6FA82
	for <ath10k@archiver.kernel.org>; Sat,  3 Sep 2022 06:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5SIJ9tMaNqL4OLecrEDsywAIw6B+X3nl9xFxonS6wcY=; b=Nfp1Nd0AUugQ5l
	NcXm9TwCYVweTMfXOs2swfnRBf7Mmg61rFosCbNMbwhIK9yxWUBjLVuX4LWIRrT1IJMBQlHs9v2eo
	Mf8HLQyLssGD02PsnYr8GLVUyKMnU98MLpCuanpppFdmMpA/S0q+ZKREQ2P/zET35IOoZxRIctpA4
	D6vX+qImaTA2GvSi2I4CgF8JioKuL9RAUne9CpPRV91upTVLikLt1o298i0xPtolymY/ogkZ1zVJ0
	9mqbfYUwcPkDL/Yk+wZERUVW2zcfqurdA+qkHEymc+uhGDwPQs2cS/EsERw9E95fnzKMmu8MRR1k7
	eLSCbWJpAaJ5vOvCW0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUN4b-005Mpr-TW; Sat, 03 Sep 2022 06:56:09 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUN4Z-005MZX-4U
	for ath10k@lists.infradead.org; Sat, 03 Sep 2022 06:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662188167; x=1693724167;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E4JwOjDeX+uhxdMZcnDhCH6sSBS5vuzPwOnotVlEWWE=;
  b=RMlWzZwHCbrtw0OaCb+KFWb2CAmM8ZyMfw0luUY3VLAfECQ0r31cRVBe
   ik9YTG5vbebkkBC05MTArB097shxN0ovjWloUyACwguX+XOwPWgJ/BFh5
   z3N8lBIM9JcVhD6tgI/DPltuKoJ5G3NLMlC/9LlxqYmsgrCNyLkBTmhxT
   Gt9+5AGRFKOBwtkH3Lknw26bO/iV6lYz/M2iiNATWLvH7NF4Snxl+aoP1
   Wt2Hl0VaL7G/Kgs5vzvTFw+wYxpDCkQULQM3+4OXE57kPLwNARmDhbFgu
   b/SdELCHWEKKOF4NZFkmyZ3ZR3lHofwkumSEOTz7pWPT/eoqgkWb0bqtp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="276535352"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="276535352"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 23:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="716774921"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2022 23:55:57 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUN4O-0001DV-1V;
	Sat, 03 Sep 2022 06:55:56 +0000
Date: Sat, 03 Sep 2022 14:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 d62aad376a62462d7b236280a11615f6c0bd7b33
Message-ID: <6312fa6c.MwYelh6VNDJzB6Am%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_235607_251970_EBC95CA8 
X-CRM114-Status: UNSURE (   5.73  )
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
branch HEAD: d62aad376a62462d7b236280a11615f6c0bd7b33  Merge branch 'pending' into master-pending

elapsed time: 1030m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20220901
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                              defconfig
i386                          randconfig-a014
x86_64                               rhel-8.3
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a002
sh                               allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a005
m68k                             allmodconfig
arc                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220901
hexagon              randconfig-r045-20220901
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220901
i386                          randconfig-a011
s390                 randconfig-r044-20220901
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
