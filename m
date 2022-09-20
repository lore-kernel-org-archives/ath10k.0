Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB735C6FA82
	for <ath10k@archiver.kernel.org>; Tue, 20 Sep 2022 01:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dczpAAmxiFRBXzTWY3SHgrN5OCPPTdl0TBRks3OiYqM=; b=N+nDEUKhPjqZHy
	hZVdlTiUK4NTPSNQouZqQS6Q+2uj5+c79uN96yWRH+JeAbRaCoKD1kKua6F1dCq3PvARlIOotpiCf
	e748UFU/FSGdEzcpD6WC+wpt55uB4dI/NQKkQBMyjn6fsd5kg5tAqpxGyNNZog4+/5DGoaksfIypT
	Q934z/Ai2M7JcFwAYhnNYWiCFr0sT7BeeY216gweKLvNZvhAblwznMzGgV+iA+73fpHXYXbyyCzcH
	n9sHUc7AO4GcdqAguuyB+bJabelr2kqfx22J+N0zPs0cSYgQoYJVHF5nZ+6NqxT9OhK/YRNjhAwQi
	uWNgJtv7QH4jqfI17iwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSFr-00H4Of-Px; Tue, 20 Sep 2022 01:40:55 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSFn-00H4LH-LJ
	for ath10k@lists.infradead.org; Tue, 20 Sep 2022 01:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663638051; x=1695174051;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sUspua2rd9QLg/6RnOfEm5MKz6AYpoVgv9ixyHKy3J0=;
  b=BYBRqpixyjFB5SX72pE2EjzLvSJlP2UTC0xKV/2GBuxQuH0qZ7nWoj8H
   JC7onuC2cmKTZt4YebKa5F3F0MwAzm09NTNRI//Lby8+rulIgOf+9HHQ7
   9Vb0+6w/zeYqBmvMoUkIaTo4tWC+2HfpJe0WenBO79x7y0GlIDam05CeW
   oLIfAH4ZGs5nHNhwoPm3Q/+uV3lgUjG0IObJS+okRrWgU+nHGetTjDXuk
   dkgUFpNbDIbO7vaGfknWvwuXOBq9ah83n9ZluaC9yfSilOEfIjEYC7MTR
   I4LEgPGntMfdyCWy+EGFBResZ0rTi8iATsBCiXrT8N3WbmSjfdet+t9LB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="363524903"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="363524903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 18:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="947460366"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Sep 2022 18:40:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaSFh-0002NF-0V;
	Tue, 20 Sep 2022 01:40:45 +0000
Date: Tue, 20 Sep 2022 09:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 35418cd7700ce84694595220342c8e7c28e39d79
Message-ID: <632919e8.Ue3YCqmOq0JbSZ5J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_184051_769887_CE198357 
X-CRM114-Status: UNSURE (   4.76  )
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
branch HEAD: 35418cd7700ce84694595220342c8e7c28e39d79  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                  randconfig-r043-20220919
s390                 randconfig-r044-20220919
riscv                randconfig-r042-20220919
s390                             allyesconfig
mips                             allyesconfig
arc                                 defconfig
x86_64                              defconfig
powerpc                           allnoconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
i386                 randconfig-a013-20220919
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
sh                               allmodconfig
x86_64                               rhel-8.3
i386                 randconfig-a012-20220919
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                 randconfig-a014-20220919
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
i386                 randconfig-a011-20220919
i386                 randconfig-a016-20220919
arc                              allyesconfig
i386                 randconfig-a015-20220919
x86_64               randconfig-a012-20220919
i386                                defconfig
x86_64               randconfig-a016-20220919
x86_64               randconfig-a011-20220919
x86_64               randconfig-a014-20220919
x86_64               randconfig-a015-20220919
x86_64               randconfig-a013-20220919
i386                             allyesconfig
ia64                             allmodconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220919
hexagon              randconfig-r041-20220919
i386                 randconfig-a001-20220919
i386                 randconfig-a006-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a003-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a005-20220919
x86_64               randconfig-a002-20220919
x86_64               randconfig-a003-20220919
x86_64               randconfig-a001-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a006-20220919
x86_64               randconfig-a005-20220919

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
