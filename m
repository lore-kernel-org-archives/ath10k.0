Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8092ECAAD1
	for <ath10k@archiver.kernel.org>; Wed, 31 Aug 2022 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/R8zeN6WromDhENyqqRfJaOmeIrwzkv6gRU4hz6Vm9s=; b=MMh604l+K/EQ10
	Nc8IvM1OTCWREv5bDcL44bk/uXx8wV3561PELxIomAVYyZ6PzYm7FSaVih+mP+KvKX7sgiPsZZ7Fe
	bHH9x7YYKuzAAXl61on7oQ0LmBUQOahnsNK6gr6UkvFLdrdgt3kE6O7QWiBXcpcJsGRiKW3xIlxz9
	w3YE2msx14AdnD07KEU0R2z91rbjF1Qu8tULoPS1tSY/CWELl16xVZGkfiq8SaKJaFxNJ0CG05hUW
	85SVucCv621UFEULVoRbR8CRddWc3egpR+qvxW+fsphneiWf6NLifc9w7UJfHDKGqW4Aj5wo7goQc
	w0A6eB2/q0SroMTPMdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTU6a-0086zH-W4; Wed, 31 Aug 2022 20:14:33 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTU6X-0086yV-Lz
	for ath10k@lists.infradead.org; Wed, 31 Aug 2022 20:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661976869; x=1693512869;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tXCnuZP5uLNf//ytNkAm+MwexRygYMp4DqAH1a1wYag=;
  b=cSELCctU5VkOPJ+pyVKFmYp8BmBlk7qgTFpzIkhabpJuUkp59CDfMY+a
   c9bcLmzhEuM0lh1ZQzfgGRP4l+G16Nzw2Rn7/NGZ9E0KX7b2/8FOxomY/
   1x/OXCb0cDI4OjbO4Q8pU+lxLWHbWRD2XgAyubmmzlwppQxNn55Fmqj4J
   cPTmEhut5oif3W5Tjyrniwg4Zw5VgxRq1zhzOJr++StbrsN/2TZner8A6
   2ITPEWNfNunr45oX8U3MxpGaCOtknzshADsZNIfRPWtIbso/GSqv8lB2G
   5ybbtfq+zWOiKaB686ZcEjxSoIQKYHLc4JN0ST0XOynNp8AsxM7rf61RI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="278553079"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="278553079"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 13:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="642014431"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 13:14:26 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTU6T-0000fa-1h;
	Wed, 31 Aug 2022 20:14:25 +0000
Date: Thu, 01 Sep 2022 04:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 2c9251dc2b505465f684e080fa48c548046d0c04
Message-ID: <630fc115.I7rK4aX5QIrm62HK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_131429_793106_65784694 
X-CRM114-Status: UNSURE (   5.65  )
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
branch HEAD: 2c9251dc2b505465f684e080fa48c548046d0c04  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220830
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                              defconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
i386                          randconfig-a003
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
powerpc                           allnoconfig
x86_64                         rhel-8.3-kunit
powerpc                          allmodconfig
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
mips                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
x86_64                        randconfig-a015
sh                               allmodconfig
arc                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
alpha                            allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220830
hexagon              randconfig-r041-20220830
s390                 randconfig-r044-20220830
riscv                randconfig-r042-20220830
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a013
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
