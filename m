Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17905C43334
	for <ath10k@archiver.kernel.org>; Sat,  9 Jul 2022 05:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cu1mwdvbLhoWNeZCMi60PMbDLQzIIuruMVEvvv+6elY=; b=X/GBCxK4xzIkNm
	UtO0cQ8SVH/naYdY1I256PgxbyKhaYvyIksFQyW2x6yE2nNy1rJK3P9chqqoE/X7NP0jJRv2rhrnJ
	vZw6L7tBPot3v89pMNG4khb9X5556zw+MxHHBr4g1RVfyQxiE343CSEPyS6C1Oo867aGTXsYO7kw3
	QgYOrnjVwQPz4EqafdTtFuvHQuxErERl23E/A9b1B8rduQIo5lsNSot7bSwIie+5kSVtn4i+gPGWb
	40AIGFSFgCDsglKGXF9S6cQFaXErAOWASzWvCZuw2CD27YjAYMBIQVEeKE7++54JH/cHVd97rGS21
	ow5Soy57Hvq8PL3Z9LAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA3IW-0075Cb-Ta; Sat, 09 Jul 2022 05:46:32 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oA3IT-0075Be-DG
	for ath10k@lists.infradead.org; Sat, 09 Jul 2022 05:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657345589; x=1688881589;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gGM1ra0IkiTKON7sJ1shctfOjAoH7UTWu/v1T4Ore8I=;
  b=dyXi2DvsHcNw6iCP/Dht3dc0XvPo3rMpKtIrXqIbo9W1j0uomWiyd4ba
   6nYjRUdhzTZiz4AEEa+308ZS7cn7wBpzzC1jd+OXOZHi1JH83FQQ8SHNr
   NPycA2PaEPCRYyx2Qf9Zb15fLlxqM24c8drIJ988NkWp4IQebquMRTrfB
   tY9MECL9fddeKLhcFd1sZCrTuERO03pKu7/Khsbunk9breLycNeO3XJaG
   VBrGsZCYe+hzhQYlaQl7Ir0SdwyiWVOFCsGEjsftpNXBrYquYtnuTQkfr
   n0Wm0e6qOiC8lvXAHTKv/joNfGeiw0b2THpZOpcGnB4clA+CV42iviw3h
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="284433073"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="284433073"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 22:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="569185014"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jul 2022 22:46:25 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oA3IO-000OMe-RP;
	Sat, 09 Jul 2022 05:46:24 +0000
Date: Sat, 09 Jul 2022 13:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 8ee67773f96c642a89eeb01cc49ca0f12f5db662
Message-ID: <62c915f5.xfnVtK5T5nIUYzEL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_224629_488224_ED6E4C1A 
X-CRM114-Status: UNSURE (   4.21  )
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
branch HEAD: 8ee67773f96c642a89eeb01cc49ca0f12f5db662  wifi: ath5k: fix repeated words in comments

elapsed time: 724m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
arm                            hisi_defconfig
powerpc                     taishan_defconfig
parisc64                            defconfig
nios2                            alldefconfig
mips                      maltasmvp_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220707
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
mips                   sb1250_swarm_defconfig
arm                        mvebu_v5_defconfig
powerpc                      ppc64e_defconfig
hexagon                          alldefconfig
arm                   milbeaut_m10v_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
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
