Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D67C352A1
	for <ath10k@archiver.kernel.org>; Sat,  3 Dec 2022 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tmrLJ8wXomD5Sythhfur7EzicXXqohdrgxnxirLSZqE=; b=0Q57cqyzKuYYLV
	vC4QNS1euQ2C22tLnADvyCPs5+ZsuyVUT/lKVXYnTcuC/WU9dGHQbzyMw15/KJU1DtZ46E556Q5Xd
	Ux//9YF1BCBmw/6+Mcpcl6zPI3gjCJFQmhmDBMBlMEUENslCsk5/PFa7Fnu5H11JKGsfG161Gu2vk
	CrmppEU8qJ30sEOQP/o/0I5qU6loDVXRt44qVgtT4ouXvZUezxg41tlX6q1sSBq7PKXRioHEHo7d9
	kYmWganBsdUziKcOiIXY9dZJJFPzRNDuErFrRD1LD37yAWfLy67NDMKRuHsD7LSkYPXr6EIsSn/Di
	tNLARhyzehUZuwZTcL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1PEQ-00311v-RU; Sat, 03 Dec 2022 09:54:50 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1PEO-00311N-0O
	for ath10k@lists.infradead.org; Sat, 03 Dec 2022 09:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670061287; x=1701597287;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hq6JAdxc5DDKRjuVIvsbgxWt9AHf+zvS4l+zbLp9+gM=;
  b=JfInhe0kmO0GeTAoVqCRve72B+HXDORYjML55xP6fIaPOndhM9J4ce1E
   k243zNt0E+ZAGZazGbmCl7xmO1pTCmaxgyVrcYnJve4N/1J4BpjctKwwl
   zy9fR7BJKgZDEYyHSNh9kWGwKZxcnH+lOeFKk2FIjd2J+QkDrlqyCxXdM
   trtdL7Z6a398KiWJmQqMOmO3s1Fk7VGy2891aMwi6EYxq5oOCJgSh7anr
   KUceH3bVUxctrhMx57OnlxRY2EhZq38LOHkHgq4wDCwooevE6xX/LrKK/
   ZmYmObMyzQsbfZ8Kfu5XBiw1JQrKW5slbkEqrKAt9a997kvPva8i0IGt2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="317967653"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="317967653"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 01:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="645297455"
X-IronPort-AV: E=Sophos;i="5.96,214,1665471600"; 
   d="scan'208";a="645297455"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Dec 2022 01:54:46 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p1PEL-000ESh-1t;
	Sat, 03 Dec 2022 09:54:45 +0000
Date: Sat, 03 Dec 2022 17:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 a0196c72096ca08ede797ebaa8ed18d3b8f5cb69
Message-ID: <638b1ca8.zCeILRZi9OkPAQNa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_015448_180728_4A1519F5 
X-CRM114-Status: UNSURE (   5.11  )
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
branch HEAD: a0196c72096ca08ede797ebaa8ed18d3b8f5cb69  Merge branch 'ath-next' into ath-qca

elapsed time: 727m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
ia64                             allmodconfig
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
s390                             allmodconfig
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
s390                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a001
s390                             allyesconfig
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a005
x86_64                               rhel-8.3
i386                                defconfig
arc                  randconfig-r043-20221201
x86_64                        randconfig-a002
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
x86_64                           allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
i386                          randconfig-a002
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a004
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
hexagon              randconfig-r045-20221201
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
