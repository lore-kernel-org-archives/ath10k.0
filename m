Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369DBC07E9D
	for <ath10k@archiver.kernel.org>; Tue, 27 Sep 2022 04:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DyYFb78Fl+NyRgoWlgpMuzoZUxZ32KPq3irgXFBo8y8=; b=l1hAAQvWdslMRo
	kdUUcCOmkjrMSerfKXxxKJm7EJOZwgMtvmi6WHdbdwEaNMx7s7fj2xzv3NEW5n98LJ+rpzjTTFNLy
	c0Uwd6vH8Y/QYKyUEV1RoyN0DRvdDsWm6vs5+R2BCpKiVWsg7dubg2QkWD3T6NaxnibKtz43iOx3g
	x2XR5lS+bczAeYksQ4krj5AB9xRiTwa8EpcMlA/VNp4LV38fzLDimyN/iSRq4C5n0d/GvZomihOjb
	kjfDx48g72TGa38MC2qvOe3N1xzmqmjrxEo1gn53y3d4+XrMut/1CN/SD+Xf81IT1OR/VZ5nm54eo
	TQ38eVuOUZ+1aiFox1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od2Dx-008Fb5-9g; Tue, 27 Sep 2022 04:29:37 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od2Du-008Fa0-9f
	for ath10k@lists.infradead.org; Tue, 27 Sep 2022 04:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664252974; x=1695788974;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jAUC9GP/0pYYQSAgFtM5qi6H/xlhFr6YTYKkIXWjQKI=;
  b=j8X94X4eYv7U2/yc1De6upOcnD/LYvhEvJjNi6mGAwy8ipO61uIzH9Vk
   r7/ONzM8YkTabkECIGpCWvkH/aIEPPyJS0R/M/bff7YfOH85yqp/COhSM
   WW8LFhaiZ81oYWF8kxQ4HYuKydil+f/m9A6sB4dtTMSeHT9YZ6VOQJw+V
   DzTsMoqrlhcDqroLzBfiLfzMDzLPPzXOSVIr7h40hAiSy3bJzUWSdJllb
   Wszu0wzmFDEZgVWVUxXwGs6W/dM3PTXAnNXeQuaMijfFmAa72CAlxjo0n
   LZa2SvVf0/eJVEmhYCZlWTXKxqte4JaatGwOZOVUhd1Qr7DRAnHwybA2S
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284334335"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="284334335"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 21:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654579089"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="654579089"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2022 21:29:24 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1od2Dj-0000b2-11;
	Tue, 27 Sep 2022 04:29:23 +0000
Date: Tue, 27 Sep 2022 12:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 1a458fd07d4706b7f6fa47a0ba9727de4b953626
Message-ID: <63327c22.sJNfMt98orzfEWPI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_212934_456449_42BC1565 
X-CRM114-Status: UNSURE (   7.41  )
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
branch HEAD: 1a458fd07d4706b7f6fa47a0ba9727de4b953626  ath12k: remove __packed from the ath12k_skb_cb struct

elapsed time: 725m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
x86_64                              defconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                           allyesconfig
mips                             allyesconfig
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20220925
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
i386                                defconfig
riscv                randconfig-r042-20220925
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
x86_64               randconfig-a002-20220926
i386                 randconfig-a004-20220926
x86_64               randconfig-a005-20220926
i386                 randconfig-a005-20220926
x86_64               randconfig-a004-20220926
i386                 randconfig-a006-20220926
x86_64               randconfig-a006-20220926
x86_64                          rhel-8.3-func
x86_64               randconfig-a001-20220926
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a003-20220926
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
i386                 randconfig-a011-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
