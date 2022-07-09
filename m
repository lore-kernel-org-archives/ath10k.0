Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3ECC43334
	for <ath10k@archiver.kernel.org>; Sat,  9 Jul 2022 02:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WocIi0tACyeXlDXquQBfc0hLOe2hGiVhnh+dLK4Iw68=; b=iVWPvm/HhjRrYy
	ugmxCnfyVLlXasYwn7WKgKxUYGuTTfchM1/T2OY5KaP+ltZ4FJsdKYa1D2/417yA21jHDOXDok16A
	C8n1EeUxIWax086YOIRqccnspP9wzPZnLsS8mQPsfsJI43a2rHmI1SNMX9VZisN+osL1ewviX/ciG
	WiLzo20cTtyMQxfD5KsZwxZcJgLZKzy0zJ5NrXgyIRNEFtPe3pnRPGR+VIxDWPJ1SCdaFlN185DqY
	zTu1lvSPVcEgLLU7kHLrr0ipJ0d09yUWDx2+nZz7D3S8z8BjR9l0bEUFD3Dza9cXKgycj+EsaKCej
	LTLMNZdaYN8gkTqYHz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA0KX-006lil-I1; Sat, 09 Jul 2022 02:36:25 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA0KU-006li5-3U
	for ath10k@lists.infradead.org; Sat, 09 Jul 2022 02:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657334182; x=1688870182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mT/bLdgNOZ5K3oNWnSVszE/qtuHbEmqLVP8PqkWEk/o=;
  b=JP8iwMalkQmX5ZXH8HePTSsLlczrVziYnfrzSmq0XRLrvYXPgJshKVrj
   jafGlAcxLQO0RzBAQg93fqH/uo+gz4YYJywAgPCbA9wh3hmpgzmp61r58
   qOqJjPHexrowRqQvRX4dOKoX8f+cZUWq/SdEGfESLTus4+kXTz1/BD54q
   EpE8DTFYziA/KA076oGzQiknAsOAvicLB7NpzJ5PiGtM9Ljw2rOFNJHi6
   cTuYGldUfJ1CObTOGKDRCCjGa+qBaPZ+R2rCbw2zuRfnP9vZqp/e8Jy2m
   pJwl9EZj1ck7kbbsc2jOsrmLI+lpAkB280foMzc94+1CCoebDV4nWwQo/
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="346086968"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="346086968"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 19:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="661966383"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2022 19:36:18 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oA0KQ-000ODC-0u;
	Sat, 09 Jul 2022 02:36:18 +0000
Date: Sat, 09 Jul 2022 10:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 991968bc7d7533ebc1c6e56d45d3ca002d5aa664
Message-ID: <62c8e97a.i0Xn00lv0OKty0Gh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_193622_219160_7D22EBCB 
X-CRM114-Status: UNSURE (   4.86  )
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
branch HEAD: 991968bc7d7533ebc1c6e56d45d3ca002d5aa664  Merge branch 'ath-next' into ath-qca

elapsed time: 727m

configs tested: 49
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220707
riscv                randconfig-r042-20220707
s390                 randconfig-r044-20220707
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
