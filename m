Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF436C6FA82
	for <ath10k@archiver.kernel.org>; Sat,  3 Sep 2022 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x9l4a7wopK1kw2p0PlOL1vi5kb6cKFrBZ+1sz3Uzt5s=; b=UAWYXnuVzxiqn9
	tPNvaLyRf296LHsLM7XjctTTdov0CBVcB6LX+VGI9tLxl8QCnMxPv8YBERvE8D6HvpfPwtXt2Bvxa
	wxleLCiX+wudTVGdxLKqwrngSv3pPA70xPVFQDNEDROAnF00SKPpobfNe6IWKag+H7F8QmXvQTL75
	NEsiS+YWPRGX8/Zxh8CNz0zGfmLk5V+IRYo2y1iMfR/y6sl7CerHBqzVy6XVE1rtnTWiXEddXjTNi
	WmJqe+N/uro/Q3d1r1RtQ2spu16V7JjFaH6h9+J3qIyCXZ70ypchy4kdfS5ZuYdaeHzZobX09VySY
	3afP7hZIqJXTbGbPPIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUOcQ-00731q-AH; Sat, 03 Sep 2022 08:35:10 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUOcN-0072eq-I8
	for ath10k@lists.infradead.org; Sat, 03 Sep 2022 08:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662194107; x=1693730107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0OZJa25zGWVN2WBmmt03/D/3+vrvZmKs09uBm0+SL4g=;
  b=A0CdOZCZmnQc9iQyf775P4D700Ynn6CwPJZsE2MRGYA/o6KIHvNNXGgB
   0M3kJze8y/TJfeVaGspDQdcVbBp+wVkLlWZrgsNSnVYAPmGGrYTZfFJ4W
   kxC54fFvkc9fE9AS82LSuRPu0yozYQze0CEOl9LC0pjfAy9DwfYjbJlH/
   hdzcTemkP5LUixZM4ntZdfq/3imUY8aJ5QO3f9ekpeMNVuTqR/bmXQYE9
   qNCfYxy+FRAbkUhHbSFathcLK82f/gbgvW623MOZv31R6gDl8KHlRTkU7
   TFeaSdzMkM31Ytyu2+1ehHTyGCls/fFpLCDxvbpEr/JrtNpPJZYoVYT7u
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="296146950"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="296146950"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 01:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="739106103"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Sep 2022 01:35:02 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUOcI-0001Iw-05;
	Sat, 03 Sep 2022 08:35:02 +0000
Date: Sat, 03 Sep 2022 16:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 77a869c75311b84ba990c828601174601c87ee9c
Message-ID: <631311a3.P6JMzOyRaGjHpUaM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_013507_679907_8CB3E499 
X-CRM114-Status: UNSURE (   4.75  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 77a869c75311b84ba990c828601174601c87ee9c  wifi: ath11k: Implement sram dump interface

elapsed time: 1129m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220901
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a013
m68k                             allyesconfig
x86_64                        randconfig-a011
x86_64                              defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a014
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a015
x86_64                        randconfig-a002
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                               rhel-8.3
i386                          randconfig-a005
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
i386                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220901
hexagon              randconfig-r045-20220901
riscv                randconfig-r042-20220901
s390                 randconfig-r044-20220901
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a015
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
