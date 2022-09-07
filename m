Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC8BC38145
	for <ath10k@archiver.kernel.org>; Wed,  7 Sep 2022 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z3X1k9UaTAssBbvdgyBvCJFjHsr5eDwUf+HVu0agIDM=; b=VXmqG7exYeTlS9
	mXeZKd+jOrobUht8L5XJLiDma88hjC80xBdGvjASQnj+7OSbdH9Wq5AFu8xwhoBBVqnAVfEwR5J9/
	zmExirAZ0z2KIQiLsbIcTvCVo6cgOxXvqUKtyZMtYlFBTLSJT7/GMmJGx69DIKNia1OIBvzheDfGw
	u817JL1ayLEFMkLlK2ho1vXNsEiXraP8vBDY8sVxuZ32LBWl+Dk4m0OQNoif4f1lIvvRgq6r+Czfx
	sBv/2yBLVk7yncLAgKxeGKounNu7NqB2ddwEYh/8zqT6dKEbVcPkwJX/e9qcyzDeALjNP4IeKeg6h
	iZoY/DgxWfAOtVEwsJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW2eK-00A6M8-Vk; Wed, 07 Sep 2022 21:31:56 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW2eI-00A6KC-FM
	for ath10k@lists.infradead.org; Wed, 07 Sep 2022 21:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662586314; x=1694122314;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PPUbYQcmKkdgSVTShH3Wn3OGghtRQjwWly8m7oOtOxw=;
  b=fvrbDiEHBMggh9qCc0SRFZOFMhKADwZXeZgJ2SB6L4Q3cPPyT5ZwouWX
   y+fTYQ3MKFtCrD2c2g5B/U2xr/2MOioDnwhFxupe1N94GupE/N3Wb9mId
   ZVWENdfox2RwgC6Q+V5umUM0UpRaLe2SviCcwbu95PgoArzMiFyxDpoKl
   l5LpBUqd8/AgWfehgVz7DT2BY0W6TSMblBuaDRjsC30SaPuoeCa06YPsO
   ugmmvvO2kO61nZAFh+E2IBy/eOZqvN2bCj/fXAz/jpdLoVYUqk7xLZjeH
   XLVWRWuCw+PhxoLe/9glN0cEvayswYMN99k7PBxGyJ1ddinhqShE0SQkt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="276739006"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="276739006"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 14:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="644793049"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2022 14:31:32 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW2dv-0006yX-2p;
	Wed, 07 Sep 2022 21:31:31 +0000
Date: Thu, 08 Sep 2022 05:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 46483e4c7eed0ccd4beb884b884df9c7c8a8801d
Message-ID: <63190d9f.aJ3kCKQ4xqQTt+1b%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_143154_713424_9B9B7D64 
X-CRM114-Status: UNSURE (   4.84  )
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
branch HEAD: 46483e4c7eed0ccd4beb884b884df9c7c8a8801d  Merge branch 'ath-next' into ath-qca

elapsed time: 771m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220906
riscv                randconfig-r042-20220906
s390                 randconfig-r044-20220906
i386                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
i386                          randconfig-a014
i386                          randconfig-a003
x86_64                           allyesconfig
arm                                 defconfig
i386                             allyesconfig
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arm64                            allyesconfig
arm                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
ia64                             allmodconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
arc                               allnoconfig

clang tested configs:
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
